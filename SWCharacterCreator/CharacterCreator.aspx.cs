using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWCharacterCreator
{
    public partial class CharacterCreator : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        String queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitClick(object sender, EventArgs e)
        {
            
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();

            //"server=" + userip + ";User ID=webuser;Password=1234;Database=swccdb;";

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            queryStr = "INSERT INTO swccdb.characters(charName, charSpecies, charClass, charLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar)" +
            "VALUES('" + nameField.Text + "','" + speciesSelect.SelectedItem.Text + "','" + classSelect.SelectedItem.Text + "','" + levelSelect.SelectedItem.Text + "','" + alignmentSelect.SelectedItem.Text + 
            "','" + StrengthDrop.SelectedItem.Text + "','" + DexterityDrop.SelectedItem.Text + "','" + ConstitutionDrop.SelectedItem.Text + "','" + IntelligenceDrop.SelectedItem.Text + 
            "','" + WisdomDrop.SelectedItem.Text + "','" + CharismaDrop.SelectedItem.Text + "')";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            cmd.ExecuteReader();
            
            conn.Close();
            Console.WriteLine("Character has been created.");       
            
        }
    }
}



