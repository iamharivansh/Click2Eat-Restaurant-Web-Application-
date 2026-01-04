<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Geeta_Fast_Food.Admin.Users" %>
<%@ import Namespace="Geeta_Fast_Food" %>
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
    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">

            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                            </div>
                            <div class="card-block">
                                <div class="row">

                                  
                                    <div class="col-12 mobile-inputs">
                                        <h4 class="sub-title">Category list</h4>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <asp:Repeater ID="reUsers" runat="server" OnItemCommand="reUsers_ItemCommand" >

                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table-plus">SrNo</th>
                                                                    <th>Full Name</th>
                                                                    <th>Username</th>
                                                                    <th>Email</th>
                                                                    <th>Joined Date</th>
                                                                    <th class="datatable-nonsort">Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="table-plus"><%#Eval("SrNo") %> </td>
                                                            <td><%#Eval("Name") %></td>
                                                            <td><%#Eval("Username") %></td>
                                                            <td><%#Eval("Email") %></td>
                                                            <td><%#Eval("CreateData") %></td>
                                                            
                                                            <td>
                                                                 <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                  CssClass="badge badge-danger" CommandArgument='<%# Eval("UserId") %>'
                                                                   OnClientClick="return confirm('Do you want to delete this User?');">
                                                                <i class="ti-trash"></i>    
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>

                                                    <FooterTemplate>
                                                        </tbody>
                                                    </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</asp:Content>
