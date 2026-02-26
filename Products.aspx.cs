using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationWstGrp26
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // initial state
                txtSearch.Text = string.Empty;
                pnlFeatured.Visible = true;

                // ensure brand parameter cleared
                if (SqlDataSource1.SelectParameters["brand"] != null)
                    SqlDataSource1.SelectParameters["brand"].DefaultValue = string.Empty;

                // bind featured, brands and products
                if (rptFeatured != null) rptFeatured.DataBind();
                if (rptBrands != null) rptBrands.DataBind();
                BindProducts();
            }
        }

        private void BindProducts()
        {
            // get current search text and brand selection (brand may be set by brand click)
            string q = txtSearch.Text ?? string.Empty;
            string brand = string.Empty;
            if (SqlDataSource1.SelectParameters["brand"] != null)
                brand = SqlDataSource1.SelectParameters["brand"].DefaultValue ?? string.Empty;

            // fetch from DB using a parameterized query (search limited to ProductName and PartNumber)
            DataTable dt = GetProductsFromDatabase(q, brand);

            rptProducts.DataSource = dt;
            rptProducts.DataBind();
        }

        private DataTable GetProductsFromDatabase(string q, string brand)
        {
            var dt = new DataTable();

            var csSetting = ConfigurationManager.ConnectionStrings["WstGrp26ConnectionString"];
            if (csSetting == null || string.IsNullOrWhiteSpace(csSetting.ConnectionString))
                throw new InvalidOperationException("Connection string 'WstGrp26ConnectionString' is missing in Web.config.");

            string cs = csSetting.ConnectionString;

            const string sql = @"
SELECT ProductID, ProductName, PartNumber, SalePricePerUnit, ProductImagePath, Brand
FROM Products
WHERE ((@q = '' OR @q IS NULL) OR (ProductName LIKE '%' + @q + '%' OR PartNumber LIKE '%' + @q + '%'))
  AND (@brand = '' OR @brand IS NULL OR LTRIM(RTRIM(Brand)) = @brand)
ORDER BY Brand, ProductName;";

            using (var conn = new SqlConnection(cs))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@q", SqlDbType.NVarChar, 4000).Value = (object)q ?? DBNull.Value;
                cmd.Parameters.Add("@brand", SqlDbType.NVarChar, 256).Value = (object)brand ?? DBNull.Value;

                conn.Open();
                using (var rdr = cmd.ExecuteReader())
                {
                    dt.Load(rdr);
                }
            }

            return dt;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // ensure brand parameter remains (we keep brand filtering + search combined)
            if (SqlDataSource1.SelectParameters["q"] != null)
                SqlDataSource1.SelectParameters["q"].DefaultValue = txtSearch.Text ?? string.Empty;

            // hide featured if searching or a brand filter is active
            bool hasQuery = !string.IsNullOrWhiteSpace(txtSearch.Text);
            var brandParam = SqlDataSource1.SelectParameters["brand"]?.DefaultValue ?? string.Empty;
            bool brandSelected = !string.IsNullOrWhiteSpace(brandParam);
            pnlFeatured.Visible = !(hasQuery || brandSelected);

            BindProducts();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            // clear search and reset brand filter
            txtSearch.Text = string.Empty;

            if (SqlDataSource1.SelectParameters["q"] != null)
                SqlDataSource1.SelectParameters["q"].DefaultValue = string.Empty;
            if (SqlDataSource1.SelectParameters["brand"] != null)
                SqlDataSource1.SelectParameters["brand"].DefaultValue = string.Empty;

            // show featured again
            pnlFeatured.Visible = true;

            BindProducts();
        }

        // Brand selection from sidebar: filter by brand (does not clear search by design)
        protected void rptBrands_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "FilterBrand")
            {
                string brand = (e.CommandArgument ?? "").ToString().Trim();

                if (SqlDataSource1.SelectParameters["brand"] != null)
                    SqlDataSource1.SelectParameters["brand"].DefaultValue = brand;

                // hide featured when brand selected or when there's an active search
                bool hasQuery = !string.IsNullOrWhiteSpace(txtSearch.Text);
                pnlFeatured.Visible = !(hasQuery || !string.IsNullOrEmpty(brand));

                BindProducts();
            }
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                var arg = (e.CommandArgument ?? "").ToString();
                var parts = arg.Split(new[] { '|' }, StringSplitOptions.None);
                if (parts.Length >= 3)
                {
                    if (!int.TryParse(parts[0], out int productId))
                        return;

                    string productName = parts[0];
                    if (!decimal.TryParse(parts[2], out decimal price))
                        price = 0m;

                    var cart = Session["Cart"] as List<CartItem>;
                    if (cart == null)
                    {
                        cart = new List<CartItem>();
                        Session["Cart"] = cart;
                    }

                    var existing = cart.Find(ci => ci.ProductID == productId);
                    if (existing != null) existing.Quantity += 1;
                    else cart.Add(new CartItem { ProductID = productId, ProductName = productName, Price = price, Quantity = 1 });

                    ScriptManager.RegisterStartupScript(this, GetType(), "added", $"alert('Added \"{HttpUtility.JavaScriptStringEncode(parts[1])}\" to cart');", true);
                }
            }
        }
    }
}
