﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertNewItem.aspx.cs" Inherits="Aukcje.InsertNewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">

        
        <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;" runat="server" ID="SellingNewItemForm">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td colspan="2">Sell your goodness</td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="labelAuctionName" runat="server">Your Auction name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="textAuctionName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="textAuctionName" ErrorMessage="Auctoin Name is required." ToolTip="Auction name is required." ValidationGroup="ctl02">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="CostLabel" runat="server" AssociatedControlID="textCost">Price:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="textCost" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CostdRequired" runat="server" ControlToValidate="textCost" ErrorMessage="Price for product is required." ToolTip="Price is required." ValidationGroup="ctl02">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="Intvalidator" runat="server" ControlToValidate="textCost" Type="Currency" Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ValidationGroup="ctl02" /> 
                                <%--<asp:RegularExpressionValidator runat="server" ErrorMessage="It must be a float value!!" ControlToValidate="textCost" ValidationExpression="([0-9]+(\.[0-9]{1,2}))|([0-9])"></asp:RegularExpressionValidator> --%>


                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="CategoryLabel" runat="server">Category:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="dropDownCategoryList">
                                    <asp:ListItem>Elektronika</asp:ListItem>
                                    <asp:ListItem>Moda</asp:ListItem>
                                    <asp:ListItem>Dom i Oggrod</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="ColorLabel" runat="server">Color:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="DropDownColorList">
                                    <asp:ListItem>Black</asp:ListItem>
                                    <asp:ListItem>Rose</asp:ListItem>
                                    <asp:ListItem>White</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server">Description:</asp:Label>

                            </td>
                            <td>
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="textDescription"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="color: Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label runat="server" Text="Image: "></asp:Label></td>
                            <td><asp:FileUpload runat="server" ID="FileUpload1"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Sell IT!" ValidationGroup="ctl02" OnClick="InsertButton_OnClick" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <asp:Label runat="server" ID="textAllWorks"></asp:Label>
    </div>
</asp:Content>
