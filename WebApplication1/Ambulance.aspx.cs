using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Script;

namespace WebApplication1
{
    public partial class Ambulance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLConnClass connection = new SQLConnClass();
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

        protected void DVCar_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GVCAR.DataBind();
        }

        protected void GVCAR_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void GVCAR_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Session["Car_id"] = "-1";
            DVCar.DataBind();
        }

        

        protected void GVCAR_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Session["Car_id"] = GVCAR.Rows[e.NewSelectedIndex].Cells[0].Text;
            DVCar.DataBind();
        }

        protected void GVCAR_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DVCar.DataBind();
        }

        protected void GVHelicopter_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Session["Helicopter_id"] = "-1";
            DVHeli.DataBind();
        }

        protected void GVHelicopter_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DVHeli.DataBind();
        }

        protected void GVHelicopter_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GVHelicopter_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Session["Helicopter_id"] = GVHelicopter.Rows[e.NewSelectedIndex].Cells[0].Text;
            DVHeli.DataBind();
        }

        protected void DVHeli_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GVHelicopter.DataBind();
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

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not select ');", true);

                e.ExceptionHandled = true;
            }

        }

        protected void SqlDataSourceDVCar_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not inseart ');", true);

                e.ExceptionHandled = true;
            }

        }

        protected void SqlDataSourceHelicopter_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not delete');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourceHelicopter_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not update');", true);

                e.ExceptionHandled = true;
            }

        }

        protected void SqlDataSourceHelicopter_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not select ');", true);

                e.ExceptionHandled = true;
            }

        }

        protected void SqlDataSourceDVHeli_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Can not inseart ');", true);

                e.ExceptionHandled = true;
            }
        }

        protected void DVCar_PreRender(object sender, EventArgs e)
        {
           
            if (DVCar.DataItemCount == 0)
            {
                DVCar.ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                DVCar.ChangeMode(DetailsViewMode.ReadOnly);
            }
        }

        protected void DVHeli_PreRender(object sender, EventArgs e)
        {
            if (DVHeli.DataItemCount == 0)
            {
                DVHeli.ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                DVHeli.ChangeMode(DetailsViewMode.ReadOnly);
            }
        }
    }
}