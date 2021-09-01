<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="UploadItem.aspx.cs" Inherits="Software_Reengineering.UploadItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class ="auto-style8">

        <tr>
            <td class="auto-style5">Item Details</td>
            <td class="auto-style6">
                </td>
        </tr>   

        <tr>
            <td class="auto-style7">Item name : </td>
            <td class="auto-style3">
                <asp:TextBox ID="ArtName" runat="server" Width="267px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ControlToValidate="ArtName" ForeColor="Red" ValidationGroup="postArt"></asp:RequiredFieldValidator>
            </td>
        </tr>   

        <tr>
            <td class="auto-style7">
                Item Description :
            </td>
            <td class="auto-style3">
                <asp:TextBox runat="server" ID="ArtDescription" TextMode="Multiline" Columns="20" Name="S1" Rows="2" Height="95px" Width="591px" style="resize:none;"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ControlToValidate="ArtDescription" ForeColor="Red" ValidationGroup="postArt"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style7">
                Price :
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="Price" runat="server" Width="265px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This field id required." ControlToValidate="Price" SetFocusOnError="True" ForeColor="Red" ValidationGroup="postArt"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Your Correct Product Price" ControlToValidate="Price" ValidationExpression="^\d{0,8}(\.\d{1,2})?$" SetFocusOnError="True" ForeColor="Red" ValidationGroup="postArt"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Category :</td>
            <td>
                <asp:DropDownList ID="CategoryList" runat="server">
                    <asp:ListItem>Color Free</asp:ListItem>
                    
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="auto-style2">
                Total Item :
            </td>
            <td class="auto-style4">
               
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td class="auto-style7">Item Picture :</td>
            <td class="auto-style3">
                <asp:FileUpload ID="Picture" runat="server" accept="image/*" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*This field id required." ControlToValidate="Picture" SetFocusOnError="True" ForeColor="Red" ValidationGroup="postArt"></asp:RequiredFieldValidator>
                </td>
        </tr>

        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style7" style="text-align:center">
         <asp:Button ID="Cancel" class="button" runat="server" Text="Cancel" Width="140px" OnClick="Cancel_Click"  />
            </td>
            <td class="auto-style3">
        <asp:Button ID="Submit" class="button" runat="server" Text="Submit" OnClick="Submit_Click" Width="139px" ValidationGroup="postArt"/>
                
            </td>        
        </tr>       
        <tr>
            <td>
            <br/>
            </td>
            <td>
            <br/>
            </td>
        </tr>

        </table>
</asp:Content>
