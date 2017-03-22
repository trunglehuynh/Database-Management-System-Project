using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication1.Script
{

    public class SQLConnClass
    {
        SqlConnection sqlconn = new SqlConnection();
        public DataTable sqlTable = new DataTable();

        public SQLConnClass() {

            sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

        }

        public void retrieveData(string command) {

            try {
                sqlTable.Clear();
                sqlconn.Open();
                SqlDataAdapter da = new SqlDataAdapter(command, sqlconn);
                da.Fill(sqlTable);
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("<script> alart('something goes wrong'  "+ ex.Message+"); </script>");

            }
            finally {

                sqlconn.Close();
            }

        }
       // using for inseart update and delete
        public void commandExec(string command) {

            try
            {

                sqlconn.Open();
                SqlCommand sqlcomm = new SqlCommand(command, sqlconn);
                int row = sqlcomm.ExecuteNonQuery();

                if (row > 0)
                {
                    HttpContext.Current.Response.Write("<script> alart('it is working'); </script>");
                }
                else {

                    HttpContext.Current.Response.Write("<script> alart('something goes wrong'); </script>");
                }
                    

            }
            catch (Exception ex)
            {

                HttpContext.Current.Response.Write("<script> alart('something goes wrong'  " + ex.Message + "); </script>");


            }
            finally
            {

                sqlconn.Close();
            }
        }
    }
}