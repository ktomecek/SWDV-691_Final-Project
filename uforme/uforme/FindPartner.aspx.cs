using System;
using System.Collections.Generic;
using System.Web.UI;
using Newtonsoft.Json;

namespace uforme
{
    public partial class FindPartner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Preserve the data for round trip of page load event
            if (Session["UserName"] != null)
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
                    this.gender.SelectedIndex = 0;
                    LoadData();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        public void LoadData()
        {
            //Preserve the data for round trip of page load event
            if (Session["UserName"] != null)
            {
                RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
                string result = restful.GetUserPreferences(Session["UserName"].ToString());
                if (result != null)
                {
                    //do json stuff here
                    result = result.Substring(1, result.Length - 2);
                    SiteMember siteMember = JsonConvert.DeserializeObject<SiteMember>(result);
                    //Populate the Fields
                    this.birthDate.Text = siteMember.birthDate;
                    this.city.Text = siteMember.city;
                    this.state.Text = siteMember.state;
                    this.zip.Text = siteMember.zip;
                    //Now set the dropdownlists
                    gender.SelectedIndex = gender.Items.IndexOf(gender.Items.FindByText(siteMember.gender));
                    height.SelectedIndex = height.Items.IndexOf(height.Items.FindByText(siteMember.height));
                    bodyType.SelectedIndex = bodyType.Items.IndexOf(bodyType.Items.FindByText(siteMember.bodyType));
                }
                else
                {
                    Response.Redirect("LandingPage.aspx");
                }
            }
        }

        protected void Done_Click(object sender, EventArgs e)
        {
            SiteMember member = new SiteMember
            {
                userName = this.Session["UserName"].ToString(),
                gender = this.gender.SelectedValue,
                height = (this.height.SelectedIndex + 36).ToString(),
                bodyType = this.bodyType.SelectedValue,
                birthDate = this.birthDate.Text,
                city = this.city.Text,
                state = this.state.Text,
                zip = this.zip.Text,

            };
            RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
            string result = restful.UpdateUserPreferences(member.userName, member.gender, member.birthDate, null, null, null, null, null, null, null, member.bodyType, member.height, null, member.city, member.state, member.zip, null, null, null, null);
            //Return to the default.aspx page

            RestfulWebServiceReference.RestfulWebService partner = new RestfulWebServiceReference.RestfulWebService();
            string result2 = partner.MatchMaker(member.userName, member.gender, member.birthDate, member.bodyType, member.height, member.city, member.state, member.zip);

            if (!result2.Contains("none"))
            {
                List<SiteMember> siteMember = JsonConvert.DeserializeObject<List<SiteMember>>(result2);
                this.gvImages.DataSource = siteMember;
                this.gvImages.DataBind();
            }
            else
            {
                this.gvImages.DataSource = null;
                this.gvImages.DataBind();
            }
            //ScriptManager.RegisterStartupScript(this, typeof(string), "confirm", "alert();", true);
            LoadData();
        }
    }
}