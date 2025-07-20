-- =============================================
-- Certificate Table
-- =============================================

-- Select All Certificates
CREATE PROCEDURE sp_SelectCertificate
AS
BEGIN
    SELECT Cer_ID, Name, Provider, Field
    FROM dbo.Certificate;
END;

-- Insert New Certificate
CREATE PROCEDURE sp_InsertCertificate
    @Name NVARCHAR(255),
    @Provider NVARCHAR(255),
    @Field NVARCHAR(255) = NULL
AS
BEGIN
    INSERT INTO dbo.Certificate (Name, Provider, Field)
    VALUES (@Name, @Provider, @Field);
END;

-- Test Insert
-- EXEC sp_InsertCertificate
--     @Name = 'Test Certificate',
--     @Provider = 'Test Provider',
--     @Field = 'IT';

EXEC sp_SelectCertificate;


-- =============================================
-- Company Table
-- =============================================

-- Select All Companies
CREATE PROCEDURE sp_SelectCompany
AS
BEGIN
    SELECT C_ID, Name, Scope
    FROM dbo.Company;
END;
GO

-- Insert New Company
CREATE PROCEDURE sp_InsertCompany
    @Name NVARCHAR(255),
    @Scope NVARCHAR(255) = NULL
AS
BEGIN
    INSERT INTO dbo.Company (Name, Scope)
    VALUES (@Name, @Scope);
END;
GO

-- Test Insert
-- EXEC sp_InsertCompany 
--     @Name = 'Apple', 
--     @Scope = 'International';

EXEC sp_SelectCompany;


-- =============================================
-- Department Table
-- =============================================

-- Select All Departments
CREATE PROCEDURE sp_SelectDepartment
AS
BEGIN
    SELECT D_ID, Dept_Name
    FROM dbo.Department;
END;

-- Insert New Department
CREATE PROCEDURE sp_InsertDepartment
    @Dept_Name NVARCHAR(255)
AS
BEGIN
    INSERT INTO dbo.Department (Dept_Name)
    VALUES (@Dept_Name);
END;

-- Test Insert
EXEC sp_InsertDepartment
    @Dept_Name = 'HR Department';

EXEC sp_SelectDepartment;


-- =============================================
-- Course Table
-- =============================================

-- Get All Courses
CREATE PROCEDURE Get_All_Courses
AS
BEGIN
    SELECT Crs_ID, Name, Hours
    FROM dbo.Course;
END;

-- Insert New Course
CREATE PROCEDURE InsertCourse
    @Name NVARCHAR(255),
    @Hours INT
AS
BEGIN
    INSERT INTO dbo.Course (Name, Hours)
    VALUES (@Name, @Hours);
END;

-- Test Insert
EXEC InsertCourse
    @Name = 'Web Development Basics',
    @Hours = 50;

EXEC Get_All_Courses;


-- =============================================
-- Freelance Platform Table
-- =============================================

-- Get All Freelance Platforms
CREATE PROCEDURE Get_All_Freelance_Platforms
AS
BEGIN
    SELECT F_ID, Name
    FROM dbo.Freelance_Platform;
END;

-- Insert New Freelance Platform
CREATE PROCEDURE Insert_New_Freelance_Platform
    @Name NVARCHAR(255)
AS
BEGIN
    INSERT INTO dbo.Freelance_Platform (Name)
    VALUES (@Name);
END;

-- Test Insert
EXEC Insert_New_Freelance_Platform
    @Name = 'Nafezly';

EXEC Get_All_Freelance_Platforms;


-- =============================================
-- Instructor Table
-- =============================================

-- Get All Instructors
CREATE PROCEDURE Get_All_Instructors
AS
BEGIN
    SELECT Ins_ID, Salary, Hiring_Date, D_ID
    FROM dbo.Instructor;
END;

-- Insert New Instructor
ALTER PROCEDURE Insert_New_Instructor
    @Ins_ID INT,
    @Salary INT,
    @Hiring_Date DATE = NULL,
    @D_ID INT
