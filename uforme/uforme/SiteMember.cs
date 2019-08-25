using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uforme
{
    public class SiteMember
    {
        public int userID { get; set; }
        public string password { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string userName { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string ccNumber { get; set; }
        public string cid { get; set; }
        public string userActive { get; set; }
        public string accessLevel { get; set; }
        public string dateJoined { get; set; }
        public string gender { get; set; }
        public string height { get; set; }
        public string bodyType { get; set; }
        public string birthDate { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zip { get; set; }
        public string imageID { get; set; }
        public string languagePreference { get; set; }
    }
}