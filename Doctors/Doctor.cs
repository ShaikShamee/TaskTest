using Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Doctors
{
    public class Doctor : AdminSite, IDoctor,IDoctorSal
    {
        public int DID;
        public string DName;
        public double Dphonenumber;
        public int DAge;
        public string DAddress;
        public string DDesignation;
        public int DSalary;
        public int DFee;
       public void GetDoctorSalary()
        {
            Console.WriteLine("Salary is:"+ DSalary);
        }

        public void GetDoctorsDetails()
        {
            
            Console.WriteLine("DoctorID:" + DID + "\n" + "DoctorName:" + DName + "\n" + "DoctorNumber:" + Dphonenumber + "\n" + "DoctorAge" + DAge + "\n" + "Doctor Loc:" + DAddress + "\n" + "Doctor Designation" + DDesignation);

         
        }

        public int GetTotalSalary()
        {
            int Total = DSalary * DFee;
            return Total;
            
        }
    }
}
