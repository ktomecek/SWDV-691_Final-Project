<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogOut.aspx.cs" Inherits="uforme.LogOut" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Stylesheets -->
    <link href="content/CreateAccount.css" rel="stylesheet">
    <link href="content/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/menu.css">
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
                <p class="lead">Welcome to the coolest partner discovery site on the PLANET!!!</p>
            </div>
            <div class="col-md-4">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/logo.png" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-center">LOGOUT</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">You are about to log out of the system</h3>
            <div class="col-md-12">

                <asp:Label ID="Label1" runat="server" Text="Are you sure you would like to log out?"></asp:Label>
                <asp:Button ID="YesButton" runat="server" Text="Yes" OnClick="YesButton_Click" />
                <asp:Button ID="NoButton" runat="server" Text="No" OnClick="NoButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>
