using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaretProjesi
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptHomePageSlider.DataSource = Functions.GetHomePageSlidersData();
            rptHomePageSlider.DataBind();

            rptHomePagePromo.DataSource = Functions.GetHomePagePromoData();
            rptHomePagePromo.DataBind();

            rptHomePagePopularProducts.DataSource = Functions.GetHomePagePopularProductsData();
            rptHomePagePopularProducts.DataBind(); 
        }
    }
}