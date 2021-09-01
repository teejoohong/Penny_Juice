<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Software_Reengineering.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color : lightgray;
        }
        .width1 {
            width: 15.8%;
            padding : 2%;
            
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

        .auto-style2 {
            width: 16%;
            height: 38px;
            background-color : darkgray;
            padding:5%;
        }
        .btnDelete{
            border-color: #4D94FF; background-color: white; color: #284E98;
        }
    </style>
     <h1 style="text-align:center">Wishlist</h1><hr />
     <% if (Session["UserID"] == "0" || Session["UserID"] == null)
          { %>
        <div >
            <table class="inputForm">
                <tr>
                    <td class="auto-style">
                        <p style="text-align:center; font-size:x-large">Please log in to view your wishlist.</p>
                           </td>
                </tr>
                <tr>
                    <td class="auto-style">
                            &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                          
                            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click" CssClass="buttonLogin" />
                
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">
                           &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                           &nbsp;</td>
                </tr>
               
            </table>
            </div>

     <%}
          else{ %>
    <div style="width:75%; margin:0 auto; min-height:400px">
    <table class="table table-bordered" style="width: 100%; background-color: darkgray">
                <tr>
                    <th class="auto-style2">
                        Draw ID
                    </th>

                    <th class="auto-style2">
                        Name
                    </th>

                    <th class="auto-style2">
                        Image
                    </th>
                    <th class="auto-style2">
                        Description
                    </th>
                    <th class="auto-style2">
                        Price
                    </th>
                    <th class="auto-style2">
                        Delete
                    </th>
                </tr>
            </table>
    <div style=" text-align:center">
        <asp:Label ID="Label3" runat="server" Text="" style="font-size:x-large;"></asp:Label>
    </div>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" Height="16px" Width="100%">
            <ItemTemplate>
                <br />
                <table class="table table-bordered" style="width: 100%; background-color: lightgray">
                    <tr>
                        <td class="width1">
                            
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("JuiceID") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Item_Name") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px" />
                        </td>
                        <td class="width1">
                            
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            
                            <asp:Label ID="Label4" runat="server" Text='<%# String.Format("RM {0:0.00}",Eval("Price")) %>'></asp:Label>
                        </td>
                        <td class="width1">
                            <asp:Button ID="Button1" runat="server" CssClass="btnDelete" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("JuiceID") %>'/>
                        </td>
                    </tr>
                </table>

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.Item_Name, Gallery.Price, Gallery.Description, Wishlist.UserID, Wishlist.JuiceID, Gallery.Image FROM Wishlist INNER JOIN Gallery ON Wishlist.JuiceID = Gallery.JuiceID WHERE (Wishlist.UserID = @UserID)">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
    </div>
    <%} %>
</asp:Content>
