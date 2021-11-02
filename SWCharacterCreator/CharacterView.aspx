<%@ Page Title="Character View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CharacterView.aspx.cs" Inherits="SWCharacterCreator.CharacterView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Character View</h1>

    <h4>Listed below are the characters you have created!</h4>

    <br />
    <asp:DropDownList ID="displayCharacterSelect" name="displayCharacterSelect" runat="server">
    </asp:DropDownList>

  <asp:Button OnClick="displayCharacter" ID="displayCharacterButton" runat="server" Text="Display">
    </asp:Button> 

</asp:Content>
