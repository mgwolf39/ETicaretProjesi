<%@ Page Title="" Language="C#" MasterPageFile="~/Left-Sidebar.master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="ETicaretProjesi.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CategoryContent" runat="server">
    <ul class="nav nav-tabs nav-stacked nav-coupon-category">
        <li class="active"><a href="category.aspx"><i class="fa fa-ticket"></i>Tamamı</a>
        </li>
        <asp:Repeater ID="rptCategoryList" runat="server">
            <ItemTemplate>
                <li>
                    <a href="category.aspx?id=<%# Eval("ID") %>&page=1"><i class="fa fa-<%# Eval("Icon") %>"></i><%# Eval("Name") %></a>
                </li>
            </ItemTemplate>
        </asp:Repeater>

    </ul>
    <div class="sidebar-box">
        <h5>Fiyata göre sınırla</h5>
        <input type="text" id="price-slider">
    </div>
    <div class="sidebar-box">
        <h5>Product Feature</h5>
        <ul class="checkbox-list">
            <li class="checkbox">
                <label>
                    <input type="checkbox" class="i-check">On Sale</label>
            </li>
            <li class="checkbox">
                <label>
                    <input type="checkbox" class="i-check">New</label>
            </li>
            <li class="checkbox">
                <label>
                    <input type="checkbox" class="i-check">Ending Soon</label>
            </li>
            <li class="checkbox">
                <label>
                    <input type="checkbox" class="i-check">High Rating</label>
            </li>
            <li class="checkbox">
                <label>
                    <input type="checkbox" class="i-check">Free Shipping</label>
            </li>
        </ul>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProductContent" runat="server">
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-4">
                <div class="product-sort">
                    <span class="product-sort-selected">Sırala: <b>Tarih - Önce Yeni</b></span>
                    <a href="#" class="product-sort-order fa fa-angle-down"></a>
                    <ul>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.date&orderkind=asc") %>">Tarih - Önce Eski</a></li>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.Title&orderkind=asc") %>">İsim - A'dan Z'ye </a></li>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.Title&orderkind=desc") %>">İsim - Z'den A'ya </a></li>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.price&orderkind=asc") %>">Fiyat - Önce Yüksek</a></li>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.price&orderkind=desc") %>">Fiyat - Önce Düşük</a></li>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=clicks&orderkind=desc") %>">Popülerlik - Önce çok tıklanan</a></li>
                        <li><a href="category.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=clicks&orderkind=asc") %>">Popülerlik - Önce az tıklanan</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-6">
                <div class="product-view pull-right">
                    <a class="fa fa-th-large active" href="#"></a>
                    <a class="fa fa-list" href="category-horizontal.aspx<%= (!string.IsNullOrEmpty(Request.QueryString.Get("ID")) ? "?id=" + int.Parse(Request.QueryString.Get("id")) : "" ) + (!string.IsNullOrEmpty(Request.QueryString.Get("ID")) ? "&" : "?" ) + (!string.IsNullOrEmpty(Request.QueryString.Get("page")) ? "page=" + int.Parse(Request.QueryString.Get("page")) : "" ) %>"></a>
                </div>
            </div>
        </div>
        <div class="row row-wrap">
            <% for (int i = 0; i < CategoryProducts.Rows.Count; i++)
                { %>
            <div class="col-md-4">
                <div class="product-thumb">
                    <header class="product-header">
                        <img src="<%= CategoryProducts.Rows[i]["Image"] %>" alt="Image Alternative text" title="<%= CategoryProducts.Rows[i]["Title"] %>" />
                        <div class="product-secondary-image">
                            <img src="<%= CategoryProducts.Rows[i]["SecondImage"] %>" alt="Image Alternative text" title="<%= CategoryProducts.Rows[i]["Title"] %>" />
                        </div>
                    </header>
                    <div class="product-inner">
                        <ul class="icon-group icon-list-rating icon-list-non-rated" title="<%= CategoryProducts.Rows[i]["Rating"] %> Yıldız">
                            <%for (int k = 0; k < int.Parse(CategoryProducts.Rows[i]["Rating"].ToString()); k++)
                                { %>
                            <li class="selected"><i class="fa fa-star"></i></li>
                            <% } %>
                            <%for (int l = 0; l < (5 - int.Parse(CategoryProducts.Rows[i]["Rating"].ToString())); l++)
                                {%>
                            <li><i class="fa fa-star-0"></i></li>
                            <% } %>
                        </ul>
                        <h5 class="product-title"><%= CategoryProducts.Rows[i]["Title"] %></h5>
                        <p class="product-desciption"><%= CategoryProducts.Rows[i]["SubTitle"] %></p>
                        <div class="product-meta">
                            <ul class="product-price-list">
                                <li><span class="product-price"><%= CategoryProducts.Rows[i]["Price"] %></span>
                                </li>
                            </ul>
                            <ul class="product-actions-list">
                                <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                </li>
                                <li><a class="btn btn-sm" href="product.aspx?id=<%= CategoryProducts.Rows[i]["ID"] %>"><i class="fa fa-bars"></i>Ürüne git</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%   } %>
        </div>
        <ul class="pagination">
            <li class="prev <%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? int.Parse(Request.QueryString.Get("page")) > 1 ? "enabled" : "disabled" : "" %>">
                <a href="category.aspx<%= !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" %><%= !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" %><%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ((int.Parse(Request.QueryString.Get("page")) > 1) ? "page=" + (int.Parse(Request.QueryString.Get("page")) -1) : "") : "" %>"></a>
            </li>
            <%for (int i = 0; i < GetPageCount(); i++)
                { %>
            <%if ((i + 1) >= (currentPage - 2) && ((i + 1) <= currentPage + 2))
                {%>
            <li class="<%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ( currentPage == (i+1) ? "active" : "" ) : ( 1 == (i+1) ? "active" : "" ) %>"><a href="category.aspx<%= !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" %><%= !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? ("&page=" + (i+1)) : ("?page=" + (i+1)) %><%= !String.IsNullOrEmpty(Request.QueryString.Get("orderby")) ? "&orderby="+ Request.QueryString.Get("orderby") : "" %><%= !String.IsNullOrEmpty(Request.QueryString.Get("orderby")) ? "&" : "" %><%= !String.IsNullOrEmpty(Request.QueryString.Get("orderkind")) ? "orderkind="+Request.QueryString.Get("orderkind") : "" %>"><%= (i+1) %></a></li>
            <% } %>
            <% } %>
            <li class="next <%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? int.Parse(Request.QueryString.Get("page")) >= GetPageCount() ? "disabled" : "enabled" : ""%>">
                <a href="<%= (GetPageCount() > (!String.IsNullOrEmpty(Request.QueryString.Get("page")) ? int.Parse(Request.QueryString.Get("page")) : 1) ? "category.aspx" + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + int.Parse(Request.QueryString.Get("id")) : "") + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?") + (!String.IsNullOrEmpty(Request.QueryString.Get("page")) ? "page=" + (int.Parse(Request.QueryString.Get("page")) + 1 ) : "page=2") : "#") %>"></a>
            </li>
        </ul>
        <div class="gap"></div>
    </div>
</asp:Content>
