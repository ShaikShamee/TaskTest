using Doctors;
using System;
using Patients;

namespace Hospital
{
   public  class HRMS
    {
        static void Main(string[] args)
        {
           
                Console.WriteLine("Enter Doctors to get Doctors Deatils");
                Console.WriteLine("Enter Patients to get Patients Deatils ");
                Console.WriteLine("Enter Beds to get BookBed Deatils");

                string login = Console.ReadLine();

                switch (login)
                {
                    case "Doctors":
                        Doctor doc = new Doctor();
                        IDoctor idoc = new Doctor();
                        IDoctorSal sal = new Doctor();
                        Console.WriteLine("Enter the Admin Details:");
                        Console.WriteLine("Enter the Admin ID:");
                        doc.AID = int.Parse(Console.ReadLine());
                        Console.WriteLine("Enter the UserName:");
                        doc.UserName = Console.ReadLine();
                        Console.WriteLine("Enter the Password :");
                        doc.Password = Console.ReadLine();
                        Console.WriteLine("This is Admin Site");
                        doc.AdminPage();
                        Console.WriteLine("Enter the Doctor Details");
                        Console.WriteLine("Enter the DoctorID:");
                        doc.DID = int.Parse(Console.ReadLine());
                        Console.WriteLine("Enter the DoctorName:");
                        doc.DName = Console.ReadLine();
                        Console.WriteLine("Enter the DoctorNumber:");
                        doc.Dphonenumber =Convert.ToDouble(Console.ReadLine());
                        Console.WriteLine("Enter the Doctor Age:");
                        doc.DAge = int.Parse(Console.ReadLine());
                        Console.WriteLine("Enter the Doctor Address:");
                        doc.DAddress = Console.ReadLine();
                        Console.WriteLine("Enter the Doctor Designation:");
                        doc.DDesignation = Console.ReadLine();
                        Console.WriteLine("Enter the Doctor Salary:");
                        doc.DSalary = int.Parse(Console.ReadLine());
                        doc.GetDoctorsDetails();
                        Console.WriteLine("Get Doctor Salary:");
                        idoc.GetDoctorSalary();
                        Console.WriteLine("Get the Doctor Total Salary:");
                        sal.GetTotalSalary();
                        break;
                case "Patients":
                    Patient p = new Patient();
                    IPatient ip = new Patient();
                    Console.WriteLine("Enter the Admin Details:");
                    Console.WriteLine("Enter the Admin ID:");
                    p.AID = int.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the UserName:");
                    p.UserName = Console.ReadLine();
                    Console.WriteLine("Enter the Password :");
                    p.Password = Console.ReadLine();
                    Console.WriteLine("This is Admin Site");
                    p.AdminPage();
                    Console.WriteLine("Enter the Patients Details");
                    Console.WriteLine("Enter the PatientID:");
                    p.PID= int.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the PatientName:");
                   p.PName = Console.ReadLine();
                    Console.WriteLine("Enter the PatientNumber:");
                   p.pphonenumber = Convert.ToDouble(Console.ReadLine());
                    Console.WriteLine("Enter the Patient Age:");
                    p.PAge = int.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the Patient Address:");
                    p.PAddress = Console.ReadLine();
                    Console.WriteLine("Enter the Patient Fee:");
                    p.PFee= int.Parse(Console.ReadLine());
                    p.GetPatientData();
                    ip.GetPatientFee();
                    break;
                case "Beds":
                    Beds.Bed b = new Beds.Bed();
                    Beds.IBed bd = new Beds.Bed();
                    Console.WriteLine("Enter the Admin Details:");
                    Console.WriteLine("Enter the Admin ID:");
                    b.AID = int.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the UserName:");
                    b.UserName = Console.ReadLine();
                    Console.WriteLine("Enter the Password :");
                    b.Password = Console.ReadLine();
                    Console.WriteLine("This is Admin Site");
                    b.AdminPage();
                    Console.WriteLine("Enter the Bed Details");
                    Console.WriteLine("Enter the BedID:");
                    b.BID= int.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the BedNumber:");
                    b.BNumber = int.Parse(Console.ReadLine());
                    b.GetBedDetails();
                    Console.WriteLine("Get the Bed Number:");
                    bd.GetBedNumber(); 
                    break;
                default:
                    Console.WriteLine("There is no Data Available here");
                    break;

                }
            Console.ReadLine();
            }
        }
}

