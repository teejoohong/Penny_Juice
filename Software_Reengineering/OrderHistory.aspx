<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="Software_Reengineering.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Profile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color : darkgray;
        }

        .width1{
            width: 16%;
            padding : 5%;
        }
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom:200px;
            margin-top:100px;
            background-color: lightgray;
        }

        .btnView{
            border-color: #4D94FF; background-color: white; color: #284E98;
        }

        .content{
            border : none;
            width :100%;
            background-color :lightgray;
        }

    </style>
      
    <% if (Session["UserID"] == null)
          { %>
         <div ID="loginView">
              <table id="loginForm" class="inputForm">
                <tr>
                    <th colspan="2"><h2>Order History</h2></th>
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
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="buttonLogin" OnClick="btnRegister_Click"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>

     <%}
         else{ %>
    <div style="width:75%; margin:0 auto; min-height:400px">
    <table class="table table-bordered" style="width: 100%; background-color: yellowgreen">
                <tr>
                    <th class="width1">
                        Order ID
                    </th>
                    <th class="width1">
                        Delivery Address
                    </th>
                    <th class="width1">
                        Date
                    </th>
                    
                    <th class="width1">
                        Price
                    </th>
                    <th class="width1">
                        Detail
                    </th>
                </tr>
            </table>
    <div style=" text-align:center">
        <asp:Label ID="Label3" runat="server" Text="" style="font-size:x-large;"></asp:Label>

    </div>
    <asp:DataList runat="server" DataKeyField="OrderID" DataSourceID="SqlDataSource1" Height="16px" Width="100%" OnItemCommand="Unnamed_ItemCommand">
        <ItemTemplate>     
            <br/>
            <table class="table table-bordered" style="width: 100%; background-color: lightgray">
                <tr>
                    <td class="width1">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("DeliveryAddress") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label4" runat="server" Text='<%# String.Format("RM {0:0.00}",Eval("TotalPrice")) %>'></asp:Label>
                    </td>

                    <td class="width1">
                        <asp:Button ID="btnDetails" CssClass="btnView" runat="server" Text="View Details" CommandName="ViewDetails" CommandArgument='<%# Eval("OrderID") %>'/>
                    </td>
                </tr>
            </table>    
        
        </ItemTemplate>

    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Order]">
    </asp:SqlDataSource>
        <br/>
     </div>
     <%} %>
</asp:Content>
