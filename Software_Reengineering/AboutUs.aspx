<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Software_Reengineering.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <!--CSS -->
    <link href="CSS/AboutUs.css" rel="stylesheet" type="text/css" />
    <h1 style="text-align:center">About Us</h1> <br />
    <p class="imgLogo"> <asp:Image ID="Image1" runat="server" ImageUrl="~/BuildInPictures/pennyjuice-logo-462w.png" AlternateText="Smart Personal Scheduler" Height="60px" Width="300px" /></p>
    <div class="aboutUs">

        <article><br /><br /><br /><br />
 
            <p>Smart Personal Scheduler provide you an easy way for you to create
                a timetable!
            </p>
            <p>
                We aimed to assist users in changing from unhealty living lifestyle
                to a healtheir lifestyle and make users more discipline in term of 
                their daily activities to get rid of unhealthy living lifestyle!
            </p>
            <p> Try it out now! Tutorial is also available to guide
                you through out the timetable generation process!
            </p><br /><br /><br /><br /><br />
           
        </article>
    </div>

  <div class="row">
      <div class="column">
        <p>Contact Us <br />
                Phone: 563-386-1999<br />
                Fax: 563-386-6200
            </p>
      </div>
      <div class="column" >
        <h2>Emails</h2>
        <hr />
        <p>pennyjuice@hotmail.com</p>
        
      </div>
</div>

   

</asp:Content>
