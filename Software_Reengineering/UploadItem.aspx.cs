using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Software_Reengineering
{
    public partial class UploadItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            con.Open();
            string strSelect = "Select count(JuiceID) from Gallery";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            int total = (int)cmdSelect.ExecuteScalar();
            con.Close();

            int newIndex = total + 1;

            string JuiceID = "J" + newIndex.ToString();

            con.Open();
            string strSelect1 = "Select JuiceID from Gallery";
            SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);
            SqlDataReader dtr = cmdSelect1.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {

                    if (JuiceID.Equals(dtr["JuiceID"]))
                    {
                        newIndex += 1;
                        JuiceID = "J" + newIndex.ToString();

                    }
                }
            }
            con.Close();

            int length = Picture.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            Picture.PostedFile.InputStream.Read(pic, 0, length);

            con.Open();

            string strInsert = "Insert into [Gallery] (JuiceID, Item_Name, Description, Price, Total, Image) Values (@JuiceID, @Item_Name, @Description, @Price, @Total, @Image)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            string fileName = Path.GetFileName(Picture.PostedFile.FileName);
            string filePath = "BuildInPictures/" + fileName;
            Picture.PostedFile.SaveAs(Server.MapPath(filePath));

            try
            {
                cmdInsert.Parameters.AddWithValue("@JuiceID", JuiceID);            
                cmdInsert.Parameters.AddWithValue("@Item_Name", ArtName.Text);
                cmdInsert.Parameters.AddWithValue("@Description", ArtDescription.Text);
                cmdInsert.Parameters.AddWithValue("@Price", Price.Text);
                cmdInsert.Parameters.AddWithValue("@Total", TextBox1.Text); 
                cmdInsert.Parameters.AddWithValue("@Image", filePath);
               
                int n = cmdInsert.ExecuteNonQuery();

                if (n > 0)
                {
                    ArtName.Text = "";
                    ArtDescription.Text = "";
                    Price.Text = "";
                    // return insert success
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added! " + "');", true);

                }
                else
                {
                    // return insert failed
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added failed! " + "');", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Something went wrong.");
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added failed! " + "');", true);
            }


            con.Close();
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {

        }
    }
}