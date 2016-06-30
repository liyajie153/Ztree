﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="img.aspx.cs" Inherits="img" %>
<%@ Register  Src="~/WebUserControl.ascx" TagName="UserC" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/demo.css" type="text/css">
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="layer-v1.8.5/layer/layer.min.js"></script>
    <script type="text/javascript" src="layer-v1.8.5/layer/extend/layer.ext.js"></script>
</head>
<body>
    <form id="form1" runat="server">
 
       <div id="imgs" class="imgs">
        <img src="Image/1.jpg" layer-img="Image/1.jpg" alt="图片名">
        <img src="Image/22.jpg" layer-img="Image/22.jpg" alt="图片名">
        <img src="Image/1.jpg" layer-img="Image/1.jpg" alt="图片名">
        <img src="Image/22.jpg" layer-img="Image/22.jpg" alt="图片名">
    </div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <script>
        
        layer.photosPage({
            parent: "#imgs",
            title: "<span style='color:red'>直接获取页面元素包含的所有图片</span>",
            id: 112
        });
    </script>
                 <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
           Text="Button" />
                 <uc1:UserC runat="server" ID="PageSet"   OngetData="UC_getData"/>
    </form>
</body>
</html>