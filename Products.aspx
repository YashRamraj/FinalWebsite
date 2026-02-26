<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebApplicationWstGrp26.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    <style>
        body { font-family:'Segoe UI',sans-serif; background:#f4f4f4; margin:0; padding:0; }
        header { background:#003366; color:#fff; text-align:center; padding:20px; }
        .container { max-width:1200px; margin:30px auto; padding:0 20px; }

        /* Layout: sidebar + main */
        .content { display:flex; gap:20px; align-items:flex-start; }
        .sidebar { width:240px; }
        .sidebar .brand-list { background:#fff; border-radius:8px; padding:12px; box-shadow:0 4px 12px rgba(0,0,0,0.06); }
        .brand-item { display:block; padding:8px 10px; color:#333; text-decoration:none; border-radius:4px; cursor:pointer; }
        .brand-item:hover { background:#f0f6ff; color:#003366; }
        .brand-item.active { background:#e6f0ff; font-weight:700; color:#003366; }

        /* Search */
        .search-bar { display:flex; gap:8px; margin:12px 0 10px; align-items:center; }
        .search-input { flex:1; padding:10px 12px; border-radius:6px; border:1px solid #d0d7df; font-size:0.95rem; }

        /* Featured */
        .featured-section { margin:12px 0 20px; }
        .featured-title { font-size:1.05rem; margin-bottom:8px; color:#222; }
        .featured-list { display:flex; gap:12px; overflow-x:auto; padding-bottom:6px; }
        .featured-card { min-width:220px; max-width:260px; background:#fff; border-radius:8px; padding:10px; box-shadow:0 4px 12px rgba(0,0,0,0.06); display:flex; flex-direction:column; align-items:center; text-align:center; }
        .featured-card img { width:100%; height:110px; object-fit:contain; margin-bottom:8px; border-radius:4px; background:#fafafa; }
        .featured-card .brand { font-size:0.8rem; color:#666; text-transform:uppercase; margin-bottom:6px; }
        .featured-card .part { font-size:0.85rem; color:#444; margin-bottom:6px; }
        .featured-card .price { font-weight:700; color:#0a3b7a; margin-top:auto; }

        /* All products title */
        .all-title { font-size:1.05rem; margin:18px 0 10px; color:#222; }

        /* Grid */
        .product-grid { display:grid; grid-template-columns:repeat(auto-fit, minmax(220px,1fr)); gap:20px; align-items:start; }
        .product { background:#fff; border-radius:8px; box-shadow:0 6px 18px rgba(0,0,0,0.06); padding:16px; text-align:center; transition:transform .12s ease, box-shadow .12s ease; display:flex; flex-direction:column; height:100%; }
        .product:hover { transform:translateY(-6px); box-shadow:0 10px 28px rgba(0,0,0,0.10); }
        .product img { width:100%; height:160px; object-fit:contain; margin-bottom:12px; border-radius:4px; background:#fafafa; }
        .brand { font-size:0.85rem; color:#666; margin-bottom:6px; text-transform:uppercase; letter-spacing:0.02em; }
        .product h3 { margin:6px 0 8px; font-size:1.05rem; color:#222; flex:0 0 auto; }
        .part { color:#444; font-size:0.9rem; margin-bottom:6px; }
        .product .price { margin-top:auto; font-weight:700; font-size:1rem; color:#0a3b7a; }
        .btn { display:inline-block; padding:8px 12px; background:#007bff; color:white; border:none; border-radius:4px; cursor:pointer; text-decoration:none; }
        .btn:hover { background:#0056b3; }

        @media (max-width:920px) {
            .content { flex-direction:column; }
            .sidebar { width:100%; order:2; }
        }
        @media (max-width:520px) {
            .product img { height:140px; }
            .search-bar { flex-direction:column; align-items:stretch; }
            .featured-list { gap:10px; }
        }
    </style>
   
    <header>
        <h1>Coastal Clutch & Brakes</h1>
        <p>Quality Parts. Reliable Service.</p>
    </header>

    <div class="container">
        <h2>Shop Products</h2>

        <!-- Search UI -->
        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch" CssClass="search-bar">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Search by part number or product name..." />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn" OnClick="btnClear_Click" />
        </asp:Panel>

        <div class="content">
            <!-- Sidebar: Brands -->
            <aside class="sidebar">
                <div class="brand-list">
                    <strong>Brands</strong>
                    <asp:Repeater ID="rptBrands" runat="server" DataSourceID="SqlDataSourceBrands" OnItemCommand="rptBrands_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                            CommandName="FilterBrand"
                                            CommandArgument='<%# Eval("Brand") %>'
                                            CssClass="brand-item"><%# Eval("Brand") %></asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSourceBrands" runat="server"
                        ConnectionString='<%$ ConnectionStrings:WstGrp26ConnectionString %>'
                        SelectCommand="SELECT DISTINCT LTRIM(RTRIM(Brand)) AS Brand FROM Products WHERE Brand IS NOT NULL AND LTRIM(RTRIM(Brand)) &lt;&gt; '' ORDER BY LTRIM(RTRIM(Brand))">
                    </asp:SqlDataSource>
                </div>
            </aside>

            <!-- Main column -->
            <main class="main" style="flex:1;">
                <!-- Featured products panel -->
                <asp:Panel ID="pnlFeatured" runat="server" CssClass="featured-section">
                    <div class="featured-title">Featured products</div>
                    <div class="featured-list">
                        <asp:Repeater ID="rptFeatured" runat="server" DataSourceID="SqlDataSourceFeatured" OnItemCommand="rptProducts_ItemCommand">
                            <ItemTemplate>
                                <div class="featured-card">
                                    <img loading="lazy" src='<%# ResolveUrl(string.IsNullOrEmpty(Eval("ProductImagePath") as string) ? "~/Images/Products/placeholder.png" : Eval("ProductImagePath").ToString()) %>' alt='<%# Eval("ProductName") %>' />
                                    <div class="brand"><%# Eval("Brand") ?? "" %></div>
                                    <div class="part"><strong>Part:</strong> <%# Eval("PartNumber") ?? "" %></div>
                                    <div class="title"><%# Eval("ProductName") %></div>
                                    <div class="price">R <%# string.Format("{0:0.00}", Eval("SalePricePerUnit")) %></div>
                                    <asp:Button runat="server" 
                                                Text="Add to Cart" 
                                                CssClass="btn"
                                                CommandName="AddToCart" 
                                                CommandArgument='<%# Eval("ProductID") + "|" + Eval("ProductName") + "|" + Eval("SalePricePerUnit") %>' />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource ID="SqlDataSourceFeatured" runat="server"
                            ConnectionString='<%$ ConnectionStrings:WstGrp26ConnectionString %>'
                            SelectCommand="SELECT TOP 4 ProductID, ProductName, PartNumber, SalePricePerUnit, ProductImagePath, Brand FROM Products ORDER BY NEWID()">
                        </asp:SqlDataSource>
                    </div>
                </asp:Panel>

                <!-- All products title -->
                <h3 class="all-title">All Products</h3>

                <!-- Main product grid -->
                <div class="product-grid">
                    <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                        <ItemTemplate>
                            <div class="product">
                                <img loading="lazy"
                                     src='<%# ResolveUrl(string.IsNullOrEmpty(Eval("ProductImagePath") as string) ? "~/Images/Products/placeholder.png" : Eval("ProductImagePath").ToString()) %>'
                                     alt='<%# Eval("ProductName") %>' />
                                <div class="brand"><%# Eval("Brand") ?? "" %></div>
                                <div class="part"><strong>Part:</strong> <%# Eval("PartNumber") ?? "" %></div>
                                <h3><%# Eval("ProductName") %></h3>
                                <div class="price">R <%# string.Format("{0:0.00}", Eval("SalePricePerUnit")) %></div>
                                <asp:Button runat="server" 
                                            Text="Add to Cart" 
                                            CssClass="btn"
                                            CommandName="AddToCart" 
                                            CommandArgument='<%# Eval("ProductID") + "|" + Eval("ProductName") + "|" + Eval("SalePricePerUnit") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Data source: brands only (products bound server-side in code-behind) -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString='<%$ ConnectionStrings:WstGrp26ConnectionString %>'
                    DataSourceMode="DataSet"
                    SelectCommand="SELECT ProductID, ProductName, PartNumber, SalePricePerUnit, ProductImagePath, Brand FROM Products">
                    <SelectParameters>
                        <asp:Parameter Name="q" DefaultValue="" Type="String" />
                        <asp:Parameter Name="brand" DefaultValue="" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </main>
        </div>
    </div>

</asp:Content>