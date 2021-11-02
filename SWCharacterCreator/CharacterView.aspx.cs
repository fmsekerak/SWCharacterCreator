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
        String emailStr;
        String acc_id;
        String userip;

        List<string> charNames = new List<string>();

        
        protected void Page_Load(object sender, EventArgs e) 
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();

            //"server=" + userip + ";User ID=webuser;Password=1234;Database=swccdb;";

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);

            conn.Open();

            queryStr = "SELECT charName FROM swccdb.characters";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader = cmd.ExecuteReader();

            while (reader.HasRows && reader.Read())
            {
                charNames.Add(reader.GetString(reader.GetOrdinal("charName")));
            }


            reader.Close();
            conn.Close();

            foreach(string charName in charNames)
            {
                displayCharacterSelect.Items.Add(charName);
            }
        }
            
        protected void displayCharacter(object sender, EventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();

            //"server=" + userip + ";User ID=webuser;Password=1234;Database=swccdb;";

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);

            conn.Open();

            queryStr = "SELECT * FROM swccdb.characters" + 
                " WHERE charName='" + displayCharacterSelect.SelectedValue + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader = cmd.ExecuteReader();
            emailStr = "";
            acc_id = "";

            while (reader.HasRows && reader.Read())
            {
                
            }

            if (reader.HasRows)
            {
                //done reading
            }
            else
            {

            }

            reader.Close();
            conn.Close();
        }

        protected void deleteCharacter(object sender, EventArgs e)
        {

        }
    }
}