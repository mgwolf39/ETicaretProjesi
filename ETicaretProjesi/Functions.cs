using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ETicaretProjesi
{
    public class Functions
    {
        public static DataTable GetCategoryListData()
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select * from Category"));
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
        public static DataTable GetPopularProductsData(int top = 6)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title, p.SubTitle, p.Price,(select top 1 isnull(pr.Rating,0) from ProductReview pr where pr.ProductID= p.ID) as Rating, (select top 1 pm.URL from ProductImages pm where pm.ProductID = p.ID) as Image, (select top 1 URL from ProductImages where ProductID = p.ID order by ID desc ) as SecondImage, (select count(ID) from IPAddress where ProductID = p.ID ) as Clicks from Products p order by Clicks desc", top));
        }
        public static DataTable GetHomePageRecentProductData(int top = 8)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title, p.SubTitle, p.Price,(select top 1 isnull(pr.Rating,0) from ProductReview pr where pr.ProductID= p.ID) as Rating, (select top 1 pm.URL from ProductImages pm where pm.ProductID = p.ID) as Image, (select top 1 URL from ProductImages where ProductID = p.ID order by ID desc ) as SecondImage from Products p order by p.Date desc", top));
        }
        public static DataTable GetRecentProductsData(int top)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.Title,p.Price,p.ID, (select top 1 pm.URL from ProductImages pm where pm.ID = p.ID) as Image from Products p order by p.Date desc", top));
        }
        public static DataTable GetSidebarPopularProducts(int top)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title, p.Price, (select top 1 URL from ProductImages pm where pm.ProductId = p.ID) from Products p order by p.Date desc", top));
        }
        public static DataTable GetRecentReviewsData(int top)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title, p.Price, (select top 1 URL from ProductImages pm where pm.ProductID = p.ID ) as Image, pr.Rating from ProductReview pr left join Products p on p.ID = pr.ProductID order by pr.Date desc", top));
        }
        public static DataTable GetProductData(int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select p.ID ,p.CategoryID ,(select top 1 Rating from ProductReview pr where pr.ProductID = p.ID ) as Rating, p.Title as Title, p.SubTitle as SubTitle, p.Price as Price, p.Description as Description, (select top 1 pm.URL from ProductImages pm where pm.ProductID = p.ID) as Image, (select top 1 URL from ProductImages where ProductID = p.ID order by ID desc ) as SecondImage, p.ShippingInfo from Products p where p.ID = '{0}'", id));
        }
        public static DataTable GetCategoryProducts(int startIndex, int endIndex, int curID, string orderBy, string qAscOrDesc)
        {
            MSSQL.OpenConnection();
            string qCategory = (curID > 0) ? String.Format(" where p.CategoryID = '{0}'", curID) : "";
            string qOrderBy = String.Format("order by {0}", orderBy);
            return MSSQL.ExecSelect(String.Format("select tbl.*,(select top 1 URL from ProductImages where ProductID = tbl.ID) as Image, (select top 1 URL from ProductImages where ProductID = tbl.ID order by ID desc ) as SecondImage, (select COUNT (ID) from IPAddress where ProductID = tbl.ID ) as clicks ,(select isnull(avg(Rating),0) from ProductReview where ProductID = tbl.ID) as Rating from (select ROW_NUMBER() OVER(ORDER BY Date DESC) AS RowIndex, p. * from Products p {2}) tbl where tbl.RowIndex >= '{0}' and tbl.RowIndex <= '{1}' {3} {4}", startIndex, endIndex,qCategory,qOrderBy,qAscOrDesc));
        }
        public static int GetCategoryProductCount(int CategoryID)
        {
            MSSQL.OpenConnection();
            string query = (CategoryID > 0) ? String.Format(" where p.CategoryID = '{0}'", CategoryID) : "";
            return Convert.ToInt16(MSSQL.ExecSelect(String.Format("select count(ID) from Products p {0}",query)).Rows[0][0]);
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
        public static DataTable GetProductReviews(int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select pr.*, c.* from ProductReview pr left join Customer c on c.ID = pr.CustomerID where pr.ProductID = '{0}'", id));
        }
        public static DataTable GetRelatedProductData(int id, int category, int top = 3)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title as Title,  p.SubTitle as SubTitle, p.Price as Price, (select top 1 pm.URL from ProductImages pm where pm.ProductID = p.ID) as Image, (select top 1 URL from ProductImages where ProductID = p.ID order by ID desc ) as SecondImage, (select top 1 pr.Rating) as Rating from Products p  left join ProductReview pr on pr.ProductID = p.ID where p.CategoryID = '{1}' and p.ID != '{2}' order by pr.Rating ", top, category, id));
        }
        public static DataTable GetCategoryPageDefault(int top = 18)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select top {0} p.ID, p.Title, p.SubTitle, p.Price,(select top 1 pr.Rating from ProductReview pr where pr.ProductID= p.ID) as Rating, (select top 1 pm.URL from ProductImages pm where pm.ProductID = p.ID) as Image,(select top 1 URL from ProductImages where ProductID = p.ID order by ID desc ) as SecondImage from Products p order by p.Date", top));
        }

        public static DataTable GetCategoryHorizontalPageProductData(int id, int startIndex, int endIndex, string orderBy="", string qAscOrDesc="")
        {
            MSSQL.OpenConnection();
            string query = ( id > 0 ? string.Format(" where p.CategoryID = '{0}'", id) : "");
            string qOrderBy = String.Format("order by {0}", orderBy);
            return MSSQL.ExecSelect(String.Format("select tbl.RowIndex,tbl.ID, tbl.Title, tbl.SubTitle, tbl.Price,(select top 1 URL from ProductImages where ProductID = tbl.ID )as Image,(select top 1 URL from ProductImages where ProductID = tbl.ID order by ID desc) as SecondImage, (select COUNT (ID) from IPAddress where ProductID = tbl.ID ) as clicks , isnull((select  avg(Rating) from ProductReview where ProductID = tbl.ID),0) as Rating from (select Row_Number() OVER (ORDER BY DATE desc) as RowIndex, p.* from Products p{0}) tbl where tbl.RowIndex >= '{1}' and tbl.RowIndex <= '{2}' {3} {4}", query, startIndex, endIndex,qOrderBy,qAscOrDesc));
        }
        public static DataTable GetIPAddress(int id)
        {
            MSSQL.OpenConnection();
            return MSSQL.ExecSelect(String.Format("select * from IPAddress where ProductID = '{0}'",id));
        }
        public static void UpdateClickCounter(int id, string IP)
        {
            MSSQL.OpenConnection();
            MSSQL.ExecSelect(String.Format("UPDATE Products set ClickCounter += 1 where ID = '{0}'",id));
            MSSQL.ExecSelect(String.Format("insert into IPAddress (ProductID,IP) values ('{0}','{1}')", id, IP));
        }
        public static void InsertCounter(string ProductID, string IP)
        {
            MSSQL.OpenConnection();
            DataTable tableCount = MSSQL.ExecSelect(String.Format("select IP from IPAddress where ProductID = '{0}' and IP = '{1}'",ProductID,IP));
            if (tableCount.Rows.Count <= 0)
            {
                MSSQL.ExecQuery(String.Format("insert into IPAddress (ProductID,IP) values ('{0}','{1}')",ProductID,IP));
                MSSQL.ExecQuery(String.Format("UPDATE Products set ClickCounter += 1 where ID = '{0}'", ProductID));
            }
        }
    }
}