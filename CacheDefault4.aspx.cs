using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

public partial class CacheDefault4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
       // HttpContext.Current.Cache.Insert("key", "123");
    }
    //[submitMethod(AutoRedirect = true)]
    private void SetKey1Cache()
    {
        SetKey2Cache();

        CacheDependency dep = new CacheDependency(null, new string[] { "key2" });
        HttpRuntime.Cache.Insert("key1", DateTime.Now.ToString(), dep,
                                    Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration);
    }

   // [SubmitMethod(AutoRedirect = true)]
    private void SetKey2Cache()
    {
        HttpRuntime.Cache.Insert("key2", Guid.NewGuid().ToString());
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SetKey1Cache();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SetKey2Cache();
    }
}