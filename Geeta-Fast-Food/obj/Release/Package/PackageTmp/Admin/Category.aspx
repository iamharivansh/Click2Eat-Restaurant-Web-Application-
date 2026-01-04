<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Geeta_Fast_Food.Admin.Category" %>
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
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgCategory.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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

                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <h4 class="sub-title">Category</h4>
                                        <div>
                                            <div class="form-group">
                                                <label>Category Name</label>
                                                <div>
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Catergory Name" required ></asp:TextBox>
                                                    <asp:HiddenField ID="hdnId" runat="server" Value="0" />

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Category Image</label>
                                                <div>
                                                    <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />


                                                </div>
                                            </div>
                                            <div class="form-check pl-4">
                                                <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" CssClass="form-check-input" />

                                            </div>
                                            <div class="pb-5">

                                                <asp:Button ID="btnAddorUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddorUpdate_Click" />
                                                &nbsp;
                                                <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-primary" CausesValidation="false"  OnClick="btnClear_Click"/>
                                            </div>
                                            <div>
                                                <asp:Image ID="imgCategory" runat="server" CssClass="img-thumbnail" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                        <h4 class="sub-title">Category list</h4>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <asp:Repeater ID="reCategory" runat="server" OnItemCommand="reCategory_ItemCommand" OnItemDataBound="reCategory_ItemDataBound" >

                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                            <tr>
                                                                <th class="table-plus">Name</th>
                                                                <th>Image</th>
                                                                <th>IsActive</th>
                                                                <th>CreateDate</th>
                                                                <th class="datatable-nonsort">Action</th>
                                                            </tr>
                                                            </thead>
                                                       <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="table-plus"> <%#Eval("Name") %> </td>
                                                            <td> 
                                                                <img alt="" width="40" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                            </td>
                                                            <td> 
                                                                <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>
                                                            <td> <%#Eval("CreateDate") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" 
                                                                    CommandArgument='<%# Eval("CategoryId") %>' CommandName="edit">
                                                                    <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                    CssClass="badge badge-danger" CommandArgument='<%# Eval("CategoryId") %>'
                                                                    OnClientClick="return confirm('Do you want to delete this category?');" >
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
