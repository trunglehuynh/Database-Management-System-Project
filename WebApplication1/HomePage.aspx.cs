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
    public partial class HomePage : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

            checkVisible();
        }
        private void checkVisible() {

            string hospital_id ="-1";

            if (Session["hospital_id"] != null)
            {
                hospital_id = Session["hospital_id"].ToString();
            }
        

            if (hospital_id == "-1")
            {
                TBPassword.Visible = true;
                TBUsername.Visible = true;
                login.Visible = true;
                Logout.Visible = false;
            }
            else
            {
                TBPassword.Visible = false;
                TBUsername.Visible = false;
                login.Visible = false;
                Logout.Visible = true;
            }

        }

        protected void login_Click(object sender, EventArgs e)
        {
          
            SQLConnClass connection = new SQLConnClass();

              connection.retrieveData("select * from admin");

       
            Debug.WriteLine(connection.sqlTable.Rows[0]["username"].ToString());
            Debug.WriteLine(connection.sqlTable.Rows[0]["password"].ToString());

            

            if (connection.sqlTable.Rows.Count > 0)
            {
                if (connection.sqlTable.Rows[0]["password"].ToString() == TBPassword.Text && connection.sqlTable.Rows[0]["username"].ToString() == TBUsername.Text)

                {
                    // Server.Transfer("Hospital.aspx");
                    // Page.Response.Redirect("Hospital.aspx?hospital_id=" + connection.sqlTable.Rows[0]["hospital_id"].ToString());
                    Session["hospital_id"] = connection.sqlTable.Rows[0]["hospital_id"].ToString();
                    checkVisible();
                    Response.Redirect("Hospital.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();

                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Loging successfull')", true);
                    // return;
                }
                else {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('wrong username or password')", true);


                }


            }
            
         
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["hospital_id"] = "-1";
            Session["Department_number"] = "-1";
            Session["Doctor_ssn"] = "-1";
            Session["Patient_ssn"] = "-1";
            Session["Car_id"] = "-1";
            Session["Helicopter_id"] = "-1";
            checkVisible();
        }
    }
}
