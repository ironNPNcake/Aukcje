﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SingleAuction.aspx.cs" Inherits="Aukcje.AuctoinPresenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/Styles.css" rel="stylesheet" type="text/css" />
    <link href="styles/SingleAuctionCSS.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <div class="SiteMapContainer">
        </div>

        <%-- <asp:LinqDataSource ID="LinqDataSource1" runat="server" Select="pokaz_to"></asp:LinqDataSource> --%>


        <asp:ListView ID="ListView1" runat="server" SelectMethod="Select" ItemType="Aukcje.Auction">

            <ItemTemplate>

                <div class="MainInformationContainer">
                    <div class="AuctionIDDIV" runat="server">
                        <asp:Label runat="server" ID="AuctionID" Text='<%# "#" + Eval("ID") %>'></asp:Label>
                    </div>
                    <div class="AuctionImage">
                        <asp:ImageButton ID="AuctionBigPicture" runat="server" AlternateText="AuctionImage"  ImageUrl='<%# "PicturesHandler.ashx?ID=" + Eval("ID") %>' BorderStyle="Solid" BorderColor="DarkGray" BorderWidth="2px" ImageAlign="Middle" />
                    </div>
                    <div class="DetailsContainer">
                        <ul>
                            <li>
                                <asp:Label runat="server" Text='<%#Eval("Title") %>' Font-Size="X-Large" Font-Bold="True"></asp:Label></li>
                            <li>
                                <br />
                            </li>
                            <li class="Price">
                                <asp:Label runat="server" Font-Size="X-Large" Font-Bold="True" ForeColor="#FF5050" Text='<%$Resources: Resource, Price %>' CssClass="PriceValue"></asp:Label>&nbsp;
                                <asp:Label runat="server" Font-Size="X-Large" Font-Bold="True" ForeColor="#FF5050" Text='<%# String.Format("{0:C}",Eval("Price")) %>' CssClass="PriceValue"></asp:Label>
                            </li>
                            <li>
                                <br />
                                <br />
                            </li>
                            <li>
                                <asp:Label runat="server" Text="<%$Resources: Resource, Seller %>"></asp:Label>
                                <asp:LinkButton runat="server" Font-Size="Medium" ForeColor="#660033" Text='<%#Eval("seller") %>' PostBackUrl= '<%# "~/SellerPage.aspx?UID=" + Eval("seller") %>' ></asp:LinkButton>
                            </li>
                        </ul>
                        <div style="float: left; top: 150px; position: absolute; left: 350px;">
                            <p>
                                <asp:TextBox runat="server" ID="textPlaceBid" Height="36px" Width="180px"  Font-Size="XX-Large"></asp:TextBox>
                            </p>
                            <asp:CompareValidator runat="server" ControlToValidate="textPlaceBid" ID="IntValidator" Type="Double" Operator="DataTypeCheck" ErrorMessage="Please insert properly value" ForeColor="red" ValidationGroup="valGr"></asp:CompareValidator>
                        </div>
                        <asp:Button runat="server" Width="200px" Height="50px" ValidationGroup="valGr" Text="Place Bid" />
                    </div>
                </div>

                <div class="DescriptionContainer">
                    <asp:Label runat="server" text='<%#Eval("Description") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:ListView>



    </div>
</asp:Content>
