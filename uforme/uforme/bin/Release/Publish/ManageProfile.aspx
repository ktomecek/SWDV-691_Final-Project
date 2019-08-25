<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="uforme.ManageProfile" %>

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

            if (confirm("Your profile has been updated.")) {
                window.location.href = "LandingPage.aspx";
            }
            else {
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv.ClientID%>').prop('src', e.target.result)
                        .width(240)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
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
            <h2 class="text-center">MANAGE PROFILE</h2>
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
         <asp:Button ID="Done" runat="server" Text="CLICK HERE TO UPDATE YOUR PROFILE" OnClick="Done_Click" /><br />
        <div class="col-md-12">
            <div>
                <asp:Panel ID="Panel1" runat="server" Width="100%" Height="220" Wrap="true" BackColor="#CCCCCC" Direction="LeftToRight" BorderColor="#0066FF">
                    <h3>SELECT IMAGE TO UPLOAD</h3>
                    <div class="divTable">
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <asp:FileUpload ID="fileUpload1" runat="server" onchange="ShowImagePreview(this);" />
                                </div>
                                <div class="divTableCell">&nbsp;</div>
                                <div class="divTableCell">
                                    <asp:Image ID="ImgPrv" Height="150px" Width="240px" runat="server" />
                                </div>
                                <div class="divTableCell">&nbsp;</div>
                                <div class="divTableCell">
                                    <%--<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />--%>
                                    <asp:ImageButton ID="btnUpload" runat="server" ImageUrl="~/images/upload-button.png" Height="100" Width="150" OnClick="btnUpload_Click1"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <div class="GridviewDiv">
                <asp:GridView ID="gvImages" CssClass="Gridview" runat="server" AutoGenerateColumns="False" OnRowCommand="gvImages_RowCommand">
                    <HeaderStyle CssClass="headerstyle" />
                    <Columns>
                        <%--<asp:BoundField HeaderText="Image Name" DataField="imagename" />--%>
                        <%--<asp:TemplateField HeaderText="Image">--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="DeleteImg" CommandName="DeleteImg" CommandArgument='<%#Eval("imageid") %>' runat="server" ImageUrl='~/images/delete-button.png' Height="100" Width="150" />

                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "ImageHandler.ashx?ImID="+ Eval("imageid") %>' Height="300" Width="300"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>


