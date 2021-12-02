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
           <asp:TableCell ID="multi" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Multiclass
           </asp:TableCell>
           <asp:TableCell ID="multilvl" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               Multi Level
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
           <asp:TableCell ID="DisplayMultiClass" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
               -
           </asp:TableCell>
           <asp:TableCell ID="DisplayMultiLevel" BorderColor="SandyBrown" BorderWidth="2" runat="server" HorizontalAlign="Center">
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
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="Name"></asp:ListItem>
        <asp:ListItem Value="2" Text="Species"></asp:ListItem>
        <asp:ListItem Value="3" Text="Base Class"></asp:ListItem>
        <asp:ListItem Value="4" Text="Base Class Level"></asp:ListItem>
        <asp:ListItem Value="5" Text="Multiclass"></asp:ListItem>
        <asp:ListItem Value="6" Text="Multiclass Level"></asp:ListItem>
        <asp:ListItem Value="7" Text="Alignment"></asp:ListItem>
        <asp:ListItem Value="8" Text="Background"></asp:ListItem>
        <asp:ListItem Value="9" Text="Strength"></asp:ListItem>
        <asp:ListItem Value="10" Text="Dexterity"></asp:ListItem>
        <asp:ListItem Value="11" Text="Constitution"></asp:ListItem>
        <asp:ListItem Value="12" Text="Intelligence"></asp:ListItem>
        <asp:ListItem Value="13" Text="Wisdom"></asp:ListItem>
        <asp:ListItem Value="14" Text="Charisma"></asp:ListItem>
    </asp:DropDownList>

    <br /> <br />
    <asp:Button OnClick="EditCharacter" ID="EditCharacterButton" runat="server" Text="Edit">
    </asp:Button>

    <asp:TextBox id="editName" runat="server" Visible="false"/>

    <asp:DropDownList ID="editSpecies" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="Bith"></asp:ListItem>
        <asp:ListItem Value="2" Text="Bothan"></asp:ListItem>
        <asp:ListItem Value="3" Text="Cathar"></asp:ListItem>
        <asp:ListItem Value="4" Text="Cerean"></asp:ListItem>
        <asp:ListItem Value="5" Text="Chiss"></asp:ListItem>
        <asp:ListItem Value="6" Text="Devaronian"></asp:ListItem>
        <asp:ListItem Value="7" Text="Droid, Class I"></asp:ListItem>
        <asp:ListItem Value="8" Text="Droid, Class II"></asp:ListItem>
        <asp:ListItem Value="9" Text="Droid, Class III"></asp:ListItem>
        <asp:ListItem Value="10" Text="Droid, Class IV"></asp:ListItem>
        <asp:ListItem Value="11" Text="Droid, Class V"></asp:ListItem>
        <asp:ListItem Value="12" Text="Duros"></asp:ListItem>
        <asp:ListItem Value="13" Text="Ewok"></asp:ListItem>
        <asp:ListItem Value="14" Text="Gamorrean"></asp:ListItem>
        <asp:ListItem Value="15" Text="Gungan"></asp:ListItem>
        <asp:ListItem Value="16" Text="Human"></asp:ListItem>
        <asp:ListItem Value="17" Text="Ithorian"></asp:ListItem>
        <asp:ListItem Value="18" Text="Jawa"></asp:ListItem>
        <asp:ListItem Value="19" Text="Kel Dor"></asp:ListItem>
        <asp:ListItem Value="20" Text="Mon Calamari"></asp:ListItem>
        <asp:ListItem Value="21" Text="Nautolan"></asp:ListItem>
        <asp:ListItem Value="22" Text="Rodian"></asp:ListItem>
        <asp:ListItem Value="23" Text="Sith Pureblood"></asp:ListItem>
        <asp:ListItem Value="24" Text="Togruta"></asp:ListItem>
        <asp:ListItem Value="25" Text="Trandoshan"></asp:ListItem>
        <asp:ListItem Value="26" Text="Tusken"></asp:ListItem>
        <asp:ListItem Value="27" Text="Twilek"></asp:ListItem>
        <asp:ListItem Value="28" Text="Weequay"></asp:ListItem>
        <asp:ListItem Value="29" Text="Wookiee"></asp:ListItem>
        <asp:ListItem Value="30" Text="Zabrak"></asp:ListItem>
    </asp:DropDownList>


    <asp:DropDownList ID="editClass" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="Berserker"></asp:ListItem>
        <asp:ListItem Value="2" Text="Consular"></asp:ListItem>
        <asp:ListItem Value="3" Text="Engineer"></asp:ListItem>
        <asp:ListItem Value="4" Text="Fighter"></asp:ListItem>
        <asp:ListItem Value="5" Text="Guardian"></asp:ListItem>
        <asp:ListItem Value="6" Text="Monk"></asp:ListItem>
        <asp:ListItem Value="7" Text="Operative"></asp:ListItem>
        <asp:ListItem Value="8" Text="Scholar"></asp:ListItem>
        <asp:ListItem Value="9" Text="Scout"></asp:ListItem>
        <asp:ListItem Value="10" Text="Sentinel"></asp:ListItem>
    </asp:DropDownList>


    <asp:DropDownList ID="editMulticlass" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="Berserker"></asp:ListItem>
        <asp:ListItem Value="2" Text="Consular"></asp:ListItem>
        <asp:ListItem Value="3" Text="Engineer"></asp:ListItem>
        <asp:ListItem Value="4" Text="Fighter"></asp:ListItem>
        <asp:ListItem Value="5" Text="Guardian"></asp:ListItem>
        <asp:ListItem Value="6" Text="Monk"></asp:ListItem>
        <asp:ListItem Value="7" Text="Operative"></asp:ListItem>
        <asp:ListItem Value="8" Text="Scholar"></asp:ListItem>
        <asp:ListItem Value="9" Text="Scout"></asp:ListItem>
        <asp:ListItem Value="10" Text="Sentinel"></asp:ListItem>
    </asp:DropDownList>


    <asp:DropDownList ID="editBaseClassLevel" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="1"></asp:ListItem>
        <asp:ListItem Value="2" Text="2"></asp:ListItem>
        <asp:ListItem Value="3" Text="3"></asp:ListItem>
        <asp:ListItem Value="4" Text="4"></asp:ListItem>
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="6" Text="6"></asp:ListItem>
        <asp:ListItem Value="7" Text="7"></asp:ListItem>
        <asp:ListItem Value="8" Text="8"></asp:ListItem>
        <asp:ListItem Value="9" Text="9"></asp:ListItem>
        <asp:ListItem Value="10" Text="10"></asp:ListItem>
        <asp:ListItem Value="11" Text="11"></asp:ListItem>
        <asp:ListItem Value="12" Text="12"></asp:ListItem>
        <asp:ListItem Value="13" Text="13"></asp:ListItem>
        <asp:ListItem Value="14" Text="14"></asp:ListItem>
        <asp:ListItem Value="15" Text="15"></asp:ListItem>
        <asp:ListItem Value="16" Text="16"></asp:ListItem>
        <asp:ListItem Value="17" Text="17"></asp:ListItem>
        <asp:ListItem Value="18" Text="18"></asp:ListItem>
        <asp:ListItem Value="19" Text="19"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
    </asp:DropDownList>


    <asp:DropDownList ID="editMulticlassLevel" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="1"></asp:ListItem>
        <asp:ListItem Value="2" Text="2"></asp:ListItem>
        <asp:ListItem Value="3" Text="3"></asp:ListItem>
        <asp:ListItem Value="4" Text="4"></asp:ListItem>
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="6" Text="6"></asp:ListItem>
        <asp:ListItem Value="7" Text="7"></asp:ListItem>
        <asp:ListItem Value="8" Text="8"></asp:ListItem>
        <asp:ListItem Value="9" Text="9"></asp:ListItem>
        <asp:ListItem Value="10" Text="10"></asp:ListItem>
        <asp:ListItem Value="11" Text="11"></asp:ListItem>
        <asp:ListItem Value="12" Text="12"></asp:ListItem>
        <asp:ListItem Value="13" Text="13"></asp:ListItem>
        <asp:ListItem Value="14" Text="14"></asp:ListItem>
        <asp:ListItem Value="15" Text="15"></asp:ListItem>
        <asp:ListItem Value="16" Text="16"></asp:ListItem>
        <asp:ListItem Value="17" Text="17"></asp:ListItem>
        <asp:ListItem Value="18" Text="18"></asp:ListItem>
        <asp:ListItem Value="19" Text="19"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
    </asp:DropDownList>


    <asp:DropDownList ID="editAlignment" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="Lawful Light"></asp:ListItem>
        <asp:ListItem Value="2" Text="Lawful Balanced"></asp:ListItem>
        <asp:ListItem Value="3" Text="Lawful Dark"></asp:ListItem>
        <asp:ListItem Value="4" Text="Neutral Light"></asp:ListItem>
        <asp:ListItem Value="5" Text="Neutral Balanced"></asp:ListItem>
        <asp:ListItem Value="6" Text="Neutral Dark"></asp:ListItem>
        <asp:ListItem Value="7" Text="Chaotic Light"></asp:ListItem>
        <asp:ListItem Value="8" Text="Chaotic Balanced"></asp:ListItem>
        <asp:ListItem Value="9" Text="Chaotic Dark"></asp:ListItem>
    </asp:DropDownList>

    <asp:DropDownList ID="editBackground" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
        <asp:ListItem Value="1" Text="Agent"></asp:ListItem>
        <asp:ListItem Value="2" Text="Bounty Hunter"></asp:ListItem>
        <asp:ListItem Value="3" Text="Criminal"></asp:ListItem>
        <asp:ListItem Value="4" Text="Entertainer"></asp:ListItem>
        <asp:ListItem Value="5" Text="Force Adept"></asp:ListItem>
        <asp:ListItem Value="6" Text="Gambler"></asp:ListItem>
        <asp:ListItem Value="7" Text="Investigator"></asp:ListItem>
        <asp:ListItem Value="8" Text="Jedi"></asp:ListItem>
        <asp:ListItem Value="9" Text="Mandalorian"></asp:ListItem>
        <asp:ListItem Value="10" Text="Mercenary"></asp:ListItem>
        <asp:ListItem Value="11" Text="Noble"></asp:ListItem>
        <asp:ListItem Value="12" Text="Nomad"></asp:ListItem>
        <asp:ListItem Value="13" Text="Outlaw"></asp:ListItem>
        <asp:ListItem Value="14" Text="Pirate"></asp:ListItem>
        <asp:ListItem Value="15" Text="Scientist"></asp:ListItem>
        <asp:ListItem Value="16" Text="Scoundrel"></asp:ListItem>
        <asp:ListItem Value="17" Text="Sith"></asp:ListItem>
        <asp:ListItem Value="18" Text="Smuggler"></asp:ListItem>
        <asp:ListItem Value="19" Text="Soldier"></asp:ListItem>
        <asp:ListItem Value="20" Text="Spacer"></asp:ListItem>
    </asp:DropDownList>

     <asp:DropDownList ID="editAttribute" runat="server" Visible="false">
        <asp:ListItem Value="0" Text=""></asp:ListItem>
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
