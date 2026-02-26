using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationWstGrp26
{
    public partial class _Default : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                DSCustLogin.SelectParameters["email"].DefaultValue = User.Identity.Name;
                GVCustDetails.DataBind();

                if (GVCustDetails.Rows.Count > 0)
                {
                    // DSCustTransactions.SelectParameters["CustomerID"].DefaultValue = GVCustDetails.Rows[0].Cells[1].Text;
                    string CustomerID = GVCustDetails.Rows[0].Cells[1].Text;
                   
                    // 🔥🔥 SAVE CustomerID FOR USE ON ALL PAGES
                    Session["CustomerID"] = CustomerID;
                    DSCustTransactions.SelectParameters["CustomerID"].DefaultValue = CustomerID;
                    GVTransactions.DataBind();
                }
                else
                {
                    // Optionally handle the case where no customer details are found
                    DSCustTransactions.SelectParameters["CustomerID"].DefaultValue = string.Empty;
                    GVTransactions.DataBind();
                }
            }

        }
    }
}