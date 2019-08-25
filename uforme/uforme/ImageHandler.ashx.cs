using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace uforme
{
    /// <summary>
    /// This Image Handler gets the image to load into the template
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string imageid = context.Request.QueryString["ImID"];
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["uformeConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select imageData from images where imageid=" + imageid, con);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            context.Response.BinaryWrite((byte[])dr[0]);
            con.Close();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}