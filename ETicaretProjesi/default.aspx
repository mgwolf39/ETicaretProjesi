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
                                <a class="btn btn-lg btn-ghost btn-white" href="<%# Eval("ButtonURL")%>"><%# Eval("ButtonTitle") %></a>
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
                <div class="col-md-4">
                    <asp:Repeater ID="rptHomePagePopularProducts" runat="server">
                        <ItemTemplate>
                            <div class="product-thumb">
                                <header class="product-header">
                                    <img src="<%# Eval("ProductImage") %>" alt="Image Alternative text" title="<%# Eval("Title") %>" />
                                </header>
                                <div class="product-inner">
                                    <ul class="icon-group icon-list-rating" title="<%# Eval("title") %>/5 Yıldız">
                                        <li><i class="fa fa-star-half"></i></li>
                                    </ul>
                                    <h5 class="product-title"><%# Eval("Title") %></h5>
                                    <p class="product-desciption"><%# Eval("SubTitle") %></p>
                                    <div class="product-meta">
                                        <ul class="product-price-list">
                                            <li><span class="product-price"><%# Eval("Price") %></span>
                                            </li>
                                        </ul>
                                        <ul class="product-actions-list">
                                            <li><a class="btn btn-sm"><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>
                                            </li>
                                            <li><a class="btn btn-sm" href="product.aspx?id=<%# Eval("id") %>"><i class="fa fa-bars"></i>Ürüne Git</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!---------------------- Sample Popular Product List-------------------->
                <div class="col-md-4">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/our_coffee_miss_u_800x600.jpg" alt="Image Alternative text" title="Our Coffee miss u" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="3.2/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                                <li><i class="fa fa-star-o"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Coffe Shop Discount</h5>
                            <p class="product-desciption">Ut curabitur posuere eleifend massa etiam per feugiat</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$254</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/cascada_800x600.jpg" alt="Image Alternative text" title="cascada" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating icon-list-non-rated" title="not rated yet">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Adventure in Woods</h5>
                            <p class="product-desciption">Ut curabitur posuere eleifend massa etiam per feugiat</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$156</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/amaze_800x600.jpg" alt="Image Alternative text" title="AMaze" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="4.3/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">New Glass Collection</h5>
                            <p class="product-desciption">Ut curabitur posuere eleifend massa etiam per feugiat</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$97</span>
                                    </li>
                                    <li><span class="product-old-price">$286</span>
                                    </li>
                                    <li><span class="product-save">Save 34%</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/hot_mixer_800x600.jpg" alt="Image Alternative text" title="Hot mixer" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="3.7/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-o"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Modern DJ Set</h5>
                            <p class="product-desciption">Ut curabitur posuere eleifend massa etiam per feugiat</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$299</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/iphone_5_ipad_mini_ipad_3_800x600.jpg" alt="Image Alternative text" title="iPhone 5 iPad mini iPad 3" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="4.5/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Electronics Big Deal</h5>
                            <p class="product-desciption">Ut curabitur posuere eleifend massa etiam per feugiat</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$199</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---------------------- End Of Sample Popular Product List-------------------->

            <a href="popular-products.aspx" class="btn btn-primary">Explore All Featured Products</a>
        </div>

         <!---------------------- Latest Product List-------------------->

        <div class="gap"></div>
        <div class="text-center">
            <h1 class="mb20">New Arrivals</h1>
            <div class="row row-wrap">
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/the_best_mode_of_transport_here_in_maldives_800x600.jpg" alt="Image Alternative text" title="the best mode of transport here in maldives" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="3.5/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                                <li><i class="fa fa-star-o"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Finshing in Maldives</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$285</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/our_coffee_miss_u_800x600.jpg" alt="Image Alternative text" title="Our Coffee miss u" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating icon-list-non-rated" title="not rated yet">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Coffe Shop Discount</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$190</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/cascada_800x600.jpg" alt="Image Alternative text" title="cascada" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="4.8/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Adventure in Woods</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$104</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/amaze_800x600.jpg" alt="Image Alternative text" title="AMaze" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="3.2/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                                <li><i class="fa fa-star-o"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">New Glass Collection</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$113</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/hot_mixer_800x600.jpg" alt="Image Alternative text" title="Hot mixer" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="5/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Modern DJ Set</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$122</span>
                                    </li>
                                    <li><span class="product-old-price">$174</span>
                                    </li>
                                    <li><span class="product-save">Save 70%</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/iphone_5_ipad_mini_ipad_3_800x600.jpg" alt="Image Alternative text" title="iPhone 5 iPad mini iPad 3" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="3.9/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-o"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Electronics Big Deal</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$226</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/food_is_pride_800x600.jpg" alt="Image Alternative text" title="Food is Pride" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="4.5/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Best Pasta</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$127</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-thumb">
                        <header class="product-header">
                            <img src="img/a_turn_800x600.jpg" alt="Image Alternative text" title="a turn" />
                        </header>
                        <div class="product-inner">
                            <ul class="icon-group icon-list-rating" title="4.6/5 rating">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star-half-empty"></i>
                                </li>
                            </ul>
                            <h5 class="product-title">Diving with Sharks</h5>
                            <p class="product-desciption">Tempus tortor ultrices praesent integer maecenas montes nulla</p>
                            <div class="product-meta">
                                <ul class="product-price-list">
                                    <li><span class="product-price">$254</span>
                                    </li>
                                </ul>
                                <ul class="product-actions-list">
                                    <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>To Cart</a>
                                    </li>
                                    <li><a class="btn btn-sm"><i class="fa fa-bars"></i>Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#" class="btn btn-primary">Explore All New Products</a>
        </div>
        <!---------------------- Latest Product List-------------------->
        <div class="gap"></div>
    </div>


    <!-- //////////////////////////////////
	//////////////END PAGE CONTENT///////// 
	////////////////////////////////////-->
</asp:Content>
