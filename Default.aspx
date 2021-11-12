<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>A Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta charset="utf-8">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">

    <script type="text/javascript">

        $(document).ready(function ($) {
            //document.getElementsByTagNameNS("pushmenu").click();
        }

    </script>

</head>
<body class="hold-transition sidebar-collapse sidebar-mini layout-fixed">
    <center>
        <form id="form1" runat="server">

            <br />

            <section class="content">
                <div class="container-fluid">
                      <div class="row">
                            <div class="col-md-12" style="text-align:right">
                               <asp:Button ID="ButtonAdmin" runat="server" Text="Admin Access" CssClass="btn btn-danger" CausesValidation="False" OnClick="ButtonAdmin_Click" />
                              </div>
                          </div>
                    <br />
                    <div class="row">



                        <div class="col-md-7">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">SIGN IN</h3>
                                </div>
                                <!-- /.card-header -->

                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="TextBoxEmail" validationgroup="Group1" runat="server" CssClass="form-control" AutoCompleteType="Email" CausesValidation="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator validationgroup="Group1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
                                    </div>


                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <asp:Button ID="ButtonSignIN" validationgroup="Group1" runat="server" Text="Sign In" CssClass="btn btn-danger" CausesValidation="True" OnClick="ButtonSignIN_Click" />
                                </div>
                            </div>
                        </div>




                        <div class="col-md-5">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">SIGN UP</h3>
                                </div>
                                <!-- /.card-header -->

                                <div class="card-body">

                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="TextBoxE" validationgroup="Group2" runat="server" autocomplete="off" CssClass="form-control" AutoCompleteType="Email" CausesValidation="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator validationgroup="Group2" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" ControlToValidate="TextBoxE"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Phone</label>
                                        <asp:TextBox ID="TextBoxP" runat="server" validationgroup="Group2" autocomplete="off" CssClass="form-control"></asp:TextBox>

                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <asp:Button ID="ButtonSignUp" validationgroup="Group2" runat="server" Text="Sign Up" CssClass="btn btn-dark" CausesValidation="True" OnClick="ButtonSignUp_Click" />

                                </div>
                            </div>
                        </div>



                    </div>
                </div>
            </section>


        </form>


        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
      $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- ChartJS -->
        <script src="plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="plugins/summernote/summernote-bs4.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard.js"></script>
</body>
</html>
