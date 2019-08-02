using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;


namespace WebService
{
    /// <summary>Sun6394
    /// 
    /// Written By Karl Tomecek
    /// SWDV 691 - July 2019
    /// 
    /// Summary description for RestfulWebService
    /// This file contains all the web methods to be used for the Final Project
    /// 
    /// </summary>

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]

    public class RestfulWebService : System.Web.Services.WebService
    {
        #region WebMethods
        [WebMethod]
        public string CreateUser(string Password, string firstName, string lastName, string userName, string email)
        {
            return DBAccessor("EXEC dbo.CreateUser @Password='" + Password + "',@firstName='" + firstName + "',@lastName='" + lastName + "',@userName='" + userName + "',@email='" + email + "',@accessLevel=1");
        }

        [WebMethod]
        public string LogIn(string userName, string password)
        {
            return DBAccessor("EXEC LogIn @userName='" + userName + "', @password='" + password + "'");
        }

        [WebMethod]
        public string ResetPassword(string password, string userName)
        {
            return DBAccessor("EXEC ResetPassword @userName='" + userName + "', @password='" + password + "'");
        }

        [WebMethod]
        public string UpdateProfile(string userName = null, string email = null, string phone = null, string ccNumber = null, string cid = null, string gender = null, string height = null, string bodyType = null, string birthDate = null, string city = null, string state = null, string zip = null, string languagePreference = null)
        {
            //SqlHelper.ConnectionString = ConfigurationManager.ConnectionStrings["uformeConnectionString"].ConnectionString;
            using (SqlHelper db = new SqlHelper())
                return (db.ExecScalarProc("dbo.UpdateProfile", "@userName", userName, "@email", email, "@phone", phone, "@ccNumber", ccNumber, "@cid", cid, "@gender", gender, "@height", height, "@bodyType", bodyType, "@birthDate", birthDate, "@city", city, "@state", state, "@zip", zip, "@languagePreference", languagePreference)).ToString();
            //return DBAccessor("EXEC dbo.UpdateProfile @userName = '" + userName + "', @email='" + email + "', @phone='" + phone + "', @ccNumber='" + ccNumber + "', @cid='" + cid + "', @gender=" + gender + ", @height=" + height + ", @bodyType=" + bodyType + ", @birthDate='" + birthDate + "', @city='" + city + "', @state='" + state + "', @zip='" + zip + "', @languagePreference=" + languagePreference);
        }
        [WebMethod]
        public string GetUser(string userName)
        {
            return DBAccessor("EXEC GetUser @userName='" + userName + "'");
        }

        #endregion

        #region DataMethods
        private string DBAccessor(string sql)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["uformeConnectionString"].ConnectionString);
            try
            {
                using (var command = new SqlCommand(sql, sqlConnection1))
                {
                    sqlConnection1.Open();
                    return (string)command.ExecuteScalar();
                }
            }
            catch (Exception e)
            {
                return "DATABASE ERROR: " + e.ToString();
            }
        }
        #endregion


        /// <summary>
        /// Summary description for SqlHelper
        /// </summary>
        public class SqlHelper : IDisposable
        {
            // Internal members
            protected string _connString = null;
            protected SqlConnection _conn = null;
            protected SqlTransaction _trans = null;
            protected bool _disposed = false;

            /// <summary>
            /// Sets or returns the connection string use by all instances of this class.
            /// </summary>
            public static string ConnectionString { get; set; }

            /// <summary>
            /// Returns the current SqlTransaction object or null if no transaction
            /// is in effect.
            /// </summary>
            public SqlTransaction Transaction { get { return _trans; } }

            /// <summary>
            /// Constructor using global connection string.
            /// </summary>
            public SqlHelper()
            {
                _connString = ConfigurationManager.ConnectionStrings["uformeConnectionString"].ConnectionString;
                Connect();
            }

            /// <summary>
            /// Constructure using connection string override
            /// </summary>
            /// <param name="connString">Connection string for this instance</param>
            public SqlHelper(string connString)
            {
                _connString = connString;
                Connect();
            }

            // Creates a SqlConnection using the current connection string
            protected void Connect()
            {
                _conn = new SqlConnection(_connString);
                _conn.Open();
            }

            /// <summary>
            /// Constructs a SqlCommand with the given parameters. This method is normally called
            /// from the other methods and not called directly. But here it is if you need access
            /// to it.
            /// </summary>
            /// <param name="qry">SQL query or stored procedure name</param>
            /// <param name="type">Type of SQL command</param>
            /// <param name="args">Query arguments. Arguments should be in pairs where one is the
            /// name of the parameter and the second is the value. The very last argument can
            /// optionally be a SqlParameter object for specifying a custom argument type</param>
            /// <returns></returns>
            public SqlCommand CreateCommand(string qry, CommandType type, params object[] args)
            {
                SqlCommand cmd = new SqlCommand(qry, _conn);

                // Associate with current transaction, if any
                if (_trans != null)
                    cmd.Transaction = _trans;

                // Set command type
                cmd.CommandType = type;

                if (args != null)
                {
                    // Construct SQL parameters
                    for (int i = 0; i < args.Length; i++)
                    {
                        if (args[i] is string && i < (args.Length - 1))
                        {
                            SqlParameter parm = new SqlParameter();
                            parm.ParameterName = (string)args[i];
                            parm.Value = args[++i];
                            cmd.Parameters.Add(parm);
                        }
                        else if (args[i] is SqlParameter)
                        {
                            cmd.Parameters.Add((SqlParameter)args[i]);
                        }
                        else throw new ArgumentException("Invalid number or type of arguments supplied");
                    }
                }
                return cmd;
            }

            #region Exec Members

            /// <summary>
            /// Executes a query that returns a single value
            /// </summary>
            /// <param name="qry">Query text</param>
            /// <param name="args">Any number of parameter name/value pairs and/or SQLParameter arguments</param>
            /// <returns>Value of first column and first row of the results</returns>
            public object ExecScalar(string qry, params object[] args)
            {
                using (SqlCommand cmd = CreateCommand(qry, CommandType.Text, args))
                {
                    return cmd.ExecuteScalar();
                }
            }

            /// <summary>
            /// Executes a query that returns a single value
            /// </summary>
            /// <param name="proc">Name of stored proceduret</param>
            /// <param name="args">Any number of parameter name/value pairs and/or SQLParameter arguments</param>
            /// <returns>Value of first column and first row of the results</returns>
            public object ExecScalarProc(string qry, params object[] args)
            {
                using (SqlCommand cmd = CreateCommand(qry, CommandType.StoredProcedure, args))
                {
                    return cmd.ExecuteScalar();
                }
            }


            #endregion

            #region IDisposable Members

            public void Dispose()
            {
                Dispose(true);
                GC.SuppressFinalize(this);
            }

            protected virtual void Dispose(bool disposing)
            {
                if (!_disposed)
                {
                    // Need to dispose managed resources if being called manually
                    if (disposing)
                    {
                        if (_conn != null)
                        {
                            _conn.Dispose();
                            _conn = null;
                        }
                    }
                    _disposed = true;
                }
            }

            #endregion
        }

    }
}