AS
BEGIN
    INSERT INTO dbo.Instructor (Ins_ID, Salary, Hiring_Date, D_ID)
    VALUES (@Ins_ID, @Salary, @Hiring_Date, @D_ID);
END;

-- Test Insert
EXEC Insert_New_Instructor 
    @Ins_ID = 101,
    @Salary = 7500,
    @Hiring_Date = '2025-06-05',
    @D_ID = 2;

EXEC Get_All_Instructors;


-- =============================================
-- Person Table
-- =============================================

-- Get All Persons
CREATE PROCEDURE Get_All_Persons
AS
BEGIN
    SELECT P_ID, SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate, Degree, Type
    FROM dbo.Person;
END;

-- Insert New Person
CREATE PROCEDURE Insert_New_Person
    @SSN BIGINT,
    @Fname NVARCHAR(255),
    @Lname NVARCHAR(255),
    @Email NVARCHAR(255),
    @Marital_Status NVARCHAR(255),
    @City NVARCHAR(255),
    @Street NVARCHAR(255) = NULL,
    @Gender NVARCHAR(255),
    @Bdate DATE,
    @Degree NVARCHAR(255),
    @Type VARCHAR(20)
AS
BEGIN
    INSERT INTO dbo.Person (SSN, Fname, Lname, Email, Marital_Status, City, Street, Gender, Bdate, Degree, Type)
    VALUES (@SSN, @Fname, @Lname, @Email, @Marital_Status, @City, @Street, @Gender, @Bdate, @Degree, @Type);
END;

-- Test Insert
EXEC Insert_New_Person
    @SSN = 1234567890123,
    @Fname = 'John',
    @Lname = 'Doe',
    @Email = 'john.doe@example.com',
    @Marital_Status = 'Single',
    @City = 'New York',
    @Street = '123 Main St',
    @Gender = 'Male',
    @Bdate = '1990-05-15',
    @Degree = 'Bachelor',
    @Type = 'Student';

EXEC Get_All_Persons;


-- =============================================
-- Student Table
-- =============================================

-- Get All Students
CREATE PROCEDURE Get_All_Students
AS
BEGIN
    SELECT S_ID, T_ID, B_ID, In_ID
    FROM dbo.Student;
END;

-- Insert New Student
CREATE PROCEDURE Insert_New_Student
    @T_ID INT,
    @B_ID INT,
    @In_ID INT
AS
BEGIN
    INSERT INTO dbo.Student (T_ID, B_ID, In_ID)
    VALUES (@T_ID, @B_ID, @In_ID);
END;

EXEC Get_All_Students;


-- =============================================
-- Topic Table
-- =============================================

-- Get All Topics
CREATE PROCEDURE Get_All_Topics
AS
BEGIN
    SELECT Crs_ID, Name
    FROM dbo.Topic;
END;

-- Insert New Topic
CREATE PROCEDURE Insert_New_Topic
    @Crs_ID INT,
    @Name NVARCHAR(255)
AS
BEGIN
    INSERT INTO dbo.Topic (Crs_ID, Name)
    VALUES (@Crs_ID, @Name);
END;

EXEC Get_All_Topics;


-- =============================================
-- Person Phone Table
-- =============================================

-- Get All Person Phones
CREATE PROCEDURE Get_All_Person_Phone
AS
BEGIN
    SELECT P_ID, Phone_Number
    FROM dbo.Person_Phone;
END;

-- Insert New Person Phone
CREATE PROCEDURE Insert_New_Person_Phone
    @P_ID INT,
    @Phone_Number VARCHAR(20)
AS
BEGIN
    INSERT INTO dbo.Person_Phone (P_ID, Phone_Number)
    VALUES (@P_ID, @Phone_Number);
END;


-- =============================================
-- Exam Questions Table
-- =============================================

