﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forum :: Home Page</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/messsages.css" rel="stylesheet">
    <link href="./fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        #ms-scrollbar::-webkit-scrollbar-track {
            background-color: #CCCCCC;
        }

        #ms-scrollbar::-webkit-scrollbar {
            width: 7px;
            background-color: #F5F5F5;
        }

        #ms-scrollbar::-webkit-scrollbar-thumb {
            background-color: #eeeeee;
            -webkit-box-shadow: inset 0 0 0px rgba(0,0,0,0.3);
        }

        .ms-new {
            box-shadow: 0 2px 5px rgba(0,0,0,0.16),0 2px 10px rgba(0,0,0,0.12);
            background-color: #2196f3;
        }
    </style>
    <script src="jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //function SetScrollPosition() {
        //    var div = document.getElementById('div.lv-body');
        //    div.scrollTop = 100000000000;
        //}
        //<![CDATA[
        //$(window).load(function () {
        //    $(".chat").animate({ scrollTop: $(document).height() }, "slow");
        //    return false;
        //});//]]> 
        //var $cont = $('.chat');
        //$cont[0].scrollTop = $cont[0].scrollHeight;
        window.onload = function () {
            $("div.lv-body").scrollTop(10000);
        };
        //function scroll() {

        //    var objDiv = document.getElementById('div.lv-body');
        //        objDiv.scrollTop = objDiv.scrollHeight;
        //       setTimeout("scroll()", 1);
        //}
    </script>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <div class="container ng-scope">
                <div class="block-header">
                    <h2></h2>

                </div>
                <div class="card m-b-0" id="messages-main" style="box-shadow: 0 0 40px 1px #c9cccd;">
                    <div class="ms-menu" style="overflow: scroll; overflow-x: hidden;" id="ms-scrollbar">
                        <div class="ms-block">
                            <div class="ms-user">
                                <%--<img src="./images/avatar.jpg" alt=""> --%>
                                <asp:Image ID="Image1" runat="server" />
                                <h5 class="q-title" align="center">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    <b>5</b> New Messages</h5>
                            </div>
                        </div>
                        <div class="ms-block">
                            <a class="btn btn-primary btn-block ms-new" href="#"><span class="glyphicon glyphicon-envelope"></span>&nbsp; New Message</a>
                        </div>
                        <hr />
                        <div class="listview lv-user m-t-20">
                            <asp:DataList ID="DataList1" runat="server">
                                <ItemTemplate>
                                    <div class="lv-item media">
                                        <div class="lv-avatar pull-left">
                                            <%--<img src="./images/bhai.jpg" alt=""> --%>
                                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("Image","~/images/{0}") %>' />
                                        </div>
                                        <div class="media-body">
                                            <div class="lv-title"></div>
                                            <asp:LinkButton ID="LinkButton1" ForeColor="Black" runat="server" Text='<%# Bind("Name") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>


                        </div>
                    </div>
                    <div class="ms-body">
                        <div class="listview lv-message">
                            <div class="lv-header-alt clearfix">
                                <div id="ms-menu-trigger">
                                    <div class="line-wrap">
                                        <div class="line top">
                                        </div>
                                        <div class="line center"></div>
                                        <div class="line bottom"></div>
                                    </div>
                                </div>
                                <div class="lvh-label hidden-xs">
                                    <div class="lv-avatar pull-left">
                                        <asp:Image ID="Image3" runat="server" />
                                    </div>
                                    <span class="c-black">
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label><span style="margin-left: 8px; position: absolute; margin-top: 12px; width: 8px; height: 8px; line-height: 8px; border-radius: 50%; background-color: #80d3ab;"></span></span>
                                </div>
                            </div>
                            <div class="lv-body" id="ms-scrollbar" style="overflow: scroll; overflow-x: hidden; height: 520px;">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                                        <asp:DataList ID="DataList3" runat="server">
                                            <ItemTemplate>
                                                <div class="lv-item media">
                                                    <div class="lv-avatar pull-left">
                                                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Bind("Image") %>' />

                                                    </div>
                                                    <div class="media-body">
                                                        <div class="ms-item">
                                                            <span class="glyphicon glyphicon-triangle-left" style="color: #000000;"></span>
                                                            <asp:Label ID="Message" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                                        </div>
                                                        <small class="ms-date"><span class="glyphicon glyphicon-time"></span>&nbsp;
                                                            <asp:Label ID="Date" runat="server" Text='<%# Bind("Time") %>'></asp:Label></small>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>
                            <div class="clearfix"></div>
                            <div class="lv-footer ms-reply">
                                <asp:TextBox CssClass="textarea" ID="TextBox1" placeholder="Write messages..." runat="server"></asp:TextBox>
                                <button runat="server" class="button" onserverclick="Unnamed_ServerClick" height="" width="">
                                    <span class="glyphicon glyphicon-send"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="./css/jquery.js"></script>
    <script src="./css/bootstrap.min.js"></script>
</body>
</html>
