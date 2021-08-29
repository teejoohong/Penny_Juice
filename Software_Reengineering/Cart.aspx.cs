using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Software_Reengineering
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Adding")
            {

            }
            else if(e.CommandName == "Subtract")
            {

            }
            else if(e.CommandName == "Delete")
            {

                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                string selectedDraw = e.CommandArgument.ToString();
                con.Open();
                string strSelect = "DELETE from CartGallery Where JuiceID=@JuiceID and UserID = @UserID";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdSelect.Parameters.AddWithValue("@JuiceID", selectedDraw);

                int numRowAffected = cmdSelect.ExecuteNonQuery();


                if (numRowAffected > 0)
                {
                    SqlConnection conn;
                    string strconn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    conn = new SqlConnection(strconn);

                    conn.Open();
                    string strSelect2 = "DELETE  from CheckOut Where UserID = @UserID";
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, conn);

                    cmdSelect2.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    int numRowAffected2 = cmdSelect2.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("Cart.aspx");
                }
                else
                {
                    // return insert failed
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Delete failed! " + "');", true);
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Chk_Empty_CheckedChanged(object sender, EventArgs e)
        {

        }


    }
}