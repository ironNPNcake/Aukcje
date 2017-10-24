<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftSideMenu.ascx.cs" Inherits="Aukcje.LeftSideMenu" %>



<div class="Categories-Section SideBar">
    <ul>
        <li>
            <asp:LinkButton runat="server" PostBackUrl="~/AuctionsList.aspx?category=0"><asp:Literal runat="server" ID="literal1" Text="<%$Resources:Resource, Electronics %>" ></asp:Literal></asp:LinkButton></li>
        <li>
            <asp:LinkButton runat="server" PostBackUrl="~/AuctionsList.aspx?category=1"><asp:Literal runat="server" Text='<%$Resources: Resource, Clothes %>'></asp:Literal></asp:LinkButton></li>
        <li>
            <asp:LinkButton runat="server" PostBackUrl="~/AuctionsList.aspx?category=2"><asp:Literal runat="server" Text="<%$Resources: Resource, HomeAndGarden %>" ></asp:Literal></asp:LinkButton></li>
    </ul>
</div>
