<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Geeta_Fast_Food.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         // for disappearing alert message
         window.onload = function () {
             var second = 5;
             setTimeout(function () {
                 document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, second * 1000);
         };
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- contact section -->
    <section class="book_section layout_padding" style="background-image: url('../Images/chef1.png'); width: 100%; height:100%; background-repeat:no-repeat; 
            background-size: contain; background-attachment:scroll; background-position:right">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>Send Your Query</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Your Email"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is required" ControlToValidate="txtSubject"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Message is required" ControlToValidate="txtMessage"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="form-control" Height="200"
                                placeholder="Enter Your Query/Feedback"></asp:TextBox>
                        </div>

                        <div class="btn_box">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white"
                                OnClick="btnSubmit_Click"/>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="map_container ">
                        <div class="card">
                            <h4 class="card-header text-center">Contact Us</h4>
                            <div class="card-body">
                                <div class="card-title">
                                      <a href="https://www.google.com/maps/dir//007,+Maruti+Darshan+Society,+Opp.+IIT+Bombay+Main+Gate,+Jogeshwari+-+Vikhroli+Link+Rd,+Powai,+Mumbai,+Maharashtra+400076/@19.1243455,72.8454146,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3be7c7f1ec85f255:0x4cd64659020d295d!2m2!1d72.9154551!2d19.1243588"
                                    <i class="fa fa-map-marker text-dark " aria-hidden="true"></i>
                                  <span class="text-dark">Location
                                    </span></a>
                                </div>
                            </div>
                            <div class="list-group list-group-flush">
                                <div class="list-group-item list-group-item-action">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>Call +91 99304 41304
                                    </span>
                                </div>
                                <div class="list-group-item list-group-item-action">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>orderfood@gmail.com
                                    </span>
                                </div>
                            </div>
                            <div class="card-footer">
                                    <h5>Thank You..</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- contact book section -->
     
</asp:Content>
