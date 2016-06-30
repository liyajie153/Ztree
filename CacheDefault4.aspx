<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CacheDefault4.aspx.cs" Inherits="CacheDefault4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <p>Key1 的缓存内容：<%= HttpRuntime.Cache["key1"] %></p>
    <hr />
        
    <form id="form1" runat="server">
        <input type="submit" name="SetKey1Cache" value="设置Key1的值" />
        <input type="submit" name="SetKey2Cache" value="设置Key2的值" />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        style="width: 62px" Text="Button" />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Button" />
    </form>
</body>
</html>
