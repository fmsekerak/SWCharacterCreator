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

    <br />
    <br />
    <h1>Character Deletion</h1>

    <h4>Listed below are the characters you have created, select the one you wish to delete.</h4>
        <br />
    <asp:DropDownList ID="DeleteCharacterSelect" name="deleteCharacterSelect" runat="server">
    </asp:DropDownList>

    <asp:Button OnClick="deleteCharacter" ID="deleteCharacterButton" runat="server" Text="Delete">
    </asp:Button>

    <br />
    <br />
    <h1>Edit Character</h1>

    <h4>Listed below are the characters you have created, select the one you wish to edit.</h4>
    <h4>Then select which attribute you wish to edit.</h4> 
    <br />
    <asp:DropDownList ID="EditCharSelectList" name="EditCharSelect" runat="server">
    </asp:DropDownList>

    <br /> <br />
    <asp:DropDownList ID="EditAttributeList" name="EditAttrSelect" runat="server" OnSelectedIndexChanged="editIndexChanged" AutoPostBack="true">
        <asp:ListItem Value="1" Text="Name"></asp:ListItem>
        <asp:ListItem Value="2" Text="Species"></asp:ListItem>
        <asp:ListItem Value="3" Text="Class"></asp:ListItem>
        <asp:ListItem Value="4" Text="Level"></asp:ListItem>
        <asp:ListItem Value="5" Text="Alignment"></asp:ListItem>
        <asp:ListItem Value="6" Text="Strength"></asp:ListItem>
        <asp:ListItem Value="7" Text="Dexterity"></asp:ListItem>
        <asp:ListItem Value="8" Text="Constitution"></asp:ListItem>
        <asp:ListItem Value="9" Text="Intelligence"></asp:ListItem>
        <asp:ListItem Value="10" Text="Wisdom"></asp:ListItem>
        <asp:ListItem Value="11" Text="Charisma"></asp:ListItem>
    </asp:DropDownList>

    <br /> <br />
    <asp:Button OnClick="EditCharacter" ID="EditCharacterButton" runat="server" Text="Edit">
    </asp:Button>

     <asp:DropDownList ID="editAttribute" runat="server" Visible="false">
        <asp:ListItem Value="1" Text="8"></asp:ListItem>
        <asp:ListItem Value="2" Text="10"></asp:ListItem>
        <asp:ListItem Value="3" Text="12"></asp:ListItem>
        <asp:ListItem Value="4" Text="14"></asp:ListItem>
        <asp:ListItem Value="5" Text="16"></asp:ListItem>
        <asp:ListItem Value="6" Text="18"></asp:ListItem>
        <asp:ListItem Value="7" Text="20"></asp:ListItem>
    </asp:DropDownList>

    <br />
    <br />
    <asp:Button OnClick="SubmitEditCharacter" ID="SubmitEditButton" runat="server" Text="Submit Changes">
    </asp:Button>


</asp:Content>
