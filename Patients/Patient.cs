using Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Patients
{
    public class Patient:AdminSite,IPatient
    {
        public int PID;
        public string PName;
        public double pphonenumber;
        public int PAge;
        public string PAddress;
        public int PFee;
        public void GetPatientData()
        {
            Console.WriteLine("PatientID:" + PID + "\n" + "PatientName:" + PName + "\n" + "PatientNumber:" +pphonenumber+ "\n" + "PatientAge:" + PAge + "\n" + "Patients Loc:" + PAddress);
        }

        public void GetPatientFee()
        {
            Console.WriteLine("Price" + PFee);
        }
    }
}
