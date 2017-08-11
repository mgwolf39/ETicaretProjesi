using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaretProjesi
{
    public partial class category_horizontal : System.Web.UI.Page
    {
        protected int pageContainerItemCount = 12, curPage=1;

        protected DataTable ProductData;

        protected void Page_Load(object sender, EventArgs e)
        {
            curPage = !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? int.Parse(Request.QueryString.Get("page")) : 1 ;

            int startIndex = !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? ((int.Parse(Request.QueryString.Get("page")) * pageContainerItemCount) - 11) : 1 ;
            int endIndex = !String.IsNullOrEmpty(Request.QueryString.Get("page")) ? (int.Parse(Request.QueryString.Get("page")) * pageContainerItemCount) : pageContainerItemCount;
            int curID = !String.IsNullOrEmpty(Request.QueryString.Get("id")) ? int.Parse(Request.QueryString.Get("id").ToString()) : 0 ;
            string orderBy = !String.IsNullOrEmpty(Request.QueryString.Get("orderby")) ? Request.QueryString.Get("orderby").ToString() : string.Format("tbl.date");
            string AscOrDesc = !String.IsNullOrEmpty(Request.QueryString.Get("orderkind")) ? Request.QueryString.Get("orderkind").ToString() : string.Format("desc");

            ProductData = Functions.GetCategoryHorizontalPageProductData(curID, startIndex,endIndex,orderBy,AscOrDesc);
                        
            rptCategoryList.DataSource = Functions.GetCategoryListData();
            rptCategoryList.DataBind();

        }

        protected int GetPageCount()
        {
            int temp = Convert.ToInt16(Math.Ceiling(Convert.ToDouble(Convert.ToDouble(Functions.GetCategoryProductCount(!String.IsNullOrEmpty(Request.QueryString.Get("id")) ? int.Parse(Request.QueryString.Get("id")) : 0) / Convert.ToDouble(pageContainerItemCount)))));
            return temp > 0 ? temp : 1;
        }



    }
    }