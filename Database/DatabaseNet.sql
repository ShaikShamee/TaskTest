use Hospital

Create Table Admin_Tables (AID int primary key,UserName varchar(50),password varchar(50))
Create Table Doctors_Tables(DID int primary key ,DName varchar(100),Dphonenumber varchar(100),DAge int,DMail varchar(100),DAddress varchar(100),DDesignation varchar(50),DSalary  int) 
Create Table Patients_Table(PID int,PName varchar(100) primary key,Pphonenumber varchar(100) ,PAge int,PAddress varchar(100),PFee int)
Create Table BookBed_Tables(BID int,BNumber int)


Insert Doctors_Tables  Values (1,'Seema','7869056432',25, 'seema123@gmail.com', 'Hyd','Cardilogy', 25000);
Insert Doctors_Tables Values (2,'Raju','7869056432',25, 'raju123@gmail.com', 'Andhra','Pediatrics', 35000);
Insert Doctors_Tables Values (3,'Ravi','7869056432',25, 'ravi123@gmail.com', 'Chennai','Neurology', 45000);
Insert Doctors_Tables Values (4,'Sreenu','7869056432',25, 'sreenu123@gmail.com', 'Hyd', 'Dermatology',55000);
Insert Doctors_Tables Values (5,'Sharma','7869056432',25, 'sharma123@gmail.com', 'Andhra','Orthopedics', 15000);
Insert Doctors_Tables Values (6,'Veena','7869056432',25, 'veena123@gmail.com', 'Bengalarulu','General Surgeon', 20000);

Insert Patients_Table  Values (100,'sailaja','7890654323',78,'bengalauru',75000);
Insert Patients_Table Values (101,'Sharma','7890654323',68,'hyd',45000);
Insert Patients_Table Values (102,'Vani','7890654323',45,'andhra',65000);
Insert Patients_Table Values (103,'jhansi','7890654323',65,'vizag',85000);
Insert Patients_Table Values (104,'Vami','7890654323',56,'Guntur',65000);
Insert Patients_Table Values (105,'Vemuka','7890654323',35,'Chennai',55000);

Insert BookBed_Tables  Values (1,203);
Insert BookBed_Tables Values (2,205);
Insert BookBed_Tables Values (3,400);
Insert BookBed_Tables Values (4,500);
Insert BookBed_Tables Values (5,600);
Insert BookBed_Tables Values (6,800);

Create Procedure SP_DoctorsData
(  
   @DID  int,  
   @DName VARCHAR(100),  
   @Dphonenumber VARCHAR(100),  
   @DAge int,  
   @DMail VARCHAR(10), 
   @DAddress VARCHAR(20) ,
   @DDesignation varchar(100),
   @DSalary int,
   @ActionType nvarchar(20) 
)  
AS  
BEGIN  
	IF @ActionType = 'Insert'  
	BEGIN  
		Insert into Doctors_Tables(DName,Dphonenumber,DAge,DMail,DAddress,DDesignation,DSalary) values(@DName,@Dphonenumber,@DAge,@DMail,@DAddress,@DDesignation,@DSalary)  
	END  
	IF @ActionType = 'Select'  
	BEGIN  
		Select * from Doctors_Tables
	END  
	IF @ActionType = 'Update'  
	BEGIN  
		UPDATE Doctors_Tables SET  
			DName=@DName,
			Dphonenumber=@Dphonenumber,
			DAge=@DAge,
			DMail=@DMail,
			DAddress=@DAddress,
			DDesignation=@DDesignation,
			DSalary=@DSalary
		WHERE DID = @DID  
	END  
	IF @ActionType = 'Delete'  
	BEGIN  
		Delete from Doctors_Tables Where DID = @DID
	END  
END


Create Procedure SP_PatientsData
(  
   @PID  int,  
   @PName VARCHAR(100),  
   @Pphonenumber VARCHAR(100),  
   @PAge int,  
   @PAddress VARCHAR(20) ,
   @PFee int,
   @ActionType nvarchar(20) 
)  
AS  
BEGIN  
	IF @ActionType = 'Insert'  
	BEGIN  
		Insert into Patients_Table(PName,Pphonenumber,PAge,PAddress,PFee) values(@PName,@Pphonenumber,@PAge,@PAddress,@PFee)  
	END  
	IF @ActionType = 'Select'  
	BEGIN  
		Select * from Patients_Table
	END  
	IF @ActionType = 'Update'  
	BEGIN  
		UPDATE Patients_Table SET  
			PName=@PName,
			Pphonenumber=@Pphonenumber,
			PAge=@PAge,
   		    PAddress=@PAddress,
			PFee=@PFee
		WHERE PID = @PID  
	END  
	IF @ActionType = 'Delete'  
	BEGIN  
		Delete from Patients_Table Where PID = @PID
	END  
