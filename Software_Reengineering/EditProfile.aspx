<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Software_Reengineering.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="CSS/Profile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table class="profileTable">
        <tr>
            <th colspan="3"><h1>Edit Profile</h1></th>
        </tr>
        <tr>
            <td class="sideColumn leftCss" onclick="location.href='Profile.aspx';">
                <asp:HyperLink ID="linkProfile" runat="server" NavigateUrl="~/Profile.aspx">Profile</asp:HyperLink>
            </td>
            <td class="middleColumn" rowspan="3">

                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" CssClass="item">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" Width="200"  Height="250" CssClass="profilePic" runat="server" ImageUrl='<%# Eval("ProfilePicture") %>' />
                                    
                                    <br />
                                    <br />

                                </ItemTemplate>

                            </asp:DataList>

                <br /><asp:Label ID="lblUsername" runat="server" Text="" CssClass="lblUsername"></asp:Label><br />
            </td>
            <td class="sideColumn2">
                 <span class="lbl" style="font-weight : bold" >Email :</span><br />
                <asp:TextBox ID="txtEmail" runat="server"  CssClass="txtBox"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address" Font-Size="Small" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                 <br /><asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email can not be empty." Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="sideColumn leftCss" onclick="location.href='EditProfile.aspx';">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EditProfile.aspx">Edit Profile</asp:HyperLink>
            </td>
            <td class="sideColumn2">
                <span class="lbl" style="font-weight : bold">Address :</span><br />
                <asp:TextBox ID="txtAddress" CssClass="txtBox" runat="server"  ></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address cannot be empty." ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                 <br />
            </td>
            <td class="sideColumn">&nbsp;</td>
        </tr>
        <tr>
            <td class="sideColumn leftCss" onclick="location.href='EditProfilePicture.aspx';">
                 <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EditProfilePicture.aspx">Edit Profile Picture</asp:HyperLink>
            </td>
            <td class="sideColumn2">
                                <span class="lbl" style="font-weight : bold">Contact Number :</span><br />
                <asp:TextBox ID="txtContactNumber" CssClass="txtBox" runat="server" ></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Weight cannot be empty." ControlToValidate="txtContactNumber" ForeColor="Red" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Required proper phone format." ControlToValidate="txtContactNumber" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"  Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
            <td class="sideColumn">

            </td>
        </tr>

        <tr>
            <td class="sideColumn">
                
            </td>
            <td class="middleColumn" >
                <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Save" OnClick="btnSave_Click"/>
            </td>
            <td class="sideColumn">&nbsp;</td>
        </tr>
    </table>

                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
                         <SelectParameters>
                             <asp:SessionParameter Name="UserID" SessionField="UserID" />     
                        </SelectParameters>
                </asp:SqlDataSource>
</asp:Content>
