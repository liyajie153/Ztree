<%@ WebHandler Language="C#" Class="asyncData" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;

public class asyncData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        if (context.Request["id"] == null)
        {
            System.Collections.Generic.List<role> list = new List<role>();
            list.Add(new role() { id = 1, name = "lyj", prId = 0, open = false, cked = true, isParent = true, url = "http://www.baidu.com", target = "_self" });
            list.Add(new role() { id = 2, name = "lyj2", prId = 1, open = true, cked = true, isParent = false,url = "Default3.aspx", target = "_self" });
            list.Add(new role() { id = 3, name = "lyj23", prId = 1, open = true, cked = true, isParent = false });
            //list.Add(new role() { id = 4, name = "lyj33", prId = 3, open = true, cked = true, leaf = 1 });
            //list.Add(new role() { id = 5, name = "lyj43", prId = 3, open = true, cked = false, leaf = 1 });
            JavaScriptSerializer js = new JavaScriptSerializer();
            // string s = "[{ id:1, pId:0, name:'随意勾选 1', open:true}]";
            string str = js.Serialize(list);
            context.Response.Write(str);
        }
        else 
        {
             
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
        public bool isParent { get; set; }
        public string url { get; set; }
        public string target { get; set; }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}