<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        List<role> list = new List<role>();
        list.Add(new role() { id = 1, name = "lyj1", prId = 0, open = true, cked = true,iconSkin="pIcon01" });
        list.Add(new role() { id = 2, name = "lyj2", prId = 1, open = true, cked = true });
        list.Add(new role() { id = 3, name = "lyj23", prId = 1, open = true, cked = true });
        list.Add(new role() { id = 4, name = "lyj33", prId = 3, open = true, cked = true });
        list.Add(new role() { id = 5, name = "lyj43", prId = 3, open = true, cked = false });
        JavaScriptSerializer js = new JavaScriptSerializer();
       // string s = "[{ id:1, pId:0, name:'随意勾选 1', open:true}]";
        string str = js.Serialize(list);
        context.Response.Write(str);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    [Serializable] 
    public class role
    {
        public int id { get; set; }
        public int prId { get; set; }
        public string name{get;set;}
        public bool open { get; set;}
        public bool cked { get; set; }
        public string iconSkin { get; set; }
    }
}