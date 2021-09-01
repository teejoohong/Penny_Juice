﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Software_Reengineering.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style type="text/css">
        
.buttonLogin {
background-color: yellowgreen;
color: black;
width: 26%;
height: 30px;
font-size: 12px;
border: 2px solid forestgreen;
}

.buttonLogin:hover {
cursor: pointer;
background-color: forestgreen;
}

.inputForm th {
    border-bottom: 1px solid black;
    background-color: yellowgreen;
    color: black;
    font-size: 18px;
}

.inputForm {
    margin: 50px auto 100px auto;
    width: 50%;
    border: 2px solid forestgreen;
    background-color:lightgray;
}

        .title{
            width:14%;
            background-color:darkgrey;
           padding: 2%;
        }

        .auto-style {
            padding-top:20px;
            height: 25px;
            
        }

        .width1 {
            width: 14%;
            padding: 2%;
            background-color : lightgray;
        }

        .btnAll{
            border-color: black; background-color: yellowgreen; 
        }

        .totalprice{
            font-size: 20px;
        }
         </style>
    
     <% if ( Session["UserID"] == null)
          { %>
            

        <div >
             <table id="loginForm" class="inputForm">
                <tr>
                    <th colspan="2"><h2>Cart</h2></th>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="text-align:center">
                    <td colspan="2">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="buttonLogin" OnClick="btnLogin_Click"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="text-align:center">
                    <td colspan="2">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="buttonLogin" OnClick="btnRegister_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
            </div>
        <%}
          else{ %>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.Item_Name, CartGallery.Quantity, CartGallery.TotalPrice, Gallery.Image, CartGallery.UserID, Gallery.JuiceID FROM CartGallery INNER JOIN Gallery ON CartGallery.JuiceID = Gallery.JuiceID WHERE (CartGallery.UserID = @UserID)">
          <SelectParameters>
              <asp:SessionParameter Name="UserID" SessionField="UserID" />
          </SelectParameters>
        </asp:SqlDataSource>
     <table class="table table-bordered" style="width: 100%; background-color: darkgray">
                <tr>
                   
                     <td class="title" style="font-weight: bold">
                        &nbsp &nbsp &nbsp
                    </td>
                    <td class="title" style="font-weight: bold">
                        Image
                    </td>

                    <td class="title" style="font-weight: bold">
                        Name
                    </td>
                    <td class="title" style="font-weight: bold">
                        Price
                    </td>
                   
                     <td class="title" style="font-weight: bold">
                        Quantity
                    </td>
                    
                    <td class="title" style="font-weight: bold">
                        Delete
                    </td>
                 </tr>
               </table>
    <div style="font-size:x-large; margin-top : 1% ; font-weight:bold">
                Number of items in cart :
                <asp:Label ID="Label3" runat="server" Text="" ></asp:Label>
            </div>

      <asp:DataList ID="DataList1" runat="server"  DataSourceID="SqlDataSource1"  OnItemCommand="DataList1_ItemCommand" Height="16px" Width="100%" >
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("JuiceID") %>' />
                <br/>
                <table class="table table-bordered" style="width: 100%; background-color: lightgray">
                    <tr>
                        <td class="width1">
                            <br />
                            <asp:CheckBox ID="chkEmpty" runat="server" AutoPostBack="true" OnCheckedChanged="Chk_Empty_CheckedChanged" />
                        </td>
                        <td class="width1">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px"/> 
                        </td>
                        <td class="width1">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Item_Name") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            <asp:Label ID="Label3" runat="server" Text='<%# String.Format("{0:0.00}",Eval("TotalPrice"))%>'></asp:Label>                          

                        </td>
                        <td class="width1">
                             <asp:Button ID="Add" runat="server" Text="+" CommandName="Adding" CommandArgument='<%# Eval("JuiceID") %>' /><br />                        

                        
                           
                            <asp:Label ID="quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label><br />
                           
                        
                              <asp:Button ID="Subtract" width="26px" runat="server" Text="-" CommandName="Subtract" CommandArgument='<%# Eval("JuiceID") %>'/>                    

                        </td>
                        <td class="width1">
                            <asp:Button ID="Button1" runat="server" CssClass="btnAll" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("JuiceID") %>'/>
                        </td>
                    </tr>
                </table>
                
            </ItemTemplate>
            </asp:DataList>
             <table>
                <tr style="font-size:20px;text-align:right">
                    <td style="width:1000px;" >Total: RM </td>
                    <td style="width:14.28%;"><asp:Label ID="totalPrice1" runat="server" Text="" CssClass="totalprice"></asp:Label></td>
                </tr>
            </table>
           
            <br />
            <br/>

            <div style="text-align : right  ; margin-bottom : 3%">
                <asp:Button ID="check_Out" runat="server" CssClass="btnAll" Height="80px" Width="160px" Text="Check Out" OnClick="check_Out_Click" />
            </div>
     <%} %>
   
            </asp:Content>