-- Get All Exam Questions
CREATE PROCEDURE Get_All_Exam_Questions
AS
BEGIN
    SELECT EQ_ID, E_ID, Q_ID
    FROM dbo.Exam_Questions;
END;

-- Insert New Exam Question
CREATE PROCEDURE Insert_New_Exam_Question
    @E_ID INT,
    @Q_ID INT
AS
BEGIN
    INSERT INTO dbo.Exam_Questions (E_ID, Q_ID)
    VALUES (@E_ID, @Q_ID);
END;


-- =============================================
-- Question Choices Table
-- =============================================

-- Get All Question Choices
CREATE PROCEDURE Get_All_Question_Choices
AS
BEGIN
    SELECT Q_ID, Choice
    FROM dbo.Question_Choices;
END;

-- Insert New Question Choice
CREATE PROCEDURE Insert_New_Question_Choice
    @Q_ID INT,
    @Choice NVARCHAR(255)
AS
BEGIN
    INSERT INTO dbo.Question_Choices (Q_ID, Choice)
    VALUES (@Q_ID, @Choice);
END;


-- =============================================
-- Track Table
-- =============================================

-- Get All Tracks
CREATE PROCEDURE Get_All_Tracks
AS
BEGIN
    SELECT T_ID, Name, D_ID
    FROM dbo.Track;
END;

-- Insert New Track
CREATE PROCEDURE Insert_New_Track
    @Name NVARCHAR(255),
    @D_ID INT
AS
BEGIN
    INSERT INTO dbo.Track (Name, D_ID)
    VALUES (@Name, @D_ID);
END;


-- =============================================
-- Branch Table
-- =============================================

-- Get Branch by ID
CREATE PROCEDURE GetBranchByID
    @B_ID INT
AS
BEGIN
    SELECT B_ID, Name, Location
    FROM dbo.Branch
    WHERE B_ID = @B_ID;
END;

-- Insert New Branch
CREATE PROCEDURE Insert_New_Branch
    @B_ID INT,
    @Name NVARCHAR(255),
    @Location NVARCHAR(255)
AS
BEGIN
    INSERT INTO dbo.Branch (B_ID, Name, Location)
    VALUES (@B_ID, @Name, @Location);
END;

EXEC GetBranchByID @B_ID = 1;


-- =============================================
-- Exam Table
-- =============================================

-- Get Exam by ID
CREATE PROCEDURE GetExamByID
    @E_ID INT
AS
BEGIN
    SELECT E_ID, Date, Num_of_TF, Num_of_MCQ, Crs_id, Ins_ID
    FROM dbo.Exam
    WHERE E_ID = @E_ID;
END;

-- Insert New Exam
ALTER PROCEDURE Insert_New_Exam
    @Date DATE,
    @Num_of_TF INT,
    @Num_of_MCQ INT,
    @Crs_id INT,
    @Ins_ID INT
AS
BEGIN
    INSERT INTO dbo.Exam (Date, Num_of_TF, Num_of_MCQ, Crs_id, Ins_ID)
    VALUES (@Date, @Num_of_TF, @Num_of_MCQ, @Crs_id, @Ins_ID);
END;

-- Optional: Check Constraint Info
SELECT definition
FROM sys.check_constraints
WHERE name = 'Check_Questions_Sum';


-- =============================================
-- Intake Table
-- =============================================

-- Get All Intakes
CREATE PROCEDURE Get_All_Intakes
AS
BEGIN
    SELECT In_ID, Start_Date, End_Date, Type
    FROM dbo.Intake;
END;

EXEC Get_All_Intakes;

-- Insert New Intake
CREATE PROCEDURE Insert_New_Intake
    @In_ID INT,
    @Start_Date DATE,
    @End_Date DATE,
    @Type NVARCHAR(10)
AS
BEGIN
    INSERT INTO dbo.Intake (In_ID, Start_Date, End_Date, Type)
    VALUES (@In_ID, @Start_Date, @End_Date, @Type);
END;