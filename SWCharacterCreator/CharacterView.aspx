<%@ Page Title="Character View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CharacterView.aspx.cs" Inherits="SWCharacterCreator.CharacterView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Character View</h1>

    <h4>Listed below are the characters you have created!</h4>

    <br />
    <asp:DropDownList ID="displayCharacterSelect" name="displayCharacterSelect" runat="server">
    </asp:DropDownList>

  <asp:Button OnClick="displayCharacter" ID="displayCharacterButton" runat="server" Text="Display">
    </asp:Button> 

    <br /> <br />

   <asp:Table ID="DisplayCharacterTable" runat="server" BorderColor="SandyBrown" BorderWidth="2" Height="30" Width="1000">
       <asp:TableRow ID="Row1" runat="server" BorderColor="SandyBrown">
           <asp:TableCell ID="R1C1" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Name
           </asp:TableCell>
           <asp:TableCell ID="R1C2" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Species
           </asp:TableCell>
           <asp:TableCell ID="R1C3" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Class
           </asp:TableCell>
           <asp:TableCell ID="R1C4" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Level
           </asp:TableCell>
           <asp:TableCell ID="R1C5" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Alignment
           </asp:TableCell>
           <asp:TableCell ID="R1C6" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Strength
           </asp:TableCell>
           <asp:TableCell ID="R1C7" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Dexterity
           </asp:TableCell>
           <asp:TableCell ID="R1C8" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Constitution
           </asp:TableCell>
           <asp:TableCell ID="R1C9" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Intelligence
           </asp:TableCell>
           <asp:TableCell ID="R1C10" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Wisdom
           </asp:TableCell>
           <asp:TableCell ID="R1C11" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Charisma
           </asp:TableCell>
       </asp:TableRow>
       <asp:TableRow ID="DisplayRow" runat="server" BorderColor="SandyBrown">
           <asp:TableCell ID="DisplayName" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplaySpecies" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayClass" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayLevel" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayAlignment" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayStr" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayDex" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayCon" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayInt" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayWis" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayChar" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
       </asp:TableRow>
   </asp:Table>

</asp:Content>
