﻿using System;
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
        String userip;
        String charName, charSpecies, charClass, charLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar;
        List<string> charNames = new List<string>();

        /*
        
        protected void Page_Load(object sender, EventArgs e) 
        {
            displayCharacterSelect.Items.Clear();

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
        */
            
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
        }

        protected void deleteCharacter(object sender, EventArgs e)
        {

        }

        protected void EditCharacter(object sender, EventArgs e)
        {
        
        }
    }
}