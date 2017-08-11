<%@ Page Title="" Language="C#" MasterPageFile="~/Tema.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ETicaretProjesi._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProductID" runat="server">

    <div class="demo_changer" id="demo_changer">
        <div class="demo-icon fa fa-sliders"></div>
        <div class="form_holder">
            <div class="line"></div>
            <p>Color Scheme</p>
            <div class="predefined_styles" id="styleswitch_area">
                <a href="?default=true" class="styleswitch" style="background: #2A8FBD"></a>
                <a href="" data-source="apple" class="styleswitch" style="background: #56AD48"></a>
                <a href="" data-source="pink" class="styleswitch" style="background: #FF0066"></a>
                <a href="" data-source="teal" class="styleswitch" style="background: #1693A5"></a>
                <a href="" data-source="gold" class="styleswitch" style="background: #FBB829"></a>
                <a href="" data-source="downy" class="styleswitch" style="background: #6dcda7"></a>
                <a href="" data-source="atlantis" class="styleswitch" style="background: #8cc732"></a>
                <a href="" data-source="red" class="styleswitch" style="background: #FF0000"></a>
                <a href="" data-source="violet" class="styleswitch" style="background: #D31996"></a>
                <a href="" data-source="pomegranate" class="styleswitch" style="background: #F02311"></a>
                <a href="" data-source="violet-red" class="styleswitch" style="background: #F23A65"></a>
                <a href="" data-source="mexican-red" class="styleswitch" style="background: #9b2139"></a>
                <a href="" data-source="victoria" class="styleswitch" style="background: #544AA1"></a>
                <a href="" data-source="orient" class="styleswitch" style="background: #025D8C"></a>
                <a href="" data-source="jgger" class="styleswitch" style="background: #420943"></a>
                <a href="" data-source="de-york" class="styleswitch" style="background: #8CCA91"></a>
                <a href="" data-source="blaze-orange" class="styleswitch" style="background: #FF6600"></a>
                <a href="" data-source="hot-pink" class="styleswitch" style="background: #FF5EAA"></a>
            </div>
            <div class="line"></div>
            <p>Layout</p>
            <div class="predefined_styles">
                <a href="#" class="btn btn-sm" id="btn-boxed">Boxed</a>
                <a href="#" class="btn btn-sm" id="btn-wide">Wide</a>

            </div>
            <div class="line"></div>
            <p>Background patterns</p>
            <div class="predefined_styles" id="patternswitch_area">
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/dimension.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/binding_light.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/binding_dark.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/dark_fish_skin.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/escheresque_ste.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/food.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/giftly.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/grey_wash_wall.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/ps_neutral.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/pw_maze_black.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/pw_pattern.png')"></a>
                <a href="#" class="patternswitch" style="background-image: url('img/patterns/simple_dashed.png')"></a>
            </div>

            <div class="line"></div>
        </div>
    </div>


    <!-- TOP AREA -->
    <div class="top-area">
        <div class="owl-carousel owl-slider" id="owl-carousel-slider" data-inner-pagination="true" data-white-pagination="true">

            <asp:Repeater ID="rptHomePageSlider" runat="server">
                <ItemTemplate>
                    <div>
                        <div class="bg-holder">
                            <img src="<%# Eval("ImageURL") %>" alt="<%# Eval("Name") %>" title="<%# Eval("Name") %>" />
                            <div class="vert-center text-white text-center slider-caption">
                                <h2 class="text-uc"><%# Eval("Title") %> </h2>
                                <p class="text-bigger"><%# Eval("Description") %></p>
                                <p class="text-hero"><%# Eval("BigTitle") %></p>
                                <a class="btn btn-lg btn-ghost btn-white" href="<%#Eval("ButtonURL")%>"><%# Eval("ButtonTitle") %></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!-- END TOP AREA -->

    <div class="gap"></div>


    <!-- //////////////////////////////////
	//////////////PAGE CONTENT///////////// 
	////////////////////////////////////-->



    <div class="container">

        <div class="row row-wrap">
            <asp:Repeater ID="rptHomePagePromo" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="sale-point">
                            <i class="fa fa-<%# Eval("Icon") %> sale-point-icon"></i>
                            <h5 class="sale-point-title"><%# Eval("Title") %></h5>
                            <p class="sale-point-description"><%# Eval("Description") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="gap gap-small"></div>
        <div class="text-center">
            <h1 class="mb20">Popüler Ürünler</h1>
            <div class="row row-wrap">

                <% for (int i = 0; i < HomePagePopularProducts.Rows.Count; i++)
                    { %>
                <div class="col-md-4">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="<%= HomePagePopularProducts.Rows[i]["Image"]  %>" alt="Image Alternative text" title="<%=HomePagePopularProducts.Rows[i]["Rating"] %>" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="<%= HomePagePopularProducts.Rows[i]["Rating"] %>/5 Yıldız">
                                <%for (int k = 0; k < int.Parse(HomePagePopularProducts.Rows[i]["Rating"].ToString()); k++)
                                    { %>
                                <li class="selected"><i class="fa fa-star"></i></li>
                                <% } %>
                                <%for (int l = 0; l < (5 - int.Parse(HomePagePopularProducts.Rows[i]["Rating"].ToString())); l++)
                                    {%>
                                <li><i class="fa fa-star-o"></i></li>
                                <% } %>
                            </ul>
                            <h5 class="product-title"><%=HomePagePopularProducts.Rows[i]["Title"] %></h5>
                            <p class="product-desciption"><%=HomePagePopularProducts.Rows[i]["SubTitle"] %></p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price"><%=HomePagePopularProducts.Rows[i]["Price"] %></span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm"><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>
                                    </li>
                                    <li><a class="btn btn-sm" href="product.aspx?id=<%=HomePagePopularProducts.Rows[i]["ID"] %>"><i class="fa fa-bars"></i>Ürünü İncele</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>





                <!---------------------- Sample Popular Product List-------------------->
              
            </div>
            <!---------------------- End Of Sample Popular Product List-------------------->

            <a href="category.aspx?orderby=clicks&orderkind=desc" class="btn btn-primary">Diğer popüler ürünler</a>
        </div>

        <!---------------------- Latest Product List-------------------->

        <div class="gap"></div>

        <div class="text-center">
            <h1 class="mb20">Son eklenen Ürünler</h1>
            <div class="row row-wrap">
                <% for (int i = 0; i < HomePageRecentProducts.Rows.Count; i++)
                    { %>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="<%= HomePageRecentProducts.Rows[i]["Image"]  %>" alt="Image Alternative text" title="<%=HomePageRecentProducts.Rows[i]["Rating"] %>" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="<%= HomePageRecentProducts.Rows[i]["Rating"] %>/5 Yıldız">
                                <%for (int k = 0; k < int.Parse(HomePageRecentProducts.Rows[i]["Rating"].ToString()); k++)
                                    { %>
                                <li class="selected"><i class="fa fa-star"></i></li>
                                <% } %>
                                <%for (int l = 0; l < (5 - int.Parse(HomePageRecentProducts.Rows[i]["Rating"].ToString())); l++)
                                    {%>
                                <li><i class="fa fa-star-o"></i></li>
                                <% } %>
                            </ul>
                            <h5 class="product-title"><%=HomePageRecentProducts.Rows[i]["Title"] %></h5>
                            <p class="product-desciption"><%=HomePageRecentProducts.Rows[i]["Rating"] %></p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price"><%=HomePageRecentProducts.Rows[i]["Price"] %></span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm"><i class="fa fa-shopping-cart"></i> Sepete Ekle</a>
                                    </li>
                                    <li><a class="btn btn-sm" href="product.aspx?id=<%=HomePageRecentProducts.Rows[i]["ID"] %>"><i class="fa fa-bars"></i> Detay</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>

            </div>
            <a href="category.aspx?orderby=tbl.date&orderkind=desc" class="btn btn-primary">Diğer yeni ürünleri incele</a>
        </div>
        <!---------------------- Latest Product List-------------------->
        <div class="gap"></div>
    </div>


    <!-- //////////////////////////////////
	//////////////END PAGE CONTENT///////// 
	////////////////////////////////////-->
</asp:Content>
