<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindPartner.aspx.cs" Inherits="uforme.FindPartner" %>

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

            if (confirm("Your preferences have been updated.")) {
                window.location.href = "LandingPage.aspx";
            }
            else {
                return false;
            }
        }
    </script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
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
            <h2 class="text-center">MANAGE PREFERENCES - FIND YOUR SOULMATE</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">Manage your partner preferences below</h3>
            <div class="col-md-12">
                <div class="divTable blueTable">
                    <div class="divTableBody">
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
                                <asp:Label ID="Label9" runat="server" Text="Body Type:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:DropDownList ID="bodyType" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:Label ID="Label1" runat="server" Text="Age:"></asp:Label>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="birthDate" runat="server"></asp:TextBox>
                            </div>
                            <div class="divTableCell"></div>
                            <div class="divTableCell">
                            </div>
                            <div class="divTableCell">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="Done" runat="server" Text="GO!" OnClick="Done_Click" />
        <br />
        <div class="GridviewDiv">
            <asp:GridView ID="gvImages" CssClass="Gridview" runat="server" AutoGenerateColumns="False" EmptyDataText="&lt;h2&gt;Sorry, you don't have a match with those preferences.  Try changing them to see if you have more luck!&lt;h2&gt;" >
                <HeaderStyle CssClass="headerstyle" />
                <Columns>
                    <asp:BoundField HeaderText="Partner User Name" DataField="userName" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <%--<asp:ImageButton ID="ConnectPerson" CommandArgument='<%#Eval("userName") %>' runat="server" ImageUrl='~/images/match-button.png' Height="100" Width="150" />--%>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                MATCH ME
                            </button>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "ImageHandler.ashx?ImID="+ Eval("imageid") %>' Height="300" Width="300" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <!-- Button to Open the Modal -->


    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">CONGRATULATIONS!</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <h1>You have reached the end of this demo program.  This is the MVP.<br />
                        An actual finished application would send an email off to your partner.</h1>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

