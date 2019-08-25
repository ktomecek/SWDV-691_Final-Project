using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace uforme
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = null;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
            string result = restful.LogIn(Login1.UserName, Login1.Password);
            if (result.Contains("success"))
            {
                Session["UserName"] = Login1.UserName;
                Response.Redirect("LandingPage.aspx");
            }
            else
            {
                Login1.FailureText = "Incorrect credentials.  Please try again.";
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //Use https://jsonlint.com/ to validate your json
        //    //Great tool to generate a class from your Json data:  http://json2csharp.com/
        //    RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
        //   // string lala = restful.GetUser(TextBox2.Text);
        //    //TextBox1.Text = lala;
        //    //List<string> videogames = JsonConvert.DeserializeObject<List<string>>(lala);
        //    //lala = lala.Substring(1, lala.Length - 2);
        //    //SiteMember siteMember = JsonConvert.DeserializeObject<SiteMember>(lala);
        //    //TextBox1.Text = siteMember.password; // string.Join(", ", videogames.ToArray());
        //}

        //protected void Button1_Click1(object sender, EventArgs e)
        //{
        //    RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
        //    string lala = restful.GetUser("ktomecek");
        //    TextBox1.Text = lala;
        //    //List<string> videogames = JsonConvert.DeserializeObject<List<string>>(lala);
        //    lala = lala.Substring(1, lala.Length - 2);
        //    SiteMember siteMember = JsonConvert.DeserializeObject<SiteMember>(lala);
        //    TextBox1.Text = siteMember.password; // string.Join(", ", videogames.ToArray());
        //}
    }

   
}