using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Script;
using System.Diagnostics;
using System.Data;

namespace WebApplication1
{
    public partial class Doctor : System.Web.UI.Page
    {
        SQLConnClass connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SQLConnClass();

            updatePatient();

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

        private void updatePatient() {

           /* if (Session["Doctor_ssn"] != null)
            {
                string Doctor_ssn = Session["Doctor_ssn"].ToString();

                connection.retrieveData("SELECT [patient].* FROM [patient] ,  [diagnose] WHERE ( [patient].ssn = [diagnose].pssn and [diagnose].dssn = '" + Doctor_ssn + "')");
                GVPatient.DataSource = connection.sqlTable;
                GVPatient.DataBind();
            }
            */

        }

        protected void OnInseart(object sender, EventArgs e)
        {

        }

        protected void GVDoctor_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string Doctor_ssn = GVDoctor.Rows[e.NewSelectedIndex].Cells[0].Text;
            Session["Doctor_ssn"] = Doctor_ssn;
            //GVPatient.DataBind();
            DVDoctor.DataBind();
          

        }

        protected void GVPatient_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string Patient_ssn = GVPatient.Rows[e.NewSelectedIndex].Cells[0].Text;
            Session["Patient_ssn"] = Patient_ssn ;
            Debug.WriteLine(Patient_ssn);

            Response.Redirect("Patient.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void GVPatient_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVDoctor_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DVDoctor.DataBind();
        }

        protected void GVDoctor_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DVDoctor.DataBind();
        }

        protected void DVDoctor_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GVDoctor.DataBind();
        }

        protected void GVDoctor_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            DVDoctor.DataBind();
            GVPatient.DataBind();
            DVDoctor.ChangeMode(DetailsViewMode.ReadOnly);

        }

        protected void SqlDataSourceDoctor_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not delete');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourceDoctor_Updated(object sender, SqlDataSourceStatusEventArgs e)
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

        protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not select ');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void DVDoctor_PreRender(object sender, EventArgs e)
        {
            if (DVDoctor.DataItemCount == 0)
            {
                DVDoctor.ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                DVDoctor.ChangeMode(DetailsViewMode.ReadOnly);
            }
        }
    }
}