END


Create Procedure SP_BedData
(  
   @BID  int,  
   @BNumber int,
   @ActionType nvarchar(20) 
)  
AS  
BEGIN  
	IF @ActionType = 'Insert'  
	BEGIN  
		Insert into BookBed_Tables(BID,BNumber) values(@BID,@BNumber)  
	END  
	IF @ActionType = 'Select'  
	BEGIN  
		Select * from BookBed_Tables
	END  
	IF @ActionType = 'Update'  
	BEGIN  
		UPDATE BookBed_Tables SET  
		BID=@BID,
		BNumber=@BNumber
		WHERE BID = @BID 
	END  
	IF @ActionType = 'Delete'  
	BEGIN  
		Delete from BookBed_Tables Where BID = @BID
	END  
END


---Doctor Triggers:
CREATE TABLE DoctorsLog (
	LogID int IDENTITY(1,1) NOT NULL,
	DID int NOT NULL,
	Operation nvarchar(10) NOT NULL,
	UpdatedDate Datetime NOT NULL	
)

CREATE TRIGGER Doctor_InsertTrigger
ON  Doctors_Tables
FOR INSERT	
AS
    INSERT INTO DoctorsLog(DID, Operation, UpdatedDate)
    SELECT DID ,'INSERT',GETDATE() FROM INSERTED;

CREATE TRIGGER Doctor_UpdateTrigger
ON Doctors_Tables
AFTER UPDATE
AS
    INSERT INTO DoctorsLog(DID, Operation, UpdatedDate)
    SELECT DID,'UPDATE', GETDATE() FROM DELETED;

CREATE TRIGGER Doctor_DeleteTrigger
ON Doctors_Tables
INSTEAD OF DELETE
AS
    INSERT INTO DoctorsLog(DID, Operation, UpdatedDate)
    SELECT DID,'DELETE', GETDATE() FROM DELETED;

	--Patient Trigger
CREATE TABLE PatientLog (
	LogID int IDENTITY(1,1) NOT NULL,
	PID int NOT NULL,
	Operation nvarchar(10) NOT NULL,
	UpdatedDate Datetime NOT NULL	
)

CREATE TRIGGER Patient_InsertTrigger
ON  Patients_Table
FOR INSERT	
AS
    INSERT INTO PatientLog(PID, Operation, UpdatedDate)
    SELECT PID ,'INSERT',GETDATE() FROM INSERTED;

CREATE TRIGGER Patient_UpdateTrigger
ON Patients_Table
AFTER UPDATE
AS
    INSERT INTO PatientLog(PID, Operation, UpdatedDate)
    SELECT PID,'UPDATE', GETDATE() FROM DELETED;

CREATE TRIGGER Patient_DeleteTrigger
ON Patients_Table
INSTEAD OF DELETE
AS
    INSERT INTO PatientLog(PID, Operation, UpdatedDate)
    SELECT PID,'DELETE', GETDATE() FROM DELETED;
CREATE TABLE BookbedLog (
	LogID int IDENTITY(1,1) NOT NULL,
	BID int NOT NULL,
	Operation nvarchar(10) NOT NULL,
	UpdatedDate Datetime NOT NULL	
)

CREATE TRIGGER BookBed_InsertTrigger
ON  BookBed_Tables
FOR INSERT	
AS
    INSERT INTO BookbedLog(BID, Operation, UpdatedDate)
    SELECT BID ,'INSERT',GETDATE() FROM INSERTED;

CREATE TRIGGER BookBed_UpdateTrigger
ON BookBed_Tables
AFTER UPDATE
AS
    INSERT INTO BookbedLog(BID, Operation, UpdatedDate)
    SELECT BID,'UPDATE', GETDATE() FROM DELETED;

CREATE TRIGGER BookBed_DeleteTrigger
ON BookBed_Tables
INSTEAD OF DELETE
AS
    INSERT INTO BookbedLog(BID, Operation, UpdatedDate)
    SELECT BID,'DELETE', GETDATE() FROM DELETED;
