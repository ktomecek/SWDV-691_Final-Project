using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;

namespace uforme
{
    public partial class ManageProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Preserve the data for round trip of page load event
            if (Session["UserName"] != null)
            {
                if (!IsPostBack)
                {
                    BindGridviewData();
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
                    LoadData();
                }
                //else
                //{
                //    Response.Redirect("Default.aspx)");
                //}
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        public void LoadData()
        {
            //Preserve the data for round trip of page load event

            RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
            string result = restful.GetUser(Session["UserName"].ToString());
            if (result != null)
            {
                //do json stuff here
                result = result.Substring(1, result.Length - 2);
                SiteMember siteMember = JsonConvert.DeserializeObject<SiteMember>(result);
                //Populate the Fields
                this.password1.Text = siteMember.password;
                this.password2.Text = siteMember.password;
                this.email.Text = siteMember.email;
                this.phone.Text = siteMember.phone;
                this.birthDate.Text = siteMember.birthDate;
                this.city.Text = siteMember.city;
                this.state.Text = siteMember.state;
                this.zip.Text = siteMember.zip;
                //Now set the dropdownlists
                gender.SelectedIndex = gender.Items.IndexOf(gender.Items.FindByText(siteMember.gender));
                height.SelectedIndex = height.Items.IndexOf(height.Items.FindByText(siteMember.height));
                bodyType.SelectedIndex = bodyType.Items.IndexOf(bodyType.Items.FindByText(siteMember.bodyType));
                language.SelectedIndex = language.Items.IndexOf(language.Items.FindByText(siteMember.languagePreference));
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }

        protected void Done_Click(object sender, EventArgs e)
        {
            SiteMember member = new SiteMember
            {
                password = this.password1.Text,
                userName = this.Session["UserName"].ToString(),
                email = this.email.Text,
                phone = this.phone.Text,
                ccNumber = "00000",
                cid = "000",
                userActive = "1",
                accessLevel = "1",
                dateJoined = DateTime.Now.ToString("yyyyMMdd"),
                gender = this.gender.SelectedValue,
                height = (this.height.SelectedIndex + 36).ToString(),
                bodyType = this.bodyType.SelectedValue,
                birthDate = this.birthDate.Text,
                city = this.city.Text,
                state = this.state.Text,
                zip = this.zip.Text,
                languagePreference = "1"
            };
            RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
            string result = restful.UpdateProfile(member.userName, member.email, member.phone, member.ccNumber, member.cid, member.gender, member.height, member.bodyType, member.birthDate, member.city, member.state, member.zip, member.languagePreference);
            //Return to the default.aspx page
            ScriptManager.RegisterStartupScript(this, typeof(string), "confirm", "alert();", true);
            LoadData();
        }

        // Bind Gridview Data
        private void BindGridviewData()
        {
            RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
            string result = restful.GetImage(Session["UserName"].ToString(), 0);

            if (result != null)
            {
                //do json stuff here
                //result = result.Substring(1, result.Length - 2);
                List<ImageMember> imgMember = JsonConvert.DeserializeObject<List<ImageMember>>(result);
                //Populate the Fields
                gvImages.DataSource = imgMember;
                gvImages.DataBind();
            }                    
        }

        protected void btnUpload_Click1(object sender, ImageClickEventArgs e)
        {
            //Condition to check if the file uploaded or not
            if (fileUpload1.HasFile)
            {
                int length = fileUpload1.PostedFile.ContentLength;
                byte[] imgbyte = new byte[length];
                HttpPostedFile img = fileUpload1.PostedFile;
                //set the binary data
                img.InputStream.Read(imgbyte, 0, length);
                string filename = Path.GetFileName(fileUpload1.PostedFile.FileName);

                RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
                string result = restful.SaveImage(Session["UserName"].ToString(), "1", filename, imgbyte);
                BindGridviewData();
            }
        }

        protected void gvImages_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteImg")
            {
                int id = Int32.Parse(e.CommandArgument.ToString());

                RestfulWebServiceReference.RestfulWebService restful = new RestfulWebServiceReference.RestfulWebService();
                string result = restful.DeleteImage(id);
                BindGridviewData();
            }
        }
    }
}