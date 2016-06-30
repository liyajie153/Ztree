using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class img : System.Web.UI.Page
{
    public void UC_getData(string s) 
    {
        Label1.Text = s;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        PageSet.OnPageChange("李亚杰点击用户控件");
    }
}