create database HMS

use HMS

create table Patient(
Patient_ID int primary key not null,
Patient_Fname varchar(30) not null,
Patient_Lname varchar(30) not null,
Blood_Type varchar(30) not null,
Email varchar(30) not null,
Gender varchar(30) not null,
Condition varchar(30) not null,
Admission_Date date not null,
Discharge_Date date not null,
Phone varchar(20) not null
)


create table Staff(
Emp_ID int primary key not null,
Emp_FName varchar(30) not null,
Emp_LName varchar(30) not null,
Joining_date date not null,
Emp_type varchar(30) not null,
Email varchar(30) not null,
Address varchar(30) not null,
Dept_ID int not null,
SSN varchar(30) not null,
DOB date not null,
Date_Separation date not null,
)