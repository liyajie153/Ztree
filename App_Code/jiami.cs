using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
///jiami 的摘要说明
/// </summary>
public static class jiami
{
	
        public static string Encode(string str)
        {
            return Encode(str, Encoding.UTF8);
        }


        public static string Encode(string str, Encoding encoding)
        {
            byte[] bytes = encoding.GetBytes(str);
            try
            {
                return Convert.ToBase64String(bytes);
            }
            catch
            {
                return string.Empty;
            }

        }

        public static string Decode(string str, Encoding encoding)
        {
            byte[] outputb = Convert.FromBase64String(str);
            try
            {
                return encoding.GetString(outputb);
            }
            catch
            {
                return string.Empty;
            }
        }

        public static string Decode(string str)
        {
            return Decode(str, Encoding.UTF8);
        }

    
}