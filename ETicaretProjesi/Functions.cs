using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ETicaretProjesi
{
    public class Functions
    {
        public static DataTable GetCategoriesData()
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select * from Categories"));
        }
        public static DataTable GetHomePageSlidersData()
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select * from HomePageSlider"));
        }

        public static DataTable GetHomePagePromoData()
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select * from HomePagePromo"));
        }
        public static DataTable GetHomePagePopularProductsData(int top=6)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.*, (select top 1 pi.URL)as ProductImage from Products p left join ProductImages pi on pi.PostID = p.ID order by p.ClickCount", top));
        }
    }
}