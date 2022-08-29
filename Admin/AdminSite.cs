using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Admin
{
    public class AdminSite
    {
        public int AID;
        public string UserName;
        public string Password;
        public void AdminPage()
        {
            Console.WriteLine("Welcome Admin Page:"+ UserName);
        }
    }
}
