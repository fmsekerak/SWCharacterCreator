﻿using System;
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
        String acc_id;

        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void submitClick(object sender, EventArgs e)
        {
            
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();

            //"server=" + userip + ";User ID=webuser;Password=1234;Database=swccdb;";

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            acc_id = (String)Session["acc_id"];

            queryStr = "INSERT INTO swccdb.characters(charName, charSpecies, charClass, charLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar, acc_id)" +
            "VALUES('" + nameField.Text + "','" + speciesSelect.SelectedItem.Text + "','" + classSelect.SelectedItem.Text + "','" + levelSelect.SelectedItem.Text + "','" + alignmentSelect.SelectedItem.Text + 
            "','" + StrengthDrop.SelectedItem.Text + "','" + DexterityDrop.SelectedItem.Text + "','" + ConstitutionDrop.SelectedItem.Text + "','" + IntelligenceDrop.SelectedItem.Text + 
            "','" + WisdomDrop.SelectedItem.Text + "','" + CharismaDrop.SelectedItem.Text + "','" + acc_id + "')";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            cmd.ExecuteReader();
            
            conn.Close();
            Console.WriteLine("Character has been created.");       
            
        }

        protected void speciesChanged(object sender, EventArgs e)
        {
            switch(speciesSelect.SelectedItem.Text)
            {
                case "Bith":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "1";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "2";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Bothan":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "1";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "2";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Cathar":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "1";
                    break;
                case "Cerean":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "2";
                    wisdomRacial.Text = "1";
                    charismaRacial.Text = "-";
                    break;
                case "Chiss":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "2";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "1";
                    break;
                case "Devaronian":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "2";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "1";
                    break;
                case "Droid, Class I":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "2";
                    wisdomRacial.Text = "1";
                    charismaRacial.Text = "-";
                    break;
                case "Droid, Class II":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "1";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "2";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Droid, Class III":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "1";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "2";
                    break;
                case "Droid, Class IV":
                    strengthRacial.Text = "1";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "2";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Droid, Class V":
                    strengthRacial.Text = "2";
                    dexterityRacial.Text = "1";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Duros":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "1";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Ewok":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "1";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Gamorrean":
                    strengthRacial.Text = "2";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "1";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Gungan":
                    strengthRacial.Text = "1";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Human":
                    strengthRacial.Text = "2";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "1";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Ithorian":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "1";
                    charismaRacial.Text = "2";
                    break;
                case "Jawa":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "1";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Kel Dor":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "1";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "2";
                    charismaRacial.Text = "-";
                    break;
                case "Mon Calamari":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "1";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "2";
                    break;
                case "Nautolan":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "1";
                    charismaRacial.Text = "-";
                    break;
                case "Rodian":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "2";
                    constitutionRacial.Text = "1";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Sith Pureblood":
                    strengthRacial.Text = "1";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "2";
                    break;
                case "Togruta":
                    strengthRacial.Text = "1";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "2";
                    charismaRacial.Text = "-";
                    break;
                case "Trandoshan":
                    strengthRacial.Text = "2";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "1";
                    charismaRacial.Text = "-";
                    break;
                case "Tusken":
                    strengthRacial.Text = "1";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "2";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Twi'lek":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "1";
                    constitutionRacial.Text = "-";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "2";
                    break;
                case "Weequay":
                    strengthRacial.Text = "-";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "1";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "2";
                    break;
                case "Wookiee":
                    strengthRacial.Text = "2";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "1";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;
                case "Zabrak":
                    strengthRacial.Text = "1";
                    dexterityRacial.Text = "-";
                    constitutionRacial.Text = "2";
                    intelligenceRacial.Text = "-";
                    wisdomRacial.Text = "-";
                    charismaRacial.Text = "-";
                    break;

            }

        }

        protected void StrengthChanged(object sender, EventArgs e)
        {
            if(strengthRacial.Text != "-")
            {
                int tempRace = Convert.ToInt32(strengthRacial.Text);
                int tempstr = Convert.ToInt32(StrengthDrop.SelectedItem.Text);
                int num = tempRace + tempstr;
                string total = num.ToString();
                strengthTotal.Text = total;
            }
            else 
            {
                strengthTotal.Text = StrengthDrop.SelectedItem.Text;
            }



        }

    }
}



