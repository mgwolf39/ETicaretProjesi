﻿using ETicaretProjesi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaretProjesi
{
    public partial class product : System.Web.UI.Page
    {
        protected ProductModel ProductModel = new ProductModel();
        protected DataTable tableRelatedProducts = new DataTable();
        protected DataTable tableIPAddress = new DataTable();
        protected string curIPAddress;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString.Get("id")))
            {
                DataTable tableProductModel = Functions.GetProductData(int.Parse(Request.QueryString.Get("id").ToString()));

                ProductModel.ID = tableProductModel.Rows[0]["ID"].ToString();
                ProductModel.Title = tableProductModel.Rows[0]["Title"].ToString();
                ProductModel.SubTitle = tableProductModel.Rows[0]["SubTitle"].ToString();
                ProductModel.Price = tableProductModel.Rows[0]["Price"].ToString();
                ProductModel.Description = tableProductModel.Rows[0]["Description"].ToString();
                ProductModel.ShippingInfo = tableProductModel.Rows[0]["ShippingInfo"].ToString();
                ProductModel.ReviewCount = tableProductModel.Rows.Count.ToString();
                ProductModel.Rating = tableProductModel.Rows[0]["Rating"].ToString();
                ProductModel.CategoryID = tableProductModel.Rows[0]["CategoryID"].ToString();

                rptProductImage.DataSource = Functions.GetProductImage(int.Parse(Request.QueryString.Get("id").ToString()));
                rptProductImage.DataBind();

                rptProductReviews.DataSource = Functions.GetProductReviews(int.Parse(Request.QueryString.Get("id").ToString()));
                rptProductReviews.DataBind();
                
                Functions.InsertCounter(Request.QueryString.Get("id"),GetIPAddress());
                
            }
            else
            {
                Response.Redirect("default.aspx");
            }

        }
         protected string GetIPAddress()
        {
            string VisitorsIPAddr = string.Empty;
            if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            }
            else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
            {
                VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
            }
            return VisitorsIPAddr;
        }
    }
}