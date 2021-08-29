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
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName== "AddToCart")
            {
                if (Session["UserID"] != null )
                {
                    SqlConnection con;
                    string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strcon);
                    string addedJuice = e.CommandArgument.ToString();
                    Boolean duplicate = false;
                    //checking value
                    con.Open();
                    string strSelectChecking = "Select * from CartGallery Where JuiceID=@JuiceID and UserID = @UserID";
                    SqlCommand cmdSelect = new SqlCommand(strSelectChecking, con);

                    cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmdSelect.Parameters.AddWithValue("@JuiceID", addedJuice);

                    SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            if (addedJuice.Equals(dtr["JuiceID"]) && Session["Value"].Equals(dtr["UserID"]))
                            {
                                duplicate = true;
                                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Already added! " + "');", true);
                            }
                        }
                    }

                    con.Close();


                    //insert value
                    if (!duplicate)
                    {
                        con.Open();
                        string strSelect1 = "Select Price from Gallery Where JuiceID=@JuiceID";
                        SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);

                        cmdSelect1.Parameters.AddWithValue("@JuiceID", addedJuice);
                        System.Decimal totalPrice = (System.Decimal)cmdSelect1.ExecuteScalar();

                        con.Close();

                        con.Open();

                        string strInsert = "Insert into CartGallery (UserID, JuiceID,TotalPrice) Values (@UserID, @JuiceID,@TotalPrice)";

                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        cmdInsert.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        cmdInsert.Parameters.AddWithValue("@JuiceID", addedJuice);
                        cmdInsert.Parameters.AddWithValue("@TotalPrice", totalPrice);
                 
                        int numRowAffected1 = cmdInsert.ExecuteNonQuery();
                        if (numRowAffected1 > 0)
                        {
                            // return insert success
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added successfully! " + "');", true);
                        }
                        else
                        {
                            // return insert failed
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "update failed! " + "');", true);
                        }
                        con.Close();
                    }
                }
                else
                {
                    // not allow to add, please sign in first
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "log in first! " + "');", true);
                }
            }
        }
    }
}