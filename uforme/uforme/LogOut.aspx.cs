using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace uforme
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void YesButton_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Response.Redirect("Default.aspx");
        }

        protected void NoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }
    }
}