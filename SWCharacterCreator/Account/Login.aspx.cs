using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SWCharacterCreator.Models;

namespace SWCharacterCreator.Account
{
    public partial class Login : Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        String queryStr;
        String emailStr;
        String userip;

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["Default.aspx"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["Default.aspx"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?Default.aspx=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            loginUser(out userip);
        }

        protected void loginUser(out string userip)
        {
            userip = Request.UserHostAddress;

            if (IsValid)
            {
                String connString = "server=" + userip + ";User ID=webuser;Password=1234;Database=swccdb;";


                //System.Configuration.ConfigurationManager.ConnectionStrings["SWCCStr"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
                conn.Open();

                queryStr = "SELECT * FROM swccdb.accounts " +
                    "WHERE email='" + Email.Text + "' AND pw='" + Password.Text + "'";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

                reader = cmd.ExecuteReader();
                emailStr = "";

                while (reader.HasRows && reader.Read())
                {
                    emailStr = reader.GetString(reader.GetOrdinal("email"));
                }

                if (reader.HasRows)
                {
                    Session["useremail"] = emailStr;
                    Response.BufferOutput = true;
                    Response.Redirect("~/CharacterCreator.aspx");
                }
                else
                {
                    FailureText.Text = "Invalid login attempt";
                    ErrorMessage.Visible = true;
                }

                reader.Close();
                conn.Close();
            }
        }
    }
}