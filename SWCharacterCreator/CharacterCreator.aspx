<%@ Page Title="Character Creator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CharacterCreator.aspx.cs" Inherits="SWCharacterCreator.CharacterCreator" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Character Creator</h2>

    <p> Welcome to the Star Wars 5e Character Creator. Please fill out the below form to create your character!</p> <br />
    <h4> Character Name: </h4> 
    <asp:TextBox id="nameField" runat="server"/> <br/> <br />
    <h4> Choose a species: </h4>
    <asp:DropDownList ID="speciesSelect" name="speciesSelect" runat="server">
        <asp:ListItem Value="1">Bith</asp:ListItem>
        <asp:ListItem Value="2">Bothan</asp:ListItem>
        <asp:ListItem Value="3">Cathar</asp:ListItem>
        <asp:ListItem Value="4">Cerean</asp:ListItem>
        <asp:ListItem Value="5">Chiss</asp:ListItem>
        <asp:ListItem Value="6">Devaronian</asp:ListItem>
        <asp:ListItem Value="7">Droid, Class I</asp:ListItem>
        <asp:ListItem Value="8">Droid, Class II</asp:ListItem>
        <asp:ListItem Value="9">Droid, Class III</asp:ListItem>
        <asp:ListItem Value="10">Droid, Class IV</asp:ListItem>
        <asp:ListItem Value="11">Droid, Class V</asp:ListItem>
        <asp:ListItem Value="12">Duros</asp:ListItem>
        <asp:ListItem Value="13">Ewok</asp:ListItem>
        <asp:ListItem Value="14">Gamorrean</asp:ListItem>
        <asp:ListItem Value="15">Gungan</asp:ListItem>
        <asp:ListItem Value="16">Human</asp:ListItem>
        <asp:ListItem Value="17">Ithorian</asp:ListItem>
        <asp:ListItem Value="18">Jawa</asp:ListItem>
        <asp:ListItem Value="19">Kel Dor</asp:ListItem>
        <asp:ListItem Value="20">Mon Calamari</asp:ListItem>
        <asp:ListItem Value="21">Nautolan</asp:ListItem>
        <asp:ListItem Value="22">Rodian</asp:ListItem>
        <asp:ListItem Value="23">Sith Pureblood</asp:ListItem>
        <asp:ListItem Value="24">Togruta</asp:ListItem>
        <asp:ListItem Value="25">Trandoshan</asp:ListItem>
    </asp:DropDownList>

    <h4> Choose a class: </h4>
    <asp:DropDownList ID="classSelect" name="classSelect" runat="server">
        <asp:ListItem Value="1">Berserker</asp:ListItem>
        <asp:ListItem Value="2">Consular</asp:ListItem>
        <asp:ListItem Value="3">Engineer</asp:ListItem>
        <asp:ListItem Value="4">Fighter</asp:ListItem>
        <asp:ListItem Value="5">Guardian</asp:ListItem>
        <asp:ListItem Value="6">Monk</asp:ListItem>
        <asp:ListItem Value="7">Operative</asp:ListItem>
        <asp:ListItem Value="8">Scholar</asp:ListItem>
        <asp:ListItem Value="9">Scout</asp:ListItem>
        <asp:ListItem Value="10">Sentinel</asp:ListItem>
    </asp:DropDownList>

    <h4> Choose a level: </h4>
    <asp:DropDownList ID="levelSelect" name="levelSelect" runat="server">
        <asp:ListItem Value="1">1</asp:ListItem>
        <asp:ListItem Value="2">2</asp:ListItem>
        <asp:ListItem Value="3">3</asp:ListItem>
        <asp:ListItem Value="4">4</asp:ListItem>
        <asp:ListItem Value="5">5</asp:ListItem>
        <asp:ListItem Value="6">6</asp:ListItem>
        <asp:ListItem Value="7">7</asp:ListItem>
        <asp:ListItem Value="8">8</asp:ListItem>
        <asp:ListItem Value="9">9</asp:ListItem>
        <asp:ListItem Value="10">10</asp:ListItem>
        <asp:ListItem Value="11">11</asp:ListItem>
        <asp:ListItem Value="12">12</asp:ListItem>
        <asp:ListItem Value="13">13</asp:ListItem>
        <asp:ListItem Value="14">14</asp:ListItem>
        <asp:ListItem Value="15">15</asp:ListItem>
        <asp:ListItem Value="16">16</asp:ListItem>
        <asp:ListItem Value="17">17</asp:ListItem>
        <asp:ListItem Value="18">18</asp:ListItem>
        <asp:ListItem Value="19">19</asp:ListItem>
        <asp:ListItem Value="20">20</asp:ListItem>
    </asp:DropDownList>

    <h4> Choose an alignment: </h4>
    <asp:DropDownList ID="alignmentSelect" name="alignmentSelect" runat="server">
        <asp:ListItem Value="1">Lawful Light</asp:ListItem>
        <asp:ListItem Value="2">Lawful Balanced</asp:ListItem>
        <asp:ListItem Value="3">Lawful Dark</asp:ListItem>
        <asp:ListItem Value="4">Neutral Light</asp:ListItem>
        <asp:ListItem Value="5">Neutral Balanced</asp:ListItem>
        <asp:ListItem Value="6">Neutral Dark</asp:ListItem>
        <asp:ListItem Value="7">Chaotic Light</asp:ListItem>
        <asp:ListItem Value="8">Chaotic Balanced</asp:ListItem>
        <asp:ListItem Value="9">Chaotic Darks</asp:ListItem>
    </asp:DropDownList>

    <br />
    <h4> Choose Ability Scores: </h4>
    <asp:Table ID="AbilityScores" runat="Server" BorderColor="Sandybrown" BorderStyle="Solid" BorderWidth="2" Height="100" Width="600">
            <asp:TableRow ID="Row1" runat="Server" BorderColor="Sandybrown">
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Ability Scores
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Choose Score
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Racial Bonus
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Total Score
                </asp:TableCell>
           </asp:TableRow>
           <asp:TableRow ID="TableRow1" runat="Server" BorderColor="Sandybrown">
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Strength
                </asp:TableCell>
                  <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                      <asp:DropDownList ID="StrengthDrop" runat="server">
                          <asp:ListItem Value="1">8</asp:ListItem>
                          <asp:ListItem Value="2">10</asp:ListItem>
                          <asp:ListItem Value="3">12</asp:ListItem>
                          <asp:ListItem Value="4">14</asp:ListItem>
                          <asp:ListItem Value="5">16</asp:ListItem>
                          <asp:ListItem Value="6">18</asp:ListItem>
                          <asp:ListItem Value="7">20</asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    2
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    3
                </asp:TableCell>
           </asp:TableRow>

        <asp:TableRow ID="TableRow2" runat="Server" BorderColor="Sandybrown">
            <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Dexterity
                </asp:TableCell>
             <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="DexterityDrop" runat="server">
                          <asp:ListItem Value="1">8</asp:ListItem>
                          <asp:ListItem Value="2">10</asp:ListItem>
                          <asp:ListItem Value="3">12</asp:ListItem>
                          <asp:ListItem Value="4">14</asp:ListItem>
                          <asp:ListItem Value="5">16</asp:ListItem>
                          <asp:ListItem Value="6">18</asp:ListItem>
                          <asp:ListItem Value="7">20</asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    2
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    3
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow3" runat="Server" BorderColor="Sandybrown">
             <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Constitution
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="ConstitutionDrop" runat="server">
                          <asp:ListItem Value="1">8</asp:ListItem>
                          <asp:ListItem Value="2">10</asp:ListItem>
                          <asp:ListItem Value="3">12</asp:ListItem>
                          <asp:ListItem Value="4">14</asp:ListItem>
                          <asp:ListItem Value="5">16</asp:ListItem>
                          <asp:ListItem Value="6">18</asp:ListItem>
                          <asp:ListItem Value="7">20</asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    2
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    3
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow4" runat="Server" BorderColor="Sandybrown">
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Intelligence
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="IntelligenceDrop" runat="server">
                          <asp:ListItem Value="1">8</asp:ListItem>
                          <asp:ListItem Value="2">10</asp:ListItem>
                          <asp:ListItem Value="3">12</asp:ListItem>
                          <asp:ListItem Value="4">14</asp:ListItem>
                          <asp:ListItem Value="5">16</asp:ListItem>
                          <asp:ListItem Value="6">18</asp:ListItem>
                          <asp:ListItem Value="7">20</asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    2
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    3
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow5" runat="Server" BorderColor="Sandybrown">
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Wisdom
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="WisdomDrop" runat="server">
                          <asp:ListItem Value="1">8</asp:ListItem>
                          <asp:ListItem Value="2">10</asp:ListItem>
                          <asp:ListItem Value="3">12</asp:ListItem>
                          <asp:ListItem Value="4">14</asp:ListItem>
                          <asp:ListItem Value="5">16</asp:ListItem>
                          <asp:ListItem Value="6">18</asp:ListItem>
                          <asp:ListItem Value="7">20</asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    2
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    3
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow7" runat="Server" BorderColor="Sandybrown">
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Charisma
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="CharismaDrop" runat="server">
                          <asp:ListItem Value="1">8</asp:ListItem>
                          <asp:ListItem Value="2">10</asp:ListItem>
                          <asp:ListItem Value="3">12</asp:ListItem>
                          <asp:ListItem Value="4">14</asp:ListItem>
                          <asp:ListItem Value="5">16</asp:ListItem>
                          <asp:ListItem Value="6">18</asp:ListItem>
                          <asp:ListItem Value="7">20</asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    2
                </asp:TableCell>
                <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    3
                </asp:TableCell>
        </asp:TableRow>

    </asp:Table>
    
</asp:Content>


