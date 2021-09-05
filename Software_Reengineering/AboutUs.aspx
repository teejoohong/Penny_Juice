<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Software_Reengineering.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <!--CSS -->
    <link href="CSS/AboutUs.css" rel="stylesheet" type="text/css" />
    <p class="imgLogo"> <asp:Image ID="Image1" runat="server" ImageUrl="~/BuildInPictures/pennyjuice-logo-462w.png" AlternateText="Smart Personal Scheduler" Height="60px" Width="300px" /></p>
    <div class="aboutUs">

        <article><br /><br /><br /><br />
 
            <p>Penny Juice, best juice provider in the US !!!
            </p>
            <p>
                15 flavors available including 7 color free flavors. 
                Each case contains 6 - ½ gallon bottles of your choice. We’ve designed them especially for childcare, 
                daycare, preschool, basp and extended daycare. Get in touch with us today!
            </p>
            <p> We provide a variety of flavors that all kids can enjoy! All the juice concentrates that we sell are compliant with the USDA and FDA guidelines. You don't need to refrigerate the concentrates before or after opening them.
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
