<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetBooks.aspx.cs" Inherits="GetBooks" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>



    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">GET BOOKS</h1>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->



    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- left column -->

                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">SEARCH</h3>
                                </div>
                                <div class="card-body">


                                    <asp:AutoCompleteExtender ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="false" CompletionSetCount="10" TargetControlID="TextBoxtitle" ID="AutoCompleteExtender1"
                                        runat="server" FirstRowSelected="false">
                                    </asp:AutoCompleteExtender>

                                    <div class="form-group" style="display: inline">
                                        <label>By Book Title</label>
                                        <asp:TextBox ID="TextBoxtitle" runat="server" autocomplete="off" CausesValidation="False" CssClass="form-control" Width="300"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>By Author</label>
                                        <asp:TextBox ID="TextBoxAuthor" runat="server" CausesValidation="False" CssClass="form-control" Width="300"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <asp:Button ID="ButtonSearch" runat="server" Text="Filter" CssClass="btn btn-primary" OnClick="ButtonSearch_Click" />
                                </div>

                            </div>
                        </div>



                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">AVAILABLE BOOKS</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->



                                <div class="card-body">

                                    <asp:GridView ID="GridViewBooks" runat="server" CssClass="table table-bordered" AllowPaging="True"
                                        AllowSorting="False" PageSize="1000"
                                        Width="100%" AutoGenerateColumns="false" OnRowCommand="GridViewBooks_RowCommand">

                                        <Columns>

                                            <asp:BoundField DataField="Book-No" HeaderText="Book-No" />
                                            <asp:BoundField DataField="Title" HeaderText="Title" />
                                            <asp:BoundField DataField="Rating" HeaderText="Rating" />
                                            <asp:BoundField DataField="Availability" HeaderText="Availability" />

                                            <asp:ButtonField Text="Book it now" CommandName="BookRow" ButtonType="Button" />

                                        </Columns>
                                    </asp:GridView>


                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <asp:Button ID="Button1" runat="server" Text="Add to List" CssClass="btn btn-primary" />
                                </div>

                            </div>


                        </div>
                        <!--/.col (left) -->

                    </div>


                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>


        </ContentTemplate>
        <Triggers>
            <%--  <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="Button3" />--%>
        </Triggers>
    </asp:UpdatePanel>


    <!-- /.content -->


</asp:Content>

