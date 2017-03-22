using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Script;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SQLConnClass connection = new SQLConnClass();
            // Debug.WriteLine("test");

            if (Session["hospital_id"] != null)
            {

                string hospitalId = (string)Session["hospital_id"].ToString();

                connection.retrieveData("select * from hospital where id = " + hospitalId);
                if (connection.sqlTable.Rows.Count > 0)
                {
                    hospiName.InnerHtml = connection.sqlTable.Rows[0]["Name"].ToString();
                    hos_name.InnerHtml = "Hospital name: "+connection.sqlTable.Rows[0]["Name"].ToString();
                    Hos_id.InnerHtml = "Hospital Id: " + connection.sqlTable.Rows[0]["Id"].ToString();
                    hos_address.InnerHtml = "Hospital Address: "+ connection.sqlTable.Rows[0]["Address"].ToString();

                }
            }

        }

        protected void GVDepartment_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string Department_number = GVDepartment.Rows[e.NewSelectedIndex].Cells[0].Text;
            Session["Department_number"] = Department_number;
            Response.Redirect("Department.aspx", false);
            Context.ApplicationInstance.CompleteRequest();

        }
    }
}