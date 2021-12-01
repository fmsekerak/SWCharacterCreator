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
        String charName, charSpecies, charClass, charLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar;
        List<string> charNames = new List<string>();
        
        protected void loadPage()
        {
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
                charLvl = reader.GetString(reader.GetOrdinal("charLvl"));
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
                Response.BufferOutput = true;
            }
            else
            {

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
            editAttribute.Visible = false;
        }

        protected void EditCharacter(object sender, EventArgs e)
        {
            
            editAttribute.Visible = true;
        }
        
        protected void SubmitEditCharacter(object sender, EventArgs e)
        {
            
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            attributeEdit = EditAttributeList.SelectedItem.Text;
            switch (attributeEdit)
            {
                case "Strength":
                    sqlAttribute = "charStr";
                    break;
                case "Dexterity":
                    sqlAttribute = "charDex";
                    break;
                case "Constitution":
                    sqlAttribute = "charCon";
                    break;
                case "Intelligence":
                    sqlAttribute = "charInt";
                    break;
                case "Wisdom":
                    sqlAttribute = "charWis";
                    break;
                case "Charisma":
                    sqlAttribute = "charChar";
                    break;
            }

            queryStr = "UPDATE swccdb.characters " +
                       "SET " + sqlAttribute + "='" + editAttribute.SelectedItem.Text + "' " +
                       "WHERE charName='" + EditCharSelectList.SelectedValue + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();


            displayCharacterSelect.Items.Clear();
            DeleteCharacterSelect.Items.Clear();
            EditCharSelectList.Items.Clear();
            loadPage();
        }
    }
}