using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Script;
using System.Diagnostics;

namespace WebApplication1
{
    public partial class Department : System.Web.UI.Page
    {
        SQLConnClass connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SQLConnClass();

            if (Session["Department_number"] != null) {
                GVDoctor.DataBind();
            }

            if (Session["hospital_id"] != null)
            {

                string hospitalId = (string)Session["hospital_id"].ToString();

                connection.retrieveData("select * from hospital where id = " + hospitalId);
                if (connection.sqlTable.Rows.Count > 0)
                {
                    hospiName.InnerHtml = connection.sqlTable.Rows[0]["Name"].ToString();
                   
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string hospital_id = Session["hospital_id"].ToString();
            connection.retrieveData("select MAX( dno) as dno from department where hospital_id = '"+ hospital_id+"'");

            if (connection.sqlTable.Rows.Count > 0)
            {
             int newid = int.Parse( connection.sqlTable.Rows[0]["dno"].ToString()) +1;

                connection.commandExec("INSERT INTO department VALUES('"+ newid + "', '"+ TBdname.Text+"', '"+hospital_id+"');");
                GVDepartment.DataBind();
            }

               
        }
       
        protected void GVDepartment_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string Department_number = GVDepartment.Rows[e.NewSelectedIndex].Cells[0].Text;

            Session["Department_number"] = Department_number;
            GVDoctor.DataBind();
            DVDepartment.DataBind();
           // DVDepartment. = GVDepartment.Rows[e.NewSelectedIndex];
            //Debug.WriteLine(department_id);
        }

        protected void GVDoctor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
                string Doctor_ssn = GVDoctor.Rows[e.NewSelectedIndex].Cells[0].Text;
                Session["Doctor_ssn"] = Doctor_ssn;
                Response.Redirect("Doctor.aspx", false);
                Context.ApplicationInstance.CompleteRequest();

        }

        protected void DVDepartment_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GVDepartment.DataBind();
        }

        protected void GVDepartment_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DVDepartment.DataBind();
        }

        protected void GVDepartment_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DVDepartment.DataBind();
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not delete');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not update');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not inseart ');", true);

                e.ExceptionHandled = true;
            }

        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not select ');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void DVDepartment_PreRender(object sender, EventArgs e)
        {
            if (DVDepartment.DataItemCount == 0)
            {
                DVDepartment.ChangeMode(DetailsViewMode.Insert);
            }
            else {
                DVDepartment.ChangeMode(DetailsViewMode.ReadOnly);
            }
                
        }

        protected void GVDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            DVDepartment.ChangeMode(DetailsViewMode.ReadOnly);

        }
    }
}