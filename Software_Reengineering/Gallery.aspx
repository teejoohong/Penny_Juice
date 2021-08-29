<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Software_Reengineering.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"  CellPadding="20" RepeatColumns="5" RepeatDirection="Horizontal"  OnItemCommand="DataList1_ItemCommand"  AllowPaging="true" PageSize ="2" >
        <ItemTemplate>
        <asp:Image ID="Image1" CssClass="Img" runat="server" ImageUrl='<%# Eval("Image") %>' />
             <div class="frame" >
                    <a style="margin-left: 10px">Name:</a><asp:Label ID="Label3" runat="server" Text='<%# Eval("Item_Name") %>' ></asp:Label>
                    <br />
                    <a style="margin-left: 10px">Description:</a><asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    <br/>
                    <a style="margin-left: 10px">Price: RM</a><asp:Label ID="Label2" runat="server"  Text='<%# String.Format("{0:0.00}",Eval("Price")) %>'></asp:Label>
                    <br />
                    <a style="margin-left: 10px">Quantity: </a><asp:Label ID="Label4" runat="server"  Text='<%#Eval("Total") %>'></asp:Label>
                    <br/><br />                
                    <asp:Button CssClass="Button" ID="Button1" runat="server" Text='Add to cart' CommandName="AddToCart" CommandArgument='<%# Eval("JuiceID") %>'/>&nbsp<br /> <br />
                    
                    <br />
                    </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT JuiceID, Item_Name, Description, Price, Total, Image FROM Gallery WHERE (Total &gt; 0)"></asp:SqlDataSource>
</asp:Content>
