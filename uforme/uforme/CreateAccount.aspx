<%@ Page Title="Create Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="uforme.CreateAccount" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Stylesheets -->
    <link href="content/CreateAccount.css" rel="stylesheet">
    <link href="content/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="content/style.css" rel="stylesheet">


    <!-- Scripts -->
    <script type="text/javascript">

        function alert() {

            if (confirm("Your account is set up.  You will now be redirected to the login screen.")) {
                window.location.href = "Default.aspx";
            }
            else {
                return false;
            }
        }
    </script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="js/menu.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-8">
                <h1 class="text-center">WWW.uFORme.COM</h1>
                <br />
                <p class="lead">Welcome to the coolest partner discovery site on the PLANET!!!</p>
            </div>
            <div class="col-md-4">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/logo.png" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-center">CREATE ACCOUNT</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">Enter your information below</h3>
            <div class="col-md-12">
                <div class="divTable blueTable">
                    <div class="divTableBody">
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label17" runat="server" Text="UserName (for example first initial last name...jsmith):"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="userName" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label18" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="divTableCell">
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="password1" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label4" runat="server" Text="Password Again:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="password2" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label15" runat="server" Text="Email:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label16" runat="server" Text="Phone:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label5" runat="server" Text="Credit Card #:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="ccNumber" runat="server" Enabled="False"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label6" runat="server" Text="CIP:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="cid" runat="server" Enabled="False"></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label7" runat="server" Text="Gender:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:DropDownList ID="gender" runat="server"></asp:DropDownList>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label8" runat="server" Text="Height(in inches):"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:DropDownList ID="height" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label9" runat="server" Text="Body Type:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:DropDownList ID="bodyType" runat="server"></asp:DropDownList>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label10" runat="server" Text="Age:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="birthDate" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label11" runat="server" Text="City:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="city" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label12" runat="server" Text="State:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="state" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label13" runat="server" Text="ZipCode:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="zip" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                                <asp:Label ID="Label14" runat="server" Text="Language:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:DropDownList ID="language" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="Done" runat="server" Text="GO!" OnClick="Done_Click" />
    </div>
</asp:Content>

