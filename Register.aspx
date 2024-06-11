<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Bootply snippet - Bootstrap Bootstrap Login Form</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Example snippet for a Bootstrap login form modal" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h1 class="text-center">Register</h1>
                </div>
                <div class="modal-body">
                    <form runat="server" class="form col-md-12 center-block">
                        <div class="form-group">

                            <asp:TextBox ID="TextBox1" class="form-control input-lg" placeholder="Enter UserName" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <asp:TextBox ID="TextBox2" class="form-control input-lg" placeholder="Enter Password" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <asp:TextBox ID="TextBox3" class="form-control input-lg" placeholder="Confirm Password" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <asp:FileUpload ID="FileUpload1" runat="server"/>
                        </div>
                        <div class="form-group">

                            <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-lg btn-block" Text="Click" OnClick="Button1_Click" />
                            <span class="pull-right"><a href="Login.aspx">Login</a></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>