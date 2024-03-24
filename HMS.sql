create database HMS

use HMS

--Patient table u ekzekutua

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY NOT NULL,
    Patient_Fname VARCHAR(50) NOT NULL,
    Patient_Lname VARCHAR(50) NOT NULL,
    Blood_type VARCHAR(10),
    Email VARCHAR(100),
    Gender VARCHAR(10),
    Condition VARCHAR(255),
    Admission_Date DATE NOT NULL,
    Discharge_Date DATE,
    Phone VARCHAR(20)
);

--====================================

--Tabela Stafi  u ekzekutua

CREATE TABLE Staff ( 
    Emp_ID INT PRIMARY KEY NOT NULL,
    Emp_Fname VARCHAR(50) NOT NULL,
    Emp_Lname VARCHAR(50) NOT NULL,
    Joining_Date DATE NOT NULL,
    Emp_type VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(255),
    Dept_ID INT,
    SSN VARCHAR(20),
    DOB DATE,
    Date_Separation DATE,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);


--============================
--Tabela Doktori  u ekzekutua

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY NOT NULL,
    Qualifications VARCHAR(255) NOT NULL,
    Emp_ID INT NOT NULL,
    Specialization VARCHAR(100),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

--============================
--Tabela Nurse

CREATE TABLE Nurse (
    Nurse_ID INT PRIMARY KEY NOT NULL,
    Patient_ID INT NOT NULL,
    Emp_ID INT NOT NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

-----=============================
--tabela Room

CREATE TABLE Room (
    Room_ID INT PRIMARY KEY AUTO_INCREMENT,
    Room_type VARCHAR(20) NOT NULL,
    Patient_ID INT,
    Room_cost DECIMAL(10, 2),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

--===================================================

--Tabela Medicine 

CREATE TABLE Medicine (
    Medicine_ID INT PRIMARY KEY NOT NULL,
    M_name VARCHAR(100) NOT NULL,
    M_Quantity INT NOT NULL,
    M_Cost DECIMAL(10, 2) NOT NULL
);


--========================================
--tabela insurance  u ekzekutua

CREATE TABLE Insurance (
    Policy_Number VARCHAR(20) PRIMARY KEY NOT NULL,
    Patient_ID INT NOT NULL,
    Ins_Code VARCHAR(10) NOT NULL,
    End_Date DATE,
    Provider VARCHAR(100) NOT NULL,
    Plan VARCHAR(100) NOT NULL,
    Co_Pay DECIMAL(10, 2),
    Coverage VARCHAR(255),
    Maternity BOOLEAN,
    Dental BOOLEAN,
    Optical BOOLEAN,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


--==========================================================
--Tabela BILL

CREATE TABLE BILL (
    Payment_ID INT PRIMARY KEY NOT NULL,
    Date DATE NOT NULL,
    Room_cost DECIMAL(10, 2),
    Other_charges DECIMAL(10, 2),
    M_Cost DECIMAL(10, 2),
    Total DECIMAL(10, 2) NOT NULL,
    Patient_ID INT NOT NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Room_cost) REFERENCES Room(Room_cost),
    FOREIGN KEY (M_Cost) REFERENCES Medicine(M_Cost)
);
--===========================================================
--tabela Prescription 

CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY NOT NULL,
    Patient_ID INT NOT NULL,
    Date DATE NOT NULL,
    Dosage VARCHAR(100) NOT NULL,
    Doctor_ID INT NOT NULL,
    Medicine_ID INT NOT NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID)
);

--=====================================================================
--tabela Appointment

CREATE TABLE Appointment (
    Appoint_ID INT PRIMARY KEY NOT NULL,
    Scheduled_On DATE NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Doctor_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

--========================================================================
--tabela Department   u ekzekutua

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY NOT NULL,
    Dept_head VARCHAR(100),
    Dept_name VARCHAR(100) NOT NULL,
    Emp_Count INT
);


--=========================================================================
--Tabela Payroll

CREATE TABLE Payroll (
    Account_no INT PRIMARY KEY,
    Salary DECIMAL(10, 2) NOT NULL,
    Bonus DECIMAL(10, 2),
    Emp_ID INT NOT NULL,
    IBAN VARCHAR(50),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);


-- =====================================================
--Tabela Emergency_contact

CREATE TABLE Emergency_contact (
    Contact_ID INT PRIMARY KEY,
    Contact_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Relation VARCHAR(50) NOT NULL,
    Patient_ID INT NOT NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


--==================================
--Tablea Medical History

CREATE TABLE Medical_History (
    Record_ID INT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Allergies VARCHAR(255),
    Pre_Conditions VARCHAR(255),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


--======================================
--tabela Lab Screeining  u ekzekutua

CREATE TABLE Lab_Screening (
    Lab_ID INT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Technician_ID INT,
    Doctor_ID INT,
    Test_Cost DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);
