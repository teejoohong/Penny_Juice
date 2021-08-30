<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Software_Reengineering.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <% if ( Session["UserID"] == null)
          { %>
            <div style="height:20%">

            <table class="tableFormat">
                <tr>
                    <td >                      
                        <p > Please log in to view your cart.</p>
                         </td>
                </tr>

                <tr>
                    <td >
                            &nbsp;
                    </td>
                </tr>

                <tr>
                    <td style="text-align:center">                                                
                        <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click"  />
                    </td>
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
                        
                    </td>
                     <td class="title" style="font-weight: bold">
                        Quantity
                    </td>
                    <td class="title" style="font-weight: bold">
                        
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

                        </td>
                        
                        <td class="width1" style="text-align:center">
                           
                            <asp:Label ID="quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label><br />
                           
                        </td>
                        <td class="width1">
                              <asp:Button ID="Subtract" width="26px" runat="server" Text="-" CommandName="Subtract" CommandArgument='<%# Eval("JuiceID") %>'/>                    

                        </td>
                        <td class="width1">
                            <asp:Button ID="Button1" runat="server" CssClass="btnAll" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("JuiceID") %>'/>
                        </td>
                    </tr>
                </table>
                
            </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="totalPrice1" runat="server" Text="Label"></asp:Label>
     <%} %>
   
            </asp:Content>
