<%@ Page Title="" Language="C#" MasterPageFile="~/Left-Sidebar.master" AutoEventWireup="true" CodeBehind="category-horizontal.aspx.cs" Inherits="ETicaretProjesi.category_horizontal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CategoryContent" runat="server">
    <ul class="nav nav-tabs nav-stacked nav-coupon-category">
        <li class="active">
            <a href="category-horizontal.aspx<%= !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id="+ int.Parse(Request.QueryString.Get("id")) : "" %>"><i class="fa fa-ticket"></i>Tamamı</a>
        </li>
        <asp:Repeater ID="rptCategoryList" runat="server">
            <ItemTemplate>
                <li><a href="category-horizontal.aspx?id=<%# Eval("id") %>"><i class="fa fa-<%# Eval("icon") %>"></i><%# Eval("name") %></a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>

    <div class="sidebar-box">
        <h5>Filter By Price</h5>
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
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.date&orderkind=asc") %>">Tarih - Önce Eski</a></li>
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.Title&orderkind=asc") %>">İsim - A'dan Z'ye </a></li>
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.Title&orderkind=desc") %>">İsim - Z'den A'ya </a></li>
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.price&orderkind=asc") %>">Fiyat - Önce Yüksek</a></li>
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=tbl.price&orderkind=desc") %>">Fiyat - Önce Düşük</a></li>
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=clicks&orderkind=desc") %>">Popülerlik - Önce çok tıklanan</a></li>
                        <li><a href="category-horizontal.aspx<%= ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id=" + Request.QueryString.Get("id") : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + ("orderby=clicks&orderkind=asc") %>">Popülerlik - Önce az tıklanan</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-6">
                   <div class="product-view pull-right">
                    <a class="fa fa-th-large" href="category.aspx<%= !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id="+ int.Parse(Request.QueryString.Get("id")) : "" %>"></a>
                    <a class="fa fa-list active" href="#"></a>
                </div>
            </div>
        </div>


        <% for (int i = 0; i < ProductData.Rows.Count; i++)
            { %>


        <div class="product-thumb product-thumb-horizontal">
            <header class="product-header">
                <img src="<%= ProductData.Rows[i]["Image"].ToString() %>" alt="<%= ProductData.Rows[i]["Title"].ToString() %>" title="<%= ProductData.Rows[i]["Title"].ToString() %>" />
                <div class="product-secondary-image">
                            <img src="<%= ProductData.Rows[i]["SecondImage"].ToString() %>" alt="<%= ProductData.Rows[i]["Title"].ToString() %>" title="<%= ProductData.Rows[i]["Title"].ToString() %>">
                        </div>
            </header>
            <div class="product-inner">
                <ul class="icon-group icon-list-rating" title="<%= ProductData.Rows[i]["Rating"].ToString() %>/5 Oy"">
                    <%
                        for (int k = 0; k <= int.Parse(ProductData.Rows[i]["Rating"].ToString()); k++)
                        { %>
                    <li><i class="fa fa-star"></i>
                    </li>
                    <%   } %>
                    <% for (int l = 0; l < (5 - int.Parse(ProductData.Rows[i]["Rating"].ToString())); l++)
                        { %>
                    <li><i class="fa fa-star-o"></i>
                    </li>
                     <%   } %>
                    
                </ul>
                <h5 class="product-title"><%= ProductData.Rows[i]["Title"] %></h5>
                <div class="product-desciption"><%= ProductData.Rows[i]["SubTitle"] %></div>
                <div class="product-meta">
                    <ul class="product-price-list">
                        <li><span class="product-price"><%= ProductData.Rows[i]["Price"] %></span>
                        </li>
                    </ul>
                    <ul class="product-actions-list">
                        <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                        </li>
                        <li><a class="btn btn-sm" href="product.aspx?id=<%= int.Parse(ProductData.Rows[i]["ID"].ToString()) %>"><i class="fa fa-bars"></i>ürüne git</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <% } %>

        <ul class="pagination">
            <li class="prev <%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ( int.Parse(Request.QueryString.Get("page").ToString()) > 1 ? "enabled" : "disabled" ) : "disabled" %>">
                <a href="category-horizontal.aspx<%= (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id="+int.Parse(Request.QueryString.Get("id")) : "")+ ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&":"?")+ (!String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ( int.Parse(Request.QueryString.Get("page")) > 1 ? "page="+(int.Parse(Request.QueryString.Get("page"))-1) : "" ) : "" ) %>"></a>
            </li>
            <% for (int i = 0; i < GetPageCount(); i++)
                { %>
            <% if (((i + 1) >= (curPage - 2)) && ((i + 1) <= (curPage + 2)))
                { %>
            <li class="<%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ( curPage == (i+1) ? "active" : "" ) : ( 1 == (i+1) ? "active" : "" ) %>"><a href="category-horizontal.aspx<%= (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id="+ int.Parse(Request.QueryString.Get("id")) : "" )+(!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("page")) ? "page="+ (i+1) : "page="+2 ) + (!String.IsNullOrEmpty(Request.QueryString.Get("orderby")) ? "&orderby="+ Request.QueryString.Get("orderby") : "" )+( !String.IsNullOrEmpty(Request.QueryString.Get("orderby")) ? "&" : "" ) + ( !String.IsNullOrEmpty(Request.QueryString.Get("orderkind")) ? "orderkind="+Request.QueryString.Get("orderkind") : "") %>"><%= (i+1) %></a>
            </li>
<% } %>
            
<%} %>
            <li class="next <%= !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ( int.Parse(Request.QueryString.Get("page")) >= GetPageCount() ? "disabled" : "enabled" ) : "enabled" %>">
                <a href="<%= ( curPage < GetPageCount() ? string.Format("category-horizontal.aspx") + ( !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "?id="+ int.Parse(Request.QueryString.Get("id")) : "" ) + (!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? "&" : "?") + (!String.IsNullOrEmpty(Request.QueryString.Get("page")) ? "page="+ (int.Parse(Request.QueryString.Get("page"))+1) : "page=2") : "")%>"></a>
            </li>
        </ul>
        <div class="gap"></div>
    </div>
</asp:Content>
