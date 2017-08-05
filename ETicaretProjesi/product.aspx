<%@ Page Title="" Language="C#" MasterPageFile="~/Left-Sidebar.master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="ETicaretProjesi.product" %>

<asp:Content ContentPlaceHolderID="ProductContent" ID="Product" runat="server">
    <div class="col-md-9">
        <div id="review-dialog" class="mfp-with-anim mfp-hide mfp-dialog clearfix">
            <h3>Yorum Ekle</h3>
            <div>
                <div class="form-group">
                    <label>İsim</label>
                    <input type="text" placeholder="" class="form-control" />
                </div>
                <div class="form-group">
                    <label>E-mail</label>
                    <input type="email" placeholder="e.g. Örnek@örnek.com" class="form-control" />
                </div>
                <div class="form-group">
                    <label>Yorum</label>
                    <textarea class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label>Oy</label>
                    <ul class="icon-list icon-list-inline star-rating" id="star-rating">
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
                </div>
                <input type="submit" class="btn btn-primary" value="Submit" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div class="fotorama" data-nav="thumbs" data-allowfullscreen="1" data-thumbheight="150" data-thumbwidth="150">
                    <asp:Repeater ID="rptProductImage" runat="server">
                        <ItemTemplate>
                            <img src="<%# Eval("Image") %>" alt="Image Alternative text" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="col-md-5">
                <div class="product-info box">
                    <ul class="icon-group icon-list-rating text-color" title="<%= ProductModel.Rating %>/5 rating">
                        <%for (int k = 0; k < int.Parse(ProductModel.Rating.ToString()); k++)
                            { %>
                        <li class="selected"><i class="fa fa-star"></i></li>
                        <% }
                            for (int l = 0; l < (5 - int.Parse(ProductModel.Rating.ToString())); l++)
                            {%>
                        <li><i class="fa fa-star-o"></i></li>
                        <% } %>
                    </ul>
                    <small><a href="#" class="text-muted"><%= ProductModel.ReviewCount %></a></small>
                    <h3><%= ProductModel.Title %></h3>
                    <p class="product-info-price"><%= ProductModel.Price %></p>
                    <p class="text-smaller text-muted"><%= ProductModel.SubTitle%></p>


                    <ul class="icon-list list-space product-info-list">
                        <asp:Repeater ID="rptProductTicks" runat="server">
                            <ItemTemplate>
                                <li><i class="fa fa-check"></i><%# Eval("Title") %></li>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ul>
                    <ul class="list-inline">
                        <li><a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </li>
                        <li><a href="#" class="btn"><i class="fa fa-star"></i>To Wishlist</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="gap"></div>
        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#tab-1" data-toggle="tab"><i class="fa fa-pencil"></i>Açıklama</a>
                </li>
                <li><a href="#tab-2" data-toggle="tab"><i class="fa fa-info"></i>Detaylar</a>
                </li>
                <li><a href="#tab-3" data-toggle="tab"><i class="fa fa-truck"></i>Kargo</a>
                </li>
                <li><a href="#tab-4" data-toggle="tab"><i class="fa fa-comments"></i>Yorumlar</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-1">
                    <p>
                        <%= ProductModel.Description %>
                    </p>
                </div>
                <div class="tab-pane fade" id="tab-2">
                </div>
                <div class="tab-pane fade" id="tab-3">
                </div>
                <div class="tab-pane fade" id="tab-4">
                    <ul class="comments-list">
                        <li>
                            <!-- REVIEW -->
                            <article class="comment">
                                <asp:Repeater ID="rptProductReviews" runat="server">
                                    <ItemTemplate>
                                        <div class="comment-author">
                                            <img src="<%# Eval("Image") %>" alt="Image Alternative text" title="<%# Eval("Name") %>" />
                                        </div>
                                        <div class="comment-inner">
                                            <%for (int k = 0; k < int.Parse(ProductModel.Rating.ToString()); k++)
                                                { %>
                                            <li class="selected"><i class="fa fa-star"></i></li>
                                            <% } %>
                                            <%for (int l = 0; l < (5 - int.Parse(ProductModel.Rating.ToString())); l++)
                                                {%>
                                            <li><i class="fa fa-star-0"></i></li>
                                            <% } %>
                                            <span class="comment-author-name"><%# Eval("Name") %></span>
                                            <p class="comment-content"><%# Eval("Description") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </article>
                        </li>
                    </ul>
                    <a class="popup-text btn btn-primary" href="#review-dialog" data-effect="mfp-zoom-out"><i class="fa fa-pencil"></i>Bir yorum ekle</a>
                </div>
            </div>
        </div>
        <div class="gap"></div>
        <h3>İlgili Ürünler</h3>
        <div class="gap gap-mini"></div>
        <div class="row row-wrap">
            <% for (int i = 0; i < tableRelatedProducts.Rows.Count; i++)
                { %>
            <div class="col-md-4">
                <div class="product-thumb">
                    <header class="product-header">
                        <img src="<%= tableRelatedProducts.Rows[i]["Image"] %>" alt="Image Alternative text" title="<%= tableRelatedProducts.Rows[i]["Title"] %>" />
                    </header>
                    <div class="product-inner">
                        <ul class="icon-group icon-list-rating" title="<%= tableRelatedProducts.Rows[i]["Rating"]%> /5 rating" />
                        <% for (int k = 0; k < int.Parse(tableRelatedProducts.Rows[i]["Rating"].ToString()); k++)
                            { %>
                        <li class="selected"><i class="fa fa-star"></i></li>
                        <% } %>
                        <%for (int l = 0; l < (5 - int.Parse(tableRelatedProducts.Rows[i]["Rating"].ToString())); l++)
                            {%>
                        <li><i class="fa fa-star-o"></i></li>
                        <% } %>
                                        </ul>
                                        <h5 class="product-title"><%= tableRelatedProducts.Rows[i]["Title"]%></h5>
                        <p class="product-desciption"><%= tableRelatedProducts.Rows[i]["SubTitle"] %></p>
                        <div class="product-meta">
                            <ul class="product-price-list">
                                <li><span class="product-price"><%= tableRelatedProducts.Rows[i]["Price"]%></span>
                                </li>
                            </ul>
                            <ul class="product-actions-list">
                                <li><a class="btn btn-sm" href="#"><i class="fa fa-shopping-cart"></i>Sepete Ekle</a>
                                </li>
                                <li><a class="btn btn-sm" href="product.aspx?id=<%= tableRelatedProducts.Rows[i]["ID"]%>"><i class="fa fa-bars"></i>Detaylar</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <div class="gap gap-small"></div>
    </div>
</asp:Content>
