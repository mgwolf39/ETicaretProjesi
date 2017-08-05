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
        public static DataTable GetPoplarProductsData(int top = 6)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.*, (select top 1 pi.URL)as ProductImage from Products p left join ProductImages pi on pi.PostID = p.ID order by p.ClickCount", top));
        }
        public static DataTable GetRecentProductsData(int top)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.*, (select top 1 pi.URL)as ProductImage from Products p left join ProductImages pi on pi.PostID = p.ID order by p.Date desc", top));
        }
        public static DataTable GetPopularProducts(int top)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format(""));
        }
        public static DataTable GetRecentReviewsData(int top)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title, (select top 1 URL from ProductImages pm where pm.ProductID = p.ID ) as Image, pr.Rating from ProductReview pr left join Products p on p.ID = pr.ProductID order by pr.Date desc", top));
        }
        public static DataTable GetProductData(int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select p.ID ,p.CategoryID ,(select top 1 Rating from ProductReview pr where pr.ProductID = '{0}' ) as Rating, p.Title as Title, p.SubTitle as SubTitle, p.Price as Price, p.Description as Description, pm.URL as Image, p.ShippingInfo from Products p left join ProductImages pm on pm.ProductID = p.ID where p.ID = '{0}'", id));
        }
        public static DataTable GetProductImage(int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select pm.URL as Image from ProductImages pm left join Products p on p.ID = pm.ProductId where pm.ProductID = '{0}'", id));
        }
        public static DataTable GetProductDetails(int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select pd.* from ProductDetails pd where pd.ProductID = '{0}'", id));
        }
        public static DataTable GetProductReviews (int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select pr.*, c.* from ProductReview pr left join Customer c on c.ID = pr.CustomerID where pr.ProductID = '{0}'", id));
        }
        public static DataTable GetRelatedProductData (int id,int category ,int top=3)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title as Title,  p.SubTitle as SubTitle, p.Price as Price, (select top 1 pm.URL) as Image, (select top 1 pr.Rating) as Rating from Products p  left join ProductImages pm on pm.ProductID = p.ID left join ProductReview pr on pr.ProductID = p.ID where p.CategoryID = '{1}' and p.ID != '{2}'", top,category, id));
        }



    }
}