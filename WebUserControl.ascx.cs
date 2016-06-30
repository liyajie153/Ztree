using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
     public delegate void DataBind(string str);
    public event DataBind getData;
    public void OnPageChange(string psStr)
    {
        if (getData != null)
        {
            getData(psStr);
        }
    }
}