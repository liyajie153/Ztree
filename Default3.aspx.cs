using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string file = "文件上（传   篇.doc";
        string Server_UrlEncode = Server.UrlEncode(file);
        string Server_UrlDecode = Server.UrlDecode(Server_UrlEncode);
        string HttpUtility_UrlEncode = System.Web.HttpUtility.UrlEncode(file);
        string HttpUtility_UrlDecode = System.Web.HttpUtility.UrlDecode(HttpUtility_UrlEncode);
        Response.Write("原数据：" + file);
        Response.Write("<br/>Server.UrlEncode：" + Server_UrlEncode);
        Response.Write("<br/>nServer.UrlDecode：" + Server_UrlDecode);
        Response.Write("<br/>nHttpUtility.UrlEncode：" + HttpUtility_UrlEncode);
        Response.Write("<br/>nHttpUtility.UrlDecode：" + HttpUtility_UrlDecode);
    }
}