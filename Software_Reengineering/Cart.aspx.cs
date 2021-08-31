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
            if (Session["UserID"] != null)
            {
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);

                //later user inside the while 
                SqlConnection conn;
                string strconn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                conn = new SqlConnection(strconn);

                //use for the dtr1 of for the extract of gallery value
                SqlConnection con1;
                string strcon1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con1 = new SqlConnection(strcon1);

                if (!IsPostBack)
                {   //cleat out the cart first, to prevent anything inside and data crash occur
                    con.Open();
                    string strSelect2 = "DELETE from CheckOut Where UserID = @UserID2";
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
                    cmdSelect2.Parameters.AddWithValue("@UserID2", Session["UserID"]);
                    int numRowAffected2 = cmdSelect2.ExecuteNonQuery();
                    con.Close();

                    // check the row inside the cart
                    con.Open();
                    string strSelect4 = "Select count(*) from CartGallery Where UserID = @UserID4";
                    SqlCommand cmdSelect4 = new SqlCommand(strSelect4, con);
                    cmdSelect4.Parameters.AddWithValue("@UserID4", Session["UserID"]);
                    int numRowAffected4 = (int)cmdSelect4.ExecuteScalar();
                    con.Close();

                    //if contain rows, update the check the quantity of item left and update the value
                    if (numRowAffected4 > 0)
                    {
                        //extract the value from gallery (newest)
                        Label3.Text = numRowAffected4.ToString();

                        for (int i = 0; i < numRowAffected4; i++)
                        {
                            con1.Open();
                            string strSelect3 = "Select * from Gallery";
                            SqlCommand cmdSelect3 = new SqlCommand(strSelect3, con1);
                            SqlDataReader dtr1 = cmdSelect3.ExecuteReader();

                            con.Open();
                            string strSelect5 = "Select * from CartGallery Where UserID = @UserID5";
                            SqlCommand cmdSelect5 = new SqlCommand(strSelect5, con);
                            cmdSelect5.Parameters.AddWithValue("@UserID5", Session["UserID"]);
                            SqlDataReader dtr = cmdSelect5.ExecuteReader();
                            if (dtr.HasRows)
                            {
                                while (dtr1.Read() && dtr.Read())
                                {

                                    if (dtr1["JuiceID"].ToString().Equals(dtr["JuiceID"]) && (int.Parse(dtr1["Total"].ToString()) < int.Parse(dtr["Quantity"].ToString())))
                                    {
                                        if (int.Parse(dtr1["Total"].ToString()) == 0)
                                        {
                                            conn.Open();
                                            string strUpdate = "UPDATE [CartGallery] SET Quantity = @Quantity WHERE JuiceID = @JuiceID";
                                            SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);

                                            cmdUpdate.Parameters.AddWithValue("@JuiceID", dtr["JuiceID"]);
                                            cmdUpdate.Parameters.AddWithValue("@Quantity", 0);
                                            int numRowAffected6 = cmdUpdate.ExecuteNonQuery();
                                            conn.Close();

                                        }
                                        else if (int.Parse(dtr1["Total"].ToString()) < int.Parse(dtr["Quantity"].ToString()))
                                        {
                                            conn.Open();
                                            string strUpdate = "UPDATE [CartGallery] SET Quantity = @Quantity WHERE JuiceID = @JuiceID";
                                            SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);

                                            cmdUpdate.Parameters.AddWithValue("@JuiceID", dtr["JuiceID"]);
                                            cmdUpdate.Parameters.AddWithValue("@Quantity", int.Parse(dtr1["Total"].ToString()));
                                            int numRowAffected7 = cmdUpdate.ExecuteNonQuery();
                                            conn.Close();
                                        }
                                    }
                                }
                            }
                            con.Close();
                            con1.Close();
                        }

                    }
                    else
                    {
                        Label3.Text = "No record found";
                    }
                }
            }
        }
            

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Adding")
            {
                // extract quantity value
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                con.Open();
                string strSelect = "SELECT Quantity from CartGallery Where JuiceID = @JuiceID1  AND UserID = @UserID1";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@JuiceID1", e.CommandArgument.ToString());
                cmdSelect.Parameters.AddWithValue("@UserID1", Session["UserID"]);
                int quantity = (int)cmdSelect.ExecuteScalar() + 1;
                con.Close();

                //extract the quantity of the total from gallery 
                con.Open();
                string strSelectTotal = "SELECT Total from Gallery Where JuiceID = @JuiceID2";
                SqlCommand cmdSelectTotal = new SqlCommand(strSelectTotal, con);

                cmdSelectTotal.Parameters.AddWithValue("@JuiceID2", e.CommandArgument.ToString());

                int total = (int)cmdSelectTotal.ExecuteScalar();
                con.Close();

                if (quantity <= total)
                {
                    //extract price
                    con.Open();
                    string strSelectPrice = "SELECT Price from Gallery Where JuiceID = @JuiceID3";
                    SqlCommand cmdSelectPrice = new SqlCommand(strSelectPrice, con);

                    cmdSelectPrice.Parameters.AddWithValue("@JuiceID3", e.CommandArgument.ToString());

                    System.Decimal price = (System.Decimal)cmdSelectPrice.ExecuteScalar();
                    con.Close();


                    // add the quantity
                    con.Open();
                    string strUpdate = "UPDATE [CartGallery] SET Quantity = @Quantity WHERE JuiceID = @JuiceID4 AND UserID = @UserID4";
                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                    cmdUpdate.Parameters.AddWithValue("@JuiceID4", e.CommandArgument.ToString());
                    cmdUpdate.Parameters.AddWithValue("@UserID4", Session["UserID"]);
                    cmdUpdate.Parameters.AddWithValue("@Quantity", quantity);
                    int numRowAffected = cmdUpdate.ExecuteNonQuery();
                    con.Close();

                    //update the total price value
                    con.Open();
                    double totalPrice = (double)price * quantity;
                    //totalPrice = totalPrice * quantity;
                    string strUpdate1 = "UPDATE [CartGallery] SET TotalPrice= @TotalPrice WHERE JuiceID = @JuiceID5 AND UserID = @UserID5";
                    SqlCommand cmdUpdate1 = new SqlCommand(strUpdate1, con);

                    cmdUpdate1.Parameters.AddWithValue("@JuiceID5", e.CommandArgument.ToString());
                    cmdUpdate1.Parameters.AddWithValue("@UserID5", Session["UserID"]);
                    cmdUpdate1.Parameters.AddWithValue("@TotalPrice", (System.Decimal)totalPrice);
                    int numRowAffected1 = cmdUpdate1.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    string strSelect2 = "DELETE  from CheckOut Where UserID = @UserID";
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);

                    cmdSelect2.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    int numRowAffected2 = cmdSelect2.ExecuteNonQuery();
                    con.Close();
                }
                Response.Redirect("Cart.aspx");

            }
            else if(e.CommandName == "Subtract")
            {
                // extract quantity value
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                con.Open();
                string strSelect = "SELECT Quantity from CartGallery Where JuiceID = @JuiceID  AND UserID = @UserID1";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@JuiceID", e.CommandArgument.ToString());
                cmdSelect.Parameters.AddWithValue("@UserID1", Session["UserID"]);
                int quantity = (int)cmdSelect.ExecuteScalar() - 1;
                con.Close();

                if (quantity > 0)
                {
                    // subtract the quantity
                    con.Open();
                    string strUpdate = "UPDATE [CartGallery] SET Quantity = @Quantity WHERE JuiceID = @JuiceID AND UserID = @UserID";
                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                    cmdUpdate.Parameters.AddWithValue("@JuiceID", e.CommandArgument.ToString());
                    cmdUpdate.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmdUpdate.Parameters.AddWithValue("@Quantity", quantity);
                    int numRowAffected = cmdUpdate.ExecuteNonQuery();
                    con.Close();

                    //extract price
                    con.Open();
                    string strSelectPrice = "SELECT Price from Gallery Where JuiceID = @JuiceID3";
                    SqlCommand cmdSelectPrice = new SqlCommand(strSelectPrice, con);

                    cmdSelectPrice.Parameters.AddWithValue("@JuiceID3", e.CommandArgument.ToString());

                    System.Decimal price = (System.Decimal)cmdSelectPrice.ExecuteScalar();

                    con.Close();

                    con.Open();
                    double totalPrice = (double)price * quantity;
                    //totalPrice = totalPrice * quantity;
                    string strUpdate1 = "UPDATE [CartGallery] SET TotalPrice= @TotalPrice WHERE JuiceID = @JuiceID5 AND UserID = @UserID5";
                    SqlCommand cmdUpdate1 = new SqlCommand(strUpdate1, con);

                    cmdUpdate1.Parameters.AddWithValue("@JuiceID5", e.CommandArgument.ToString());
                    cmdUpdate1.Parameters.AddWithValue("@UserID5", Session["UserID"]);
                    cmdUpdate1.Parameters.AddWithValue("@TotalPrice", (System.Decimal)totalPrice);
                    int numRowAffected1 = cmdUpdate1.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    string strSelect2 = "DELETE  from CheckOut Where UserID = @UserID6";
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);

                    cmdSelect2.Parameters.AddWithValue("@UserID6", Session["UserID"]);
                    int numRowAffected2 = cmdSelect2.ExecuteNonQuery();
                    con.Close();


                }
                Response.Redirect("Cart.aspx");

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
            CheckBox chk = sender as CheckBox;
            DataListItem item = chk.NamingContainer as DataListItem;
            HiddenField hdn = item.FindControl("HiddenField1") as HiddenField;

            CheckBox chkrow = (CheckBox)item.FindControl("chkEmpty");

            if (hdn != null)
            {
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);

                if (chkrow.Checked == true)
                {
                    //extract quantity
                    con.Open();
                    string strSelect = "SELECT Quantity from CartGallery Where JuiceID = @JuiceID1  AND UserID = @UserID1";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                    cmdSelect.Parameters.AddWithValue("@JuiceID1", hdn.Value.ToString());
                    cmdSelect.Parameters.AddWithValue("@UserID1", Session["UserID"]);
                    int quantity = (int)cmdSelect.ExecuteScalar();
                    con.Close();

                    if (quantity > 0)
                    {
                        //Extract totalprice
                        con.Open();
                        string strSelect1 = "SELECT TotalPrice from CartGallery Where JuiceID = @JuiceID2  AND UserID = @UserID2";
                        SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);

                        cmdSelect1.Parameters.AddWithValue("@JuiceID2", hdn.Value.ToString());
                        cmdSelect1.Parameters.AddWithValue("@UserID2", Session["UserID"]);
                        System.Decimal totalPrice = (System.Decimal)cmdSelect1.ExecuteScalar();
                        con.Close();

                        //add into checkout 
                        con.Open();
                        string strInsert = "Insert into CheckOut (UserID, JuiceID,TotalPrice, Quantity) Values (@UserID3, @JuiceID3,@TotalPrice3, @Quantity3)";
                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);

                        cmdInsert.Parameters.AddWithValue("@UserID3", Session["UserID"]);
                        cmdInsert.Parameters.AddWithValue("@JuiceID3", hdn.Value.ToString());
                        cmdInsert.Parameters.AddWithValue("@TotalPrice3", totalPrice);
                        cmdInsert.Parameters.AddWithValue("@Quantity3", quantity);

                        int numRowAffected = cmdInsert.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        //javascript
                        chkrow.Checked = false;
                    }

                }
                else
                {
                    //uncheck the checkbox
                    con.Open();
                    string strSelect = "DELETE from CheckOut Where JuiceID=@JuiceID and UserID = @UserID";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                    cmdSelect.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmdSelect.Parameters.AddWithValue("@JuiceID", hdn.Value.ToString());

                    int numRowAffected = cmdSelect.ExecuteNonQuery();
                    con.Close();
                }

                //check for any record inside the checkout 
                con.Open();
                string strSelect6 = "SELECT count(*) from CheckOut Where UserID = @UserID6";
                SqlCommand cmdSelect6 = new SqlCommand(strSelect6, con);

                cmdSelect6.Parameters.AddWithValue("@UserID6", Session["UserID"]);

                int numRowAffected6 = (int)cmdSelect6.ExecuteScalar();

                if (numRowAffected6 > 0)
                {
                    //output the total price

                    SqlConnection conn;
                    string strconn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    conn = new SqlConnection(strconn);

                    conn.Open();
                    string strSelect5 = "Select SUM(TotalPrice) From CheckOut Where UserID = @UserID5";
                    SqlCommand cmdSelect5 = new SqlCommand(strSelect5, conn);

                    cmdSelect5.Parameters.AddWithValue("@UserID5", Session["UserID"]);
                    System.Decimal totalPriceCheckOut = (System.Decimal)cmdSelect5.ExecuteScalar();
                    conn.Close();

                    //totalPrice1.Text = String.Format("{0:0.00}", totalPriceCheckOut).ToString();
                    totalPrice1.Text = totalPriceCheckOut.ToString(".00");
                }
                else
                {
                    totalPrice1.Text = "0.0";
                }
                con.Close();
            }
        }

        protected void check_Out_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();
            string strSelect1 = "Select Count(*) from CheckOut";
            SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);

            int totalRow = (int)cmdSelect1.ExecuteScalar();
            con.Close();
            if (totalRow > 0)
            {
                Response.Redirect("CheckOut.aspx");
            }
            else
            {
                //javescript 
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {

        }
    }
}