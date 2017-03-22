using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Script;

namespace WebApplication1
{
    public partial class Patient : System.Web.UI.Page
    {



        SQLConnClass connection;
        protected void Page_Load(object sender, EventArgs e)
        {

          

            connection = new SQLConnClass();
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

        protected void GVPatient_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            DVPatient.DataBind();
            DVDiagnose.DataBind();
            DVDoctor.DataBind();
            DVPatient.ChangeMode(DetailsViewMode.ReadOnly);


        }

        protected void DVPatient_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GVPatient.DataBind();
        }

        protected void GVPatient_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DVPatient.DataBind();
            DVDiagnose.DataBind();
            DVDoctor.DataBind();

        }

        protected void GVPatient_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DVPatient.DataBind();
            DVDiagnose.DataBind();
            DVDoctor.DataBind();

        }

        protected void GVPatient_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string Patient_ssn = GVPatient.Rows[e.NewSelectedIndex].Cells[0].Text;
            Session["Patient_ssn"] = Patient_ssn;

            connection.retrieveData("select dssn from [diagnose] where pssn = " + Patient_ssn);

            if (connection.sqlTable.Rows.Count > 0)
            {
                string Doctor_ssn = connection.sqlTable.Rows[0]["dssn"].ToString();
                Session["Doctor_ssn"] = Doctor_ssn;
                Debug.WriteLine("test: " + Doctor_ssn);
                Debug.WriteLine("test:--------");
            }
            else {
                Session["Doctor_ssn"] = "-1";
            }
           


        }

        protected void SqlDataSourcePatient_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not delete');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourcePatient_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not update');", true);

                e.ExceptionHandled = true;
            }
        }
        protected void SqlDataSourceDVPatient_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not inseart ');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourcePatient_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not select ');", true);

                e.ExceptionHandled = true;
            }

        }

        protected void DVPatient_PreRender(object sender, EventArgs e)
        {
            if (DVPatient.DataItemCount == 0)
            {
                DVPatient.ChangeMode(DetailsViewMode.Insert);
            }
            else {
                DVPatient.ChangeMode(DetailsViewMode.ReadOnly);
            }
        }
    }
}