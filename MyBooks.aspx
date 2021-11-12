<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyBooks.aspx.cs" Inherits="MyBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">MY BOOKS</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->



                                <div class="card-body">

                                    <asp:GridView ID="GridViewBooks" runat="server" CssClass="table table-bordered" AllowPaging="True"
                                        AllowSorting="False" PageSize="1000"
                                        Width="100%" >

                             
                                    </asp:GridView>


                                </div>
                                <!-- /.card-body -->

                               

                            </div>


                        </div>

</asp:Content>

