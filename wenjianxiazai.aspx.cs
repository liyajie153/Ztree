using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class wenjianxiazai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      string s1=  HttpUtility.HtmlEncode("李亚杰");
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FileStream fileStream = new FileStream(Server.MapPath("~/Global.asax"), FileMode.Open);
        long fileSize = fileStream.Length;
        byte[] fileBuffer = new byte[fileSize];
        fileStream.Read(fileBuffer, 0, (int)fileSize);
        //如果不写fileStream.Close()语句，用户在下载过程中选择取消，将不能再次下载
        fileStream.Close();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(Server.MapPath("~/Global.asax"), System.Text.Encoding.UTF8));
        Response.AddHeader("Content-Length", fileSize.ToString());
        Response.BinaryWrite(fileBuffer);
        Response.Flush();
        Response.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string filePath = Server.MapPath("~/Global.asax");
        string fileName = HttpContext.Current.Server.UrlEncode("Global.asax");   
        FileInfo fileinfo = new FileInfo(filePath);
        if (fileinfo.Exists)
        {
            const long size = 102400;         //指定下载块的大小   
            byte[] by = new byte[size]; //建立一个100kb的缓存去大小   
            long dataread = 0;          //已读的字节数   
            try
            {
                //打开文件     
                FileStream filestream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                dataread = filestream.Length;//文件总的大小   
                int i = 0;
                //添加Http头   
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachement;filename=" + fileName);
                Response.AddHeader("Content-Length", dataread.ToString());
                while (dataread > 0)
                {
                    if (Response.IsClientConnected)
                    {
                        int length = filestream.Read(by, 0, Convert.ToInt32(size));
                        Response.OutputStream.Write(by, 0, length);
                        Response.Flush();
                        Response.Clear();
                        by = new byte[size];
                        i++;
                        dataread = dataread - length;//判断是否读取玩 如果读取完就跳出while循环   
                    }
                    else
                    {
                        dataread = -1;//客户端已经失去连接中段操作   
                    }
                    //filestream.Close();   
                    //Response.Close();就是多写这行代码 导致下载文件只有100kb   
                }
            }
            catch { }

        }   
    }
}