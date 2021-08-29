<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Software_Reengineering.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/HomePage.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Slideshow container -->
    <div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="BuildInPictures/fruits.jpg" style="width:100%">
        <div class="text">Different Flavours Available !!!</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="BuildInPictures/kid.jpg" style="width:100%">
        <div class="text">Kids are loving it !!!</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="BuildInPictures/receipe.jpg" style="width:100%">
        <div class="text">Natural Color !!!</div>
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>

        <table class="tableThreeContainer">
        <tr style="text-align:center">
            <td><h2>Order Now</h2><hr /></td>
            <td><h2>Bla Bla bla</h2><hr /></td>
 
        </tr>
        <tr>
            <td>
            <div class="whiteContainer">
                <a href="BMI.aspx">
                    <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/BuildInPictures/fruits.jpg"
                AlternateText="Calculator"  Width ="100%" Height="100%" />
                </a>
                <br />
                <asp:Button ID="btnBMI" CssClass="btnContainer" runat="server" Text="Order Now" />
            </div>
            </td>
            <td>
                <div class="whiteContainer">
                <a href="T">
                    <asp:Image ID="Image1" runat="server" 
                                        ImageUrl="~/BuildInPictures/kid.jpg" 
                                    AlternateText="Smart Personal Scheduler" Width ="100%" Height="100%" />
                </a>
                <br />
                <asp:Button ID="btnTimetable" CssClass="btnContainer" runat="server" Text="Bla Bla Bla" />
            
            </div>
            </td>
        </tr>
    </table>


<script>
    var slideIndex = 1;
    showSlides(slideIndex);

    // Next/previous controls
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    // Thumbnail image controls
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }


</script>

</asp:Content>
