using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Software_Reengineering
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Session["UserID"] != null)
            {

                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);

                con.Open();
                // string strSelect = "SELECT count([Order].CustomerID) FROM [Order] INNER JOIN Gallery ON [Order].DrawID = Gallery.DrawID WHERE ([Order].CustomerID = @CustomerID)";
                string strSelect = "Select count(*) From [Order] Where UserID= @UserID";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);

                int numRowAffected = (int)cmdSelect.ExecuteScalar();

                if (numRowAffected > 0)
                {
                    // return insert success
                    // ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Delete successfully! " + "');", true);

                }
                else
                {
                    Label3.Text = "No record found";
                }
            }
        }

        protected void Unnamed_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                Response.Redirect("OrderHistoryDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx"); 
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}