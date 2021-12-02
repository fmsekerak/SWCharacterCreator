<%@ Page Title="Character Creator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CharacterCreator.aspx.cs" Inherits="SWCharacterCreator.CharacterCreator" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Character Creator</h2>

    <p> Welcome to the Star Wars 5e Character Creator. Please fill out the below form to create your character!</p> <br />

    <h4> Character Name: </h4> 
    <asp:TextBox id="nameField" runat="server"/><br/>
    <asp:Label ID="nameError" runat="server" ForeColor="Red" Visible="false"> Please enter a name. </asp:Label>
    <asp:Label ID="nameConflict" runat="server" ForeColor="Red" Visible="false"> Character already exists on account. Choose another name. </asp:Label>

    <h4> Choose a species: </h4>
    <asp:DropDownList ID="speciesSelect" name="speciesSelect" runat="server" OnSelectedIndexChanged="speciesChanged" AutoPostBack="true">
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
    <asp:Label ID="speciesError" runat="server" ForeColor="Red" Visible="false"> Please choose a species. </asp:Label>

    <h4> Choose a class: </h4>
    <asp:DropDownList ID="classSelect" name="classSelect" runat="server" OnSelectedIndexChanged="classSelected" AutoPostBack="true">
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
    <asp:Label ID="classError" runat="server" ForeColor="Red" Visible="false"> Please choose a class. </asp:Label>

    <h4> Choose a level: </h4>
    <asp:DropDownList ID="levelSelect" name="levelSelect" runat="server" OnSelectedIndexChanged="levelSelected" AutoPostBack="true">
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
        
    <asp:Label ID="levelError" runat="server" ForeColor="Red" Visible="false"> Please choose a class level. </asp:Label>

    <h4> Choose a Multiclass (optional):</h4>
    <asp:DropDownList ID="multiclassSelect" name="multiclassSelect" runat="server" OnSelectedIndexChanged="multiclassSelected" AutoPostBack="true" Enabled="false">
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
        
    <h4> Choose a Multiclass Level (optional):</h4>
    <asp:DropDownList  ID="multiclassLevelSelect" name="levelSelect" runat="server" OnSelectedIndexChanged="multiclassSelected" AutoPostBack="true" Enabled="false">
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

    <asp:Label ID="multiclassError" runat="server" ForeColor="Red" Visible="false"> Please choose a multiclass level. </asp:Label>

    <h4> Choose an alignment: </h4>
    <asp:DropDownList ID="alignmentSelect" name="alignmentSelect" runat="server">
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
    <asp:Label ID="alignmentError" runat="server" ForeColor="Red" Visible="false"> Please choose an alignment. </asp:Label>

    <br />

    <h4> Choose a background: </h4>
    <asp:DropDownList ID="backgroundSelect" name="backgroundSelect" runat="server">
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
    <asp:Label ID="backgroundError" runat="server" ForeColor="Red" Visible="false"> Please choose a background. </asp:Label>

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
                      <asp:DropDownList ID="StrengthDrop" runat="server" OnSelectedIndexChanged="StrengthChanged" AutoPostBack="true">
                          <asp:ListItem Value="0" Text=""></asp:ListItem>
                          <asp:ListItem Value="1" Text="8"></asp:ListItem>
                          <asp:ListItem Value="2" Text="10"></asp:ListItem>
                          <asp:ListItem Value="3" Text="12"></asp:ListItem>
                          <asp:ListItem Value="4" Text="14"></asp:ListItem>
                          <asp:ListItem Value="5" Text="16"></asp:ListItem>
                          <asp:ListItem Value="6" Text="18"></asp:ListItem>
                          <asp:ListItem Value="7" Text="20"></asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="strengthRacial" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-"> 
                </asp:TableCell>
                <asp:TableCell ID="strengthTotal" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
           </asp:TableRow>

        <asp:TableRow ID="TableRow2" runat="Server" BorderColor="Sandybrown">
            <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Dexterity
                </asp:TableCell>
             <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="DexterityDrop" runat="server" OnSelectedIndexChanged="DexterityChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text=""></asp:ListItem>
                       <asp:ListItem Value="1"  Text="8"></asp:ListItem>
                          <asp:ListItem Value="2" Text="10"></asp:ListItem>
                          <asp:ListItem Value="3" Text="12"></asp:ListItem>
                          <asp:ListItem Value="4" Text="14"></asp:ListItem>
                          <asp:ListItem Value="5" Text="16"></asp:ListItem>
                          <asp:ListItem Value="6" Text="18"></asp:ListItem>
                          <asp:ListItem Value="7" Text="20"></asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="dexterityRacial" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
                <asp:TableCell ID="dexterityTotal" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow3" runat="Server" BorderColor="Sandybrown">
             <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Constitution
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="ConstitutionDrop" runat="server" OnSelectedIndexChanged="ConstitutionChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text=""></asp:ListItem>
                          <asp:ListItem Value="1"  Text="8"></asp:ListItem>
                          <asp:ListItem Value="2" Text="10"></asp:ListItem>
                          <asp:ListItem Value="3" Text="12"></asp:ListItem>
                          <asp:ListItem Value="4" Text="14"></asp:ListItem>
                          <asp:ListItem Value="5" Text="16"></asp:ListItem>
                          <asp:ListItem Value="6" Text="18"></asp:ListItem>
                          <asp:ListItem Value="7" Text="20"></asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="constitutionRacial" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
                <asp:TableCell ID="constitutionTotal" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow4" runat="Server" BorderColor="Sandybrown">
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Intelligence
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="IntelligenceDrop" runat="server" OnSelectedIndexChanged="IntelligenceChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text=""></asp:ListItem>
                          <asp:ListItem Value="1"  Text="8"></asp:ListItem>
                          <asp:ListItem Value="2" Text="10"></asp:ListItem>
                          <asp:ListItem Value="3" Text="12"></asp:ListItem>
                          <asp:ListItem Value="4" Text="14"></asp:ListItem>
                          <asp:ListItem Value="5" Text="16"></asp:ListItem>
                          <asp:ListItem Value="6" Text="18"></asp:ListItem>
                          <asp:ListItem Value="7" Text="20"></asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="intelligenceRacial" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
                <asp:TableCell ID="intelligenceTotal" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow5" runat="Server" BorderColor="Sandybrown">
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Wisdom
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="WisdomDrop" runat="server" OnSelectedIndexChanged="WisdomChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text=""></asp:ListItem>
                          <asp:ListItem Value="1"  Text="8"></asp:ListItem>
                          <asp:ListItem Value="2" Text="10"></asp:ListItem>
                          <asp:ListItem Value="3" Text="12"></asp:ListItem>
                          <asp:ListItem Value="4" Text="14"></asp:ListItem>
                          <asp:ListItem Value="5" Text="16"></asp:ListItem>
                          <asp:ListItem Value="6" Text="18"></asp:ListItem>
                          <asp:ListItem Value="7" Text="20"></asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="wisdomRacial" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
                <asp:TableCell ID="wisdomTotal" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow ID="TableRow7" runat="Server" BorderColor="Sandybrown">
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    Charisma
                </asp:TableCell>
              <asp:TableCell runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center">
                    <asp:DropDownList ID="CharismaDrop" runat="server" OnSelectedIndexChanged="CharismaChanged" AutoPostBack="true">
                        <asp:ListItem Value="0" Text=""></asp:ListItem>
                          <asp:ListItem Value="1"  Text="8"></asp:ListItem>
                          <asp:ListItem Value="2" Text="10"></asp:ListItem>
                          <asp:ListItem Value="3" Text="12"></asp:ListItem>
                          <asp:ListItem Value="4" Text="14"></asp:ListItem>
                          <asp:ListItem Value="5" Text="16"></asp:ListItem>
                          <asp:ListItem Value="6" Text="18"></asp:ListItem>
                          <asp:ListItem Value="7" Text="20"></asp:ListItem>
                      </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ID="charismaRacial" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
                <asp:TableCell ID="charismaTotal" runat="Server" BorderWidth="2" BorderColor="Sandybrown" HorizontalAlign="Center" Text="-">
                </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <br/>
        
    <asp:Label ID="abilityError" runat="server" ForeColor="Red" Visible="false"> Please choose a value for every ability score. </asp:Label>

    <br />

    <asp:Button OnClick="submitClick" runat="server" ID="submitButton" Text="Create Character">
    </asp:Button>
    
        <asp:Label ID="submitConfirmation" Text="" runat="server"></asp:Label>
</asp:Content>


