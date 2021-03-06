﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaretProjesi
{
    public partial class Left_Sidebar : System.Web.UI.MasterPage
    {
        protected int top = 4;
        protected DataTable tableRecentReviews;
        protected void Page_Load(object sender, EventArgs e)
        {

            rptsRecentProducts.DataSource = Functions.GetRecentProductsData(4);
            rptsRecentProducts.DataBind();

            rptSidebarPopularProducts.DataSource = Functions.GetSidebarPopularProducts(4);
            rptSidebarPopularProducts.DataBind();

            tableRecentReviews = Functions.GetRecentReviewsData(4);
        }
    }
}