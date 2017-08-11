using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaretProjesi
{
    public partial class _default : System.Web.UI.Page
    {
        protected DataTable HomePagePopularProducts;
        protected DataTable HomePageRecentProducts;
        protected void Page_Load(object sender, EventArgs e)
        {
            HomePagePopularProducts = Functions.GetPopularProductsData(6);
            HomePageRecentProducts = Functions.GetHomePageRecentProductData(8);

            rptHomePageSlider.DataSource = Functions.GetHomePageSlidersData();
            rptHomePageSlider.DataBind();

            rptHomePagePromo.DataSource = Functions.GetHomePagePromoData();
            rptHomePagePromo.DataBind();


        }
    }
}