<%@ Page Title="" Language="C#" MasterPageFile="~/Reengineering.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Software_Reengineering.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style type="text/css">
        
        
        .tableFormat {
            border-collapse: collapse;
            border: 2px solid black;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom:200px;
            margin-top:100px;
            background-color:lightgray;

        }
         </style>
    
     <% if ( Session["UserID"] == null)
          { %>
            

        <div style="height:400px">
            <table class="tableFormat">
                <tr>
                    <td class="auto-style">
                        <p style="text-align:center; font-size:x-large">Please log in to view your cart.</p>
                           </td>
                </tr>
                <tr>
                    <td class="auto-style">
                            &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                          
                            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" style="
                            background-color: white; text-align:center;" 
                            OnClick="btnSignIn_Click" Width="200px"/>
                
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
