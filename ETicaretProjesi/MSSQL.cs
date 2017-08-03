using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace ETicaretProjesi
{
        public class MSSQL
        {
            static SqlConnection connect;

            public static bool OpenConnection()
            {
                connect = new SqlConnection(@"Data Source=HASAN-PC;Initial Catalog=ETicaretProje;Integrated Security=False;User ID=muhsinlogin;Password=Muhsin123!");
                try
                {
                    connect.Open();
                    connect.Close();
                    return true;
                }
                catch { return false; }
            }

            public static DataTable ExecSelect(string Query)
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(Query, connect);
                DataTable tableTemp = new DataTable();
                try
                {
                    connect.Open();
                    dataAdapter.Fill(tableTemp);
                    connect.Close();
                    return tableTemp;
                }
                catch
                {
                    connect.Close();
                    return null;
                }
            }

            public static int ExecQuery(string Query)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = Query;
                cmd.Connection = connect;
                int RowsCount;
                try
                {
                    connect.Open();
                    RowsCount = cmd.ExecuteNonQuery();
                    connect.Close();
                    return RowsCount;
                }
                catch
                {
                    connect.Close();
                    return -1;
                }
            }

        }
    }
