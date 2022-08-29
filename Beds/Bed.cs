using Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Beds
{
    public class Bed : AdminSite, IBed
    {
        public int BID;
        public int BNumber;
        public void GetBedNumber()
        {
            Console.WriteLine("Bed Number:"+BNumber);
        }
        public void GetBedDetails()
        {
            Console.WriteLine("BedId"+BID+"\n"+"BedNumber"+BNumber);
        }
    }
}
