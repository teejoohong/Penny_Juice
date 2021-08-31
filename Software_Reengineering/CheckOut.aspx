<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Software_Reengineering.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    .width1 {
            width: 120px;
        }
        </style>
    <div style="margin:0% 10% 0% 10%;">
        <h2 style="text-align: center">
            Checkout Payment Page
        </h2>

        <div style="text-align: center">
            Please ensure that all of the details are correct before click the confirm checkout.
        </div>
        <br />
        <br />
        <h4>
            <u>Delivery Address</u>
        </h4>
        <br />
        <div>          
            <hr />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <hr />
        </div>
        <br />
        <div>
            Address not correct? Click <asp:LinkButton ID="EditAddress" runat="server" OnClick="EditAddress_Click">Edit</asp:LinkButton> to modify your address.
            <hr />
        </div>
        <br />
    </div>
        <div style="width:75%; margin:0% 10% 0% 10%; min-height:400px">
            <table class="table table-bordered" style="width: 100%; background-color: darkgray">
                        <tr>
                            <td class="width1" style="font-weight: bold">
                                Juice ID
                            </td>

                            <td class="width1" style="font-weight: bold">
                                Name
                            </td>

                            <td class="width1" style="font-weight: bold">
                                Image
                            </td>
                            <td class="width1" style="font-weight: bold">
                                Quantity
                            </td>
                            <td class="width1" style="font-weight: bold">
                                Price
                            </td>
                         </tr>
                  </table>
            
    
    <asp:DataList ID="DataList1" runat="server"  DataSourceID="SqlDataSource1" Width="100%">
        <ItemTemplate>
            <table class="table table-bordered" style="width: 100%; background-color: lightgray">
                <tr>
                    <td class="width1">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("JuiceID") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Item_Name") %>'></asp:Label>
                    </td>

                    <td class="width1">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px"/>
                    </td>

                    <td class="width1">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </td>

                    <td class="width1">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>
                    </td>
                </tr>
            </table>

        </ItemTemplate>
    </asp:DataList>
            </div>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CheckOut.JuiceID, CheckOut.Quantity, CheckOut.TotalPrice, Gallery.Image, CheckOut.UserID, Gallery.Item_Name FROM CheckOut INNER JOIN Gallery ON CheckOut.JuiceID = Gallery.JuiceID WHERE (CheckOut.UserID = @UserID)">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div>
     <p>Select Payment method</p>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem>Master/Visa Card</asp:ListItem>
        <asp:ListItem>Online Banking</asp:ListItem>
    </asp:RadioButtonList>

    <div runat="server" id="CreditDetail" Visible="False" >
        <p> Card No : </p><asp:TextBox ID="TextBox1" runat="server" placeholder="1111-2222-3333-4444"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid card no." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox1" ValidationExpression="\d{4}(\-\d{4}(\-\d{4}(\-\d{4})))"></asp:RegularExpressionValidator>
       
        <p> CVV : </p> <asp:TextBox ID="TextBox2" runat="server" placeholder="123"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox2"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter a cvv no." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox2" ValidationExpression="^\d{3}"></asp:RegularExpressionValidator>
        
        <p> Expired Date : </p> <asp:TextBox ID="TextBox3" runat="server" placeholder="12/25"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox3"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid expired date." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox3" ValidationExpression="^\d{0,2}(\/\d{1,2})?$" ></asp:RegularExpressionValidator>
        <br />
     </div>

    <asp:Button ID="btnConfirm" style="border-color: #4D94FF; background-color: white; color: #284E98;" runat="server" Text="Confirm Purchase" OnClick="btnConfirm_Click"/>
    </div>
    <br />

    
</asp:Content>
