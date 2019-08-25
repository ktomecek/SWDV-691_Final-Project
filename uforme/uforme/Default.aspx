<%@ Page Title="uFORme" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="uforme._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Stylesheets -->
    <link href="content/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/menu.css">
    <link href="content/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="content/style.css" rel="stylesheet">

    <!-- Scripts -->
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
                <%--<p class="text-center">LOGIN</p>--%>
                <p class="lead">Welcome to the coolest partner discovery site on the PLANET!!!</p>
            </div>
            <div class="col-md-4">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/logo.png" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            
                <table border="1" cellpading="0" cellspacing="0">
                    <tr>

                        <td>
                            <asp:Login ID="Login1" runat="server" LoginButtonText="GO!" TitleText="Sign In" PasswordLabelText="Password" UserNameLabelText="User Name" Height="226px" Width="131px">
                                <LayoutTemplate>
                                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" style="width: 380px; height: 231px">
                                                    <tr>
                                                        <td align="center" colspan="2">Sign In</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                                                        </td>
                                                        <td style="width: 249px">
                                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                                        </td>
                                                        <td style="width: 249px">
                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2" style="color: Red;">
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" colspan="1">
                                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="GO!" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                                        </td>
                                                        <td align="right" colspan="2">
                                                            <%--<asp:Button ID="PasswordReset" runat="server" CommandName="Login" Text="reset password" ValidationGroup="Login1" />--%>
                                                            <asp:LinkButton ID="ResetPassword" runat="server">reset password</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <caption>
                                                        <p>
                                                        </p>
                                                        <tr>
                                                            <td align="center" colspan="1">
                                                                <asp:Label ID="Label1" runat="server" Text="New?"></asp:Label>
                                                            </td>
                                                            <td align="left" colspan="2">
                                                                <asp:LinkButton ID="CreateAccount" runat="server" PostBackUrl="~/CreateAccount.aspx">create account</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </caption>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                            </asp:Login>
                        </td>

                    </tr>

                </table>
            

        </div>
        <div class="col-md-4">
            <asp:Image ID="Image1" runat="server" Height="60%" ImageUrl="~/images/People 1.jpg" Width="60%" />
        </div>
        <div class="col-md-4">

            <p>
                <asp:Image ID="Image3" runat="server" Height="60%" Width="60%" ImageUrl="~/images/People 2.jpg" />
            </p>

        </div>
    </div>
</asp:Content>
