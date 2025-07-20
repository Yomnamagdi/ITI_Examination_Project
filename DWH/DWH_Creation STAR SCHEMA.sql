CREATE DATABASE ITI_EXAMINTAION_DWH

USE ITI_EXAMINTAION_DWH
CREATE TABLE Fact_Student_Exam_Performance (
    Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_Key INT NOT NULL,
    Exam_Key INT NOT NULL,
    Track_Key INT NOT NULL,
    Branch_Key INT NOT NULL,
    Intake_Key INT NOT NULL,
    Date_Key INT NOT NULL,
	Instructor_Key INT NOT NULL,
	Department_Key INT NOT NULL,
	Course_Key INT NOT NULL,
    
    
    Exam_Score FLOAT,
    Pass_Fail_Status NVARCHAR(10),
    Is_Graduated BIT,
    Number_Of_Certificates_Earned INT,
    Salary_After_Graduation DECIMAL(10,2),

    
    FOREIGN KEY (Student_Key) REFERENCES Dim_Student(Student_Key),
    FOREIGN KEY (Exam_Key) REFERENCES Dim_Exam(Exam_Key),
    FOREIGN KEY (Track_Key) REFERENCES Dim_Track(Track_Key),
    FOREIGN KEY (Branch_Key) REFERENCES Dim_Branch(Branch_Key),
    FOREIGN KEY (Intake_Key) REFERENCES Dim_Intake(Intake_Key),
    FOREIGN KEY (Date_Key) REFERENCES Dim_Date(Date_Key),
    FOREIGN KEY (Instructor_Key) REFERENCES Dim_Instructor(Instructor_Key),
    FOREIGN KEY (Department_Key) REFERENCES Dim_Department(Department_Key),
    FOREIGN KEY (Course_Key) REFERENCES Dim_Course(Course_Key)




);



CREATE TABLE Dim_Student (
    Student_Key INT IDENTITY(1,1) PRIMARY KEY,
    S_ID INT NOT NULL,
    Full_Name NVARCHAR(510) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
	Gender NVARCHAR(10) NOT NULL,
    Age INT,
    City NVARCHAR(255),
    Degree NVARCHAR(255),

    
    Valid_From DATETIME NOT NULL DEFAULT GETDATE(),
    Valid_To DATETIME,
    Is_Current BIT NOT NULL DEFAULT 1
);


CREATE TABLE Dim_Exam (
    Exam_Key INT IDENTITY(1,1) PRIMARY KEY,
    E_ID INT NOT NULL,
    Course_Name NVARCHAR(255) NOT NULL,
    Instructor_Name NVARCHAR(255),
    Exam_Date DATE NOT NULL
);

CREATE TABLE Dim_Track (
    Track_Key INT IDENTITY(1,1) PRIMARY KEY,
    T_ID INT NOT NULL,
    Track_Name NVARCHAR(255) NOT NULL,
    Department_Name NVARCHAR(255)
);

CREATE TABLE Dim_Branch (
    Branch_Key INT IDENTITY(1,1) PRIMARY KEY,
    B_ID INT NOT NULL,
    Branch_Name NVARCHAR(255) NOT NULL,
    Location NVARCHAR(255)
);

CREATE TABLE Dim_Intake (
    Intake_Key INT IDENTITY(1,1) PRIMARY KEY,
    In_ID INT NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Intake_Type NVARCHAR(10) NOT NULL
);

CREATE TABLE Dim_Date (
    Date_Key INT PRIMARY KEY, -- Format: YYYYMMDD
    Full_Date DATE NOT NULL,
    Day INT NOT NULL,
    Month INT NOT NULL,
    Year INT NOT NULL,
    Day_Name NVARCHAR(20),
    Month_Name NVARCHAR(20),
    Quarter INT
);

CREATE TABLE Dim_Instructor (
    Instructor_Key INT IDENTITY(1,1) PRIMARY KEY,
    Ins_ID INT,
    FullName NVARCHAR(255),
    Gender NVARCHAR(50),
    Email NVARCHAR(255),
    Department_Name NVARCHAR(255),
    Salary INT,
    Hiring_Date DATE
);
CREATE TABLE Dim_Department (
    Department_Key INT IDENTITY(1,1) PRIMARY KEY,
    D_ID INT,
    Department_Name NVARCHAR(255)
);

CREATE TABLE Dim_Course(
Course_Key INT IDENTITY(1,1) PRIMARY KEY,
    Crs_ID INT,
    Course_Name NVARCHAR(255),
    Hours INT
);


