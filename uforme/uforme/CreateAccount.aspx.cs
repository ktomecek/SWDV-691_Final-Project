using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace uforme
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 36; i < 84; i++)
                    this.height.Items.Add(i.ToString());
                this.height.SelectedIndex = 24;
                var genderList = new List<String>();
                genderList.Add("Female");
                genderList.Add("Male");
                genderList.Add("Prefer Not to specify");
                foreach (string gndr in genderList)
                    this.gender.Items.Add(gndr);
                var bodyType = new List<String>();
                bodyType.Add("Slim");
                bodyType.Add("Average");
                bodyType.Add("Athletic");
                bodyType.Add("Full");
                bodyType.Add("Prefer Not to specify");
                foreach (string bdy in bodyType)
                    this.bodyType.Items.Add(bdy);
                this.language.Items.Add("English");
                this.gender.SelectedIndex = 0;
            }
        }

        protected void Done_Click(object sender, EventArgs e)
        {
            SiteMember member = new SiteMember
            {
                password = this.password1.Text,
                firstName = this.firstName.Text,
                lastName = this.lastName.Text,
                userName = this.userName.Text,
                email = this.email.Text,
                phone = this.phone.Text,
                ccNumber = "00000",
                cid = "000",
                userActive = "1",
                accessLevel ="1",
                dateJoined =DateTime.Now.ToString("yyyyMMdd"),
                gender = this.gender.SelectedValue,
                height = (this.height.SelectedIndex + 36).ToString(),
                bodyType = this.bodyType.SelectedValue,
                birthDate =this.birthDate.Text,
                city = this.city.Text,
                state = this.state.Text,
                zip = this.zip.Text,
                languagePreference ="1"
            };
            RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
            string result = restful.CreateUser(member.password, member.firstName, member.lastName, member.userName, member.email);
            if (result.Contains("success"))
            {
                result = restful.UpdateProfile(member.userName, member.email, member.phone, member.ccNumber, member.cid, member.gender, member.height, member.bodyType, member.birthDate, member.city, member.state,member.zip, member.languagePreference);
                result = restful.CreateUserPreferences(member.userName, null);
            }

            //Return to the default.aspx page
            ScriptManager.RegisterStartupScript(this, typeof(string), "confirm", "alert();", true);
        }
    }
}