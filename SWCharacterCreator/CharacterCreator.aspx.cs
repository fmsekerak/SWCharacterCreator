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
        MySql.Data.MySqlClient.MySqlDataReader reader;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        String queryStr;
        String acc_id;
        Boolean validFlag, nameValid, speciesValid, classValid, levelValid, alignmentValid, backgroundValid, abilityValid = false;
        List<string> charNames = new List<string>();
        List<string> classes = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void clearForm()
        {
            nameField.Text = "";
            speciesSelect.ClearSelection();
            classSelect.ClearSelection();
            multiclassSelect.ClearSelection();
            multiclassSelect.Enabled = false;
            levelSelect.ClearSelection();
            multiclassLevelSelect.ClearSelection();
            multiclassLevelSelect.Enabled = false;
            multiclassError.Visible = false;
            alignmentSelect.ClearSelection();
            StrengthDrop.ClearSelection();
            strengthTotal.Text = "-";
            DexterityDrop.ClearSelection();
            dexterityTotal.Text = "-";
            ConstitutionDrop.ClearSelection();
            constitutionTotal.Text = "-";
            IntelligenceDrop.ClearSelection();
            intelligenceTotal.Text = "-";
            WisdomDrop.ClearSelection();
            wisdomTotal.Text = "-";
            CharismaDrop.ClearSelection();
            charismaTotal.Text = "-";
            strengthRacial.Text = "-";
            dexterityRacial.Text = "-";
            constitutionRacial.Text = "-";
            intelligenceRacial.Text = "-";
            wisdomRacial.Text = "-";
            charismaRacial.Text = "-";
            backgroundSelect.ClearSelection();
            multiclassSelect.Items.Clear();
            classes.Clear();
            foreach (ListItem classIndex in classSelect.Items)
            {
                classes.Add(classIndex.ToString());
            }
            foreach (String classIndex in classes)
            {
                multiclassSelect.Items.Add(classIndex);
            }

        }

        protected void submitClick(object sender, EventArgs e)
        {
            // Name validation
            if (nameField.Text == "")
            {
                nameError.Visible = true;
                nameValid = false;
            } else
            {
                nameError.Visible = false;
                nameValid = true;
            }

            // Species validation
            if (speciesSelect.SelectedItem.Text == "")
            {
                speciesError.Visible = true;
                speciesValid = false;
            } else
            {
                speciesError.Visible = false;
                speciesValid = true;
            }

            // Class selection
            if (classSelect.SelectedItem.Text == "")
            {
                classError.Visible = true;
                classValid = false;
            } else
            {
                classError.Visible = false;
                classValid = true;
            }

            // Level Validation
            if (levelSelect.SelectedItem.Text == "")
            {
                levelError.Visible = true;
                levelValid = false;
            } else
            {
                levelError.Visible = false;
                levelValid = true;
            }

            // Alignment Validation
            if (alignmentSelect.SelectedItem.Text == "")
            {
                alignmentError.Visible = true;
                alignmentValid = false;
            } else
            {
                alignmentError.Visible = false;
                alignmentValid = true;
            }

            // Background Validation
            if (backgroundSelect.SelectedItem.Text == "")
            {
                backgroundError.Visible = true;
                backgroundValid = false;
            } else
            {
                backgroundError.Visible = false;
                backgroundValid = true;
            }

            // Ability Score Validation
            if (StrengthDrop.SelectedItem.Text == "" || DexterityDrop.SelectedItem.Text == "" || ConstitutionDrop.SelectedItem.Text == "" || IntelligenceDrop.SelectedItem.Text == ""
                || WisdomDrop.SelectedItem.Text == "" || CharismaDrop.SelectedItem.Text == "")
            {
                abilityError.Visible = true;
                abilityValid = false;
            } else
            {
                abilityError.Visible = false;
                abilityValid = true;
            }

            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            acc_id = (String)Session["acc_id"];

            // Name conflict validation
            queryStr = "SELECT charName FROM swccdb.characters " +
                "WHERE acc_id='" + acc_id + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.HasRows && reader.Read())
            {
                charNames.Add(reader.GetString(reader.GetOrdinal("charName")));
            }

            reader.Close();
            conn.Close();

            if (charNames.Contains(nameField.Text))
            {
                nameValid = false;
                nameConflict.Visible = true;

            } else
            {
                nameValid = true;
                nameConflict.Visible = false;
            }

            // Master Validation
            if (nameValid && speciesValid && classValid && levelValid && alignmentValid && backgroundValid && abilityValid)
            {
                validFlag = true;
            } else
            {
                validFlag = false;
            }

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();

            if (Convert.ToInt16(multiclassSelect.SelectedValue) > 0 && Convert.ToInt32(multiclassLevelSelect.SelectedValue) > 0 && validFlag)
            {
                // Multiclass is created and a level is selected.
                queryStr = "INSERT INTO swccdb.characters(charName, charSpecies, charClass, charMulticlass, charLvl, charMulticlassLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar, background, acc_id)" +
                            "VALUES('" + nameField.Text + "','" + speciesSelect.SelectedItem.Text + "','" + classSelect.SelectedItem.Text + "','" + multiclassSelect.SelectedItem.Text + "','" +
                            levelSelect.SelectedItem.Text + "','" + multiclassLevelSelect.SelectedItem.Text + "','" + alignmentSelect.SelectedItem.Text + "','" + strengthTotal.Text + "','" +
                            dexterityTotal.Text + "','" + constitutionTotal.Text + "','" + intelligenceTotal.Text + "','" + wisdomTotal.Text + "','" +
                            charismaTotal.Text + "','" + backgroundSelect.SelectedItem.Text + "','" + acc_id + "')";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                cmd.ExecuteReader();
                conn.Close();

                submitConfirmation.Text = "Character " + nameField.Text + " Created!";
                clearForm();

            } else if (Convert.ToInt16(multiclassSelect.SelectedValue) > 0 && Convert.ToInt32(multiclassLevelSelect.SelectedValue) == 0)
            {
                // Multiclass is selected, but a multiclass level is NOT selected.
                conn.Close();
                multiclassError.Visible = true;

            } else if (validFlag)
            {
                // No multiclass is selected, proceed as normal
                queryStr = "INSERT INTO swccdb.characters(charName, charSpecies, charClass, charMulticlass, charLvl, charMulticlassLvl, charAlignment, charStr, charDex, charCon, charInt, charWis, charChar, background, acc_id)" +
                            "VALUES('" + nameField.Text + "','" + speciesSelect.SelectedItem.Text + "','" + classSelect.SelectedItem.Text + "','-','" +
                            levelSelect.SelectedItem.Text + "','0','" + alignmentSelect.SelectedItem.Text + "','" + strengthTotal.Text + "','" + 
                            dexterityTotal.Text + "','" + constitutionTotal.Text + "','" +  intelligenceTotal.Text + "','" + wisdomTotal.Text + "','" + 
                            charismaTotal.Text + "','" + backgroundSelect.SelectedItem.Text + "','" + acc_id + "')";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                cmd.ExecuteReader();            
                conn.Close();

                submitConfirmation.Text = "Character " + nameField.Text + " Created!";
                clearForm();
            }
        }

        protected void speciesChanged(object sender, EventArgs e)
        {
            StrengthDrop.ClearSelection();
            strengthTotal.Text = "-";
            DexterityDrop.ClearSelection();
            dexterityTotal.Text = "-";
            ConstitutionDrop.ClearSelection();
            constitutionTotal.Text = "-";
            IntelligenceDrop.ClearSelection();
            intelligenceTotal.Text = "-";
            WisdomDrop.ClearSelection();
            wisdomTotal.Text = "-";
            CharismaDrop.ClearSelection();
            charismaTotal.Text = "-";

            switch (speciesSelect.SelectedItem.Text)
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
                case "Twilek":
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

        protected void DexterityChanged(object sender, EventArgs e)
        {
            if (dexterityRacial.Text != "-")
            {
                int tempRace = Convert.ToInt32(dexterityRacial.Text);
                int tempstr = Convert.ToInt32(DexterityDrop.SelectedItem.Text);
                int num = tempRace + tempstr;
                string total = num.ToString();
                dexterityTotal.Text = total;
            }
            else
            {
                dexterityTotal.Text = DexterityDrop.SelectedItem.Text;
            }

        }

        protected void ConstitutionChanged(object sender, EventArgs e)
        {
            if(constitutionRacial.Text != "-")
            {
                int tempRace = Convert.ToInt32(constitutionRacial.Text);
                int tempstr = Convert.ToInt32(ConstitutionDrop.SelectedItem.Text);
                int num = tempRace + tempstr;
                string total = num.ToString();
                constitutionTotal.Text = total;
            }
            else
            {
                constitutionTotal.Text = ConstitutionDrop.SelectedItem.Text;
            }
        }

        protected void IntelligenceChanged(object sender, EventArgs e)
        {
            if (intelligenceRacial.Text != "-")
            {
                int tempRace = Convert.ToInt32(intelligenceRacial.Text);
                int tempstr = Convert.ToInt32(IntelligenceDrop.SelectedItem.Text);
                int num = tempRace + tempstr;
                string total = num.ToString();
                intelligenceTotal.Text = total;
            }
            else
            {
                intelligenceTotal.Text = IntelligenceDrop.SelectedItem.Text;
            }
        }

        protected void WisdomChanged(object sender, EventArgs e)
        {
            if (wisdomRacial.Text != "-")
            {
                int tempRace = Convert.ToInt32(wisdomRacial.Text);
                int tempstr = Convert.ToInt32(WisdomDrop.SelectedItem.Text);
                int num = tempRace + tempstr;
                string total = num.ToString();
                wisdomTotal.Text = total;
            }
            else
            {
                wisdomTotal.Text = WisdomDrop.SelectedItem.Text;
            }
        }

        protected void CharismaChanged(object sender, EventArgs e)
        {
            if (charismaRacial.Text != "-")
            {
                int tempRace = Convert.ToInt32(charismaRacial.Text);
                int tempstr = Convert.ToInt32(CharismaDrop.SelectedItem.Text);
                int num = tempRace + tempstr;
                string total = num.ToString();
                charismaTotal.Text = total;
            }
            else
            {
                charismaTotal.Text = CharismaDrop.SelectedItem.Text;
            }
        }

        protected void classSelected(object sender, EventArgs e)
        {
            
        }

        protected void levelSelected(object sender, EventArgs e)
        {
            multiclassSelect.Enabled = true;
            multiclassSelect.Items.RemoveAt(classSelect.SelectedIndex);
        }

        protected void multiclassSelected(object sender, EventArgs e)
        {
            if (multiclassSelect.SelectedItem.Text == "")
            {
                multiclassLevelSelect.Enabled = false;
                multiclassLevelSelect.ClearSelection();
                multiclassError.Visible = false;
            } else
            {
                multiclassLevelSelect.Enabled = true;
            }
        }
        protected void multiclassLevelSelected(object sender, EventArgs e)
        {
            multiclassError.Visible = false;
        }
    }
}



