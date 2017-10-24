<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuctionsList.aspx.cs" Inherits="Aukcje.AuctionsList" %>

<%@ Register TagPrefix="uc" TagName="Categories" Src="~/Controls/LeftSideMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/Styles.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">

        <div class="SideBar">

            <uc:Categories runat="server" />

            <div runat="server" style="float: left" class="SideBar">
                <div style="display: inline-block;">
                    <h4>Price</h4>
                    <asp:TextBox runat="server" ID="textLowPrice" Width="40px"></asp:TextBox>- 
                    <asp:TextBox runat="server" ID="textHighPrice" Width="40px"></asp:TextBox>
                </div>
                <div>
                    <h4>Color: </h4>
                    <asp:CheckBoxList runat="server" ID="checkBoxFilteringSet">
                        <asp:ListItem>Black</asp:ListItem>
                        <asp:ListItem>Rose</asp:ListItem>
                        <asp:ListItem>White</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <asp:Button runat="server" ID="FilteringButton" Text="Filter" />
            </div>
        </div>
        

        <div class="TreeViewer">
            <asp:TreeView runat="server" DataSourceID="SiteMapDataSource1">
                <Nodes>
                    <asp:TreeNode Text="Categories" Value="Categories">
                        <asp:TreeNode Text="Electronics" Value="Electronics"></asp:TreeNode>
                        <asp:TreeNode Text="Clothes" Value="Clothes"></asp:TreeNode>
                        <asp:TreeNode Text="Home &amp; Garden" Value="Home &amp; Garden"></asp:TreeNode>
                    </asp:TreeNode>
                </Nodes>
            </asp:TreeView>
            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        </div>
        

        <div class="displayingAuctions">
            <asp:ListView ID="ListView1" runat="server" SelectMethod="Select" ItemType="Aukcje.Auction">
                <LayoutTemplate>
                    <table runat="server" id="table1">
                        <tr>
                            <th colspan="2">Auction Name</th>
                            <th>Actual Price</th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>

                    <tr runat="server">

                        <td>
                            <asp:ImageButton runat="server" ID="AuctionPicture" ImageUrl='<%# "PicturesHandler.ashx?ID=" + Eval("ID") %>' CssClass="AuctionImage" Height="50px" Width="50px" OnCommand="Auction_OnClick" CommandName="id" CommandArgument='<%#Eval("ID") %>' />
                        </td>
                        <td runat="server">
                            <%-- Data-bound content. --%>
                            <asp:LinkButton runat="server" ID="SingleAuctionRow" OnCommand="Auction_OnClick" CommandName="id" CommandArgument='<%#Eval("ID") %>'>
                                <asp:Label ID="NameLabel" runat="server" Text='<%#Eval("Title") %>' />
                            </asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# String.Format("{0:C}",Eval("Price")) %>' />
                        </td>
                    </tr>

                </ItemTemplate>
            </asp:ListView>
            <%--    <asp:GridView runat="server" ID="gridek" SelectMethod="Select" ItemType="Aukcje.Models.Auctions">
         
    </asp:GridView>--%>
            <hr />
            <hr />
            <hr />
            <hr />
            <hr />
            <asp:Label runat="server" ID="labelka">Testowalabelka do zwracania wszystkiego</asp:Label>
        </div>
    </div>
</asp:Content>
