using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SWCharacterCreator
{
    public partial class CharacterView : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        String queryStr;
        String attributeEdit;
        public String sqlAttribute = "";
        String acc_id;
        String charName, charSpecies, charClass, charMulticlass, charLvl, charMulticlassLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar;
        Int16 intStr, intDex, intCon, intInt, intWis, intChar = 0;
        List<string> charNames = new List<string>();
        Boolean abilityFlag = false;
        
        protected void loadPage()
        {
            charNames.Add("");
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            acc_id = (String)Session["acc_id"];

            queryStr = "SELECT charName FROM swccdb.characters " +
                "WHERE acc_id='" + acc_id + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader = cmd.ExecuteReader();

            while (reader.HasRows && reader.Read())
            {
                charNames.Add(reader.GetString(reader.GetOrdinal("charName")));
            }

            if (reader.HasRows)
            {
                foreach (string charIndex in charNames)
                {
                    displayCharacterSelect.Items.Add(charIndex);
                    DeleteCharacterSelect.Items.Add(charIndex);
                    EditCharSelectList.Items.Add(charIndex);
                }
                charNames.Clear();
            }

            reader.Close();
            conn.Close();
        }
        protected void Page_Load(object sender, EventArgs e) 
        {
            loadPage();
        }
            
        protected void displayCharacter(object sender, EventArgs e)
        {

            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            queryStr = "SELECT * FROM swccdb.characters" + 
                " WHERE charName='" + displayCharacterSelect.SelectedValue + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader = cmd.ExecuteReader();

            while (reader.HasRows && reader.Read())
            {
                charName = reader.GetString(reader.GetOrdinal("charName"));
                charSpecies = reader.GetString(reader.GetOrdinal("charSpecies"));
                charClass = reader.GetString(reader.GetOrdinal("charClass"));
                charMulticlass = reader.GetString(reader.GetOrdinal("charMulticlass"));
                charLvl = reader.GetString(reader.GetOrdinal("charLvl"));
                charMulticlassLvl = reader.GetString(reader.GetOrdinal("charMulticlassLvl"));
                charAlignment = reader.GetString(reader.GetOrdinal("charAlignment"));
                charStr = reader.GetString(reader.GetOrdinal("charStr"));
                charDex = reader.GetString(reader.GetOrdinal("charDex"));
                charCon = reader.GetString(reader.GetOrdinal("charCon"));
                charInt = reader.GetString(reader.GetOrdinal("charInt"));
                charWis = reader.GetString(reader.GetOrdinal("charWis"));
                charChar = reader.GetString(reader.GetOrdinal("charChar"));
            }

            if (reader.HasRows)
            {
                //done reading
                DisplayName.Text = charName;
                DisplaySpecies.Text = charSpecies;
                DisplayClass.Text = charClass;
                DisplayLevel.Text = charLvl;
                DisplayAlignment.Text = charAlignment;
                DisplayStr.Text = charStr;
                DisplayDex.Text = charDex;
                DisplayCon.Text = charCon;
                DisplayInt.Text = charInt;
                DisplayWis.Text = charWis;
                DisplayChar.Text = charChar;
                if (charMulticlass != "-")
                {
                    DisplayMultiClass.Text = charMulticlass;
                    DisplayMultiLevel.Text = charMulticlassLvl;
                } else
                {
                    DisplayMultiClass.Text = "-";
                    DisplayMultiLevel.Text = "-";
                }
                if (charMulticlassLvl == "0")
                {
                    charMulticlassLvl = "-";
                }
                Response.BufferOutput = true;
            }

            reader.Close();
            conn.Close();

            displayCharacterSelect.Items.Clear();
            DeleteCharacterSelect.Items.Clear();
            EditCharSelectList.Items.Clear();
            loadPage();

        }

        protected void deleteCharacter(object sender, EventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            queryStr = "DELETE FROM swccdb.characters " + 
                       "WHERE charName='" + DeleteCharacterSelect.SelectedValue + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            cmd.ExecuteReader();
            conn.Close();

            displayCharacterSelect.Items.Clear();
            DeleteCharacterSelect.Items.Clear();
            EditCharSelectList.Items.Clear();
            loadPage();
        }

        protected void editIndexChanged(object sender, EventArgs e)
        {
            editName.Visible = false;
            editSpecies.Visible = false;
            editClass.Visible = false;
            editMulticlass.Visible = false;
            editBaseClassLevel.Visible = false;
            editMulticlassLevel.Visible = false;
            editAlignment.Visible = false;
            editBackground.Visible = false;
            editAbility.Visible = false;
        }

        protected void EditCharacter(object sender, EventArgs e)
        {

            attributeEdit = EditAttributeList.SelectedItem.Text;
            switch (attributeEdit)
            {
                case "Name":
                    editName.Visible = true;
                    break;
                case "Species":
                    editSpecies.Visible = true;
                    break;
                case "Base Class":
                    editClass.Visible = true;
                    break;
                case "Base Class Level":
                    editBaseClassLevel.Visible = true;
                    break;
                case "Multiclass":
                    editMulticlass.Visible = true;
                    break;
                case "Multiclass Level":
                    editMulticlassLevel.Visible = true;
                    break;
                case "Alignment":
                    editAlignment.Visible = true;
                    break;
                case "Background":
                    editBackground.Visible = true;
                    break;
                default:
                    if (attributeEdit != "")
                    { 
                        editAbility.Visible = true;
                        break;
                    }
                    break;
            }
        }
        
        protected void SubmitEditCharacter(object sender, EventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            attributeEdit = EditAttributeList.SelectedItem.Text;
            switch (attributeEdit)
            {
                case "Name":
                    sqlAttribute = "charName";
                    queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editName.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedItem.Text + "' AND acc_id='" + acc_id + "'";
                    break;
                case "Species":
                    sqlAttribute = "charSpecies";

                    // Special case, must subtract the old racial bonus, then add the new racial bonus.
                    acc_id = (String)Session["acc_id"];

                    // First, get the current species and the current ability scores.
                    queryStr = "SELECT charSpecies, charStr, charDex, charCon, charInt, charWis, charChar FROM swccdb.characters" +
                        " WHERE charName='" + EditCharSelectList.SelectedItem.Text + "' AND acc_id='" + acc_id + "'";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                    {
                        charSpecies = reader.GetString(reader.GetOrdinal("charSpecies"));
                        intStr = reader.GetInt16(reader.GetOrdinal("charStr"));
                        intDex = reader.GetInt16(reader.GetOrdinal("charDex"));
                        intCon = reader.GetInt16(reader.GetOrdinal("charCon"));
                        intInt = reader.GetInt16(reader.GetOrdinal("charInt"));
                        intWis = reader.GetInt16(reader.GetOrdinal("charWis"));
                        intChar = reader.GetInt16(reader.GetOrdinal("charChar"));
                    }

                    reader.Close();

                    // Now that we have the current species and the current ability scores, pull the racial bonuses from the species table and subtract from the current ability scores.
                    queryStr = "SELECT strBonus, dexBonus, conBonus, intBonus, wisBonus, charBonus FROM swccdb.species" +
                        " WHERE species='" + charSpecies + "'";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                    {
                        intStr -= reader.GetInt16(reader.GetOrdinal("strBonus"));
                        intDex -= reader.GetInt16(reader.GetOrdinal("dexBonus"));
                        intCon -= reader.GetInt16(reader.GetOrdinal("conBonus"));
                        intInt -= reader.GetInt16(reader.GetOrdinal("intBonus"));
                        intWis -= reader.GetInt16(reader.GetOrdinal("wisBonus"));
                        intChar -= reader.GetInt16(reader.GetOrdinal("charBonus"));
                    }

                    reader.Close();

                    // Now, the ability scores are back to their base values. Just need to add the new racial bonuses and update the database.
                    charSpecies = editSpecies.SelectedItem.Text;
                    queryStr = "SELECT strBonus, dexBonus, conBonus, intBonus, wisBonus, charBonus FROM swccdb.species" +
                        " WHERE species='" + charSpecies + "'";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                    reader = cmd.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                    {
                        intStr += reader.GetInt16(reader.GetOrdinal("strBonus"));
                        intDex += reader.GetInt16(reader.GetOrdinal("dexBonus"));
                        intCon += reader.GetInt16(reader.GetOrdinal("conBonus"));
                        intInt += reader.GetInt16(reader.GetOrdinal("intBonus"));
                        intWis += reader.GetInt16(reader.GetOrdinal("wisBonus"));
                        intChar += reader.GetInt16(reader.GetOrdinal("charBonus"));
                    }

                    reader.Close();

                    // Update the database.
                    queryStr = "UPDATE swccdb.characters " +
                       "SET charStr='" + intStr + "', charDex='" + intDex + "', charCon='" + intCon + "', charInt='" + intInt +
                       "', charWis='" + intWis + "', charChar='" + intChar + "', charSpecies='" + editSpecies.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    //cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                    //cmd.ExecuteReader();
                    //conn.Close();

                    break;
                case "Base Class":
                    sqlAttribute = "charClass";
                    queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editClass.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    break;
                case "Base Class Level":
                    queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editBaseClassLevel.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    break;
                case "Multiclass":
                    sqlAttribute = "charMulticlass";

                    // Special case for Multiclass, if user decides that they no longer want to multiclass, must also reset the multiclass level.
                    if (editMulticlass.SelectedItem.Text == "")
                    {
                        queryStr = "UPDATE swccdb.characters " +
                           "SET " + sqlAttribute + "='-', charMulticlassLvl='0' " +
                           "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    }
                    else
                    {
                        queryStr = "UPDATE swccdb.characters " +
                            "SET " + sqlAttribute + "='" + editMulticlass.SelectedItem.Text + "' " +
                            "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    }
                    
                    break;
                case "Multiclass Level":
                    sqlAttribute = "charMulticlassLvl";
                    queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editMulticlassLevel.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    break;
                case "Alignment":
                    sqlAttribute = "charAlignment";
                    queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editAlignment.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    break;
                case "Background":
                    sqlAttribute = "charBackground";
                    queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editBackground.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
                    break;
                case "Strength":
                    sqlAttribute = "charStr";
                    abilityFlag = true;
                    break;
                case "Dexterity":
                    sqlAttribute = "charDex";
                    abilityFlag = true;
                    break;
                case "Constitution":
                    sqlAttribute = "charCon";
                    abilityFlag = true;
                    break;
                case "Intelligence":
                    sqlAttribute = "charInt";
                    abilityFlag = true;
                    break;
                case "Wisdom":
                    sqlAttribute = "charWis";
                    abilityFlag = true;
                    break;
                case "Charisma":
                    sqlAttribute = "charChar";
                    abilityFlag = true;
                    break;
            }

            if (abilityFlag)
            {
                queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editAbility.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "' AND acc_id='" + acc_id + "'";
            }

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();

            abilityFlag = false;
            editName.Visible = false;
            editSpecies.Visible = false;
            editClass.Visible = false;
            editMulticlass.Visible = false;
            editBaseClassLevel.Visible = false;
            editMulticlassLevel.Visible = false;
            editAlignment.Visible = false;

            EditAttributeList.ClearSelection();
            displayCharacterSelect.Items.Clear();
            DeleteCharacterSelect.Items.Clear();
            EditCharSelectList.Items.Clear();
            loadPage();
        }
    }
}