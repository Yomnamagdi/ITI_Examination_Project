USE [ITI_Examination_system]
GO

-- ====================================================
--                  Table: Branch                       --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Branch
  @B_ID INT,
  @Location NVARCHAR(255),
  @Name NVARCHAR(255)
AS
BEGIN
  UPDATE Branch
  SET Location = @Location,
    Name = @Name
  WHERE B_ID = @B_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Branch
  @B_ID INT
AS
BEGIN
  DELETE FROM Branch
  WHERE B_ID = @B_ID
END
GO

-- ------------------------------

-- ====================================================
--                 Table: Certificate                  --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Certificate
  @Cer_ID INT,
  @Name NVARCHAR(255),
  @Provider NVARCHAR(255),
  @Field NVARCHAR(255)
AS
BEGIN
  UPDATE Certificate
  SET Name = @Name,
    Provider = @Provider,
    Field = @Field
  WHERE Cer_ID = @Cer_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Certificate
  @Cer_ID INT
AS
BEGIN
  DELETE FROM Certificate
  WHERE Cer_ID = @Cer_ID
END
GO

-- ------------------------------

-- ====================================================
--                   Table: Company                    --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Company
  @C_ID INT,
  @Name NVARCHAR(255),
  @Scope NVARCHAR(255)
AS
BEGIN
  UPDATE Company
  SET Name = @Name,
    Scope = @Scope
  WHERE C_ID = @C_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Company
  @C_ID INT
AS
BEGIN
  DELETE FROM Company
  WHERE C_ID = @C_ID
END
GO

-- ------------------------------

-- ====================================================
--                   Table: Course                     --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Course
  @Crs_ID INT,
  @Name NVARCHAR(255),
  @Hours INT
AS
BEGIN
  UPDATE Course
  SET Name = @Name,
    Hours = @Hours
  WHERE Crs_ID = @Crs_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Course
  @Crs_ID INT
AS
BEGIN
  DELETE FROM Course
  WHERE Crs_ID = @Crs_ID
END
GO

-- ------------------------------

-- ====================================================
--               Table: Course_Instructor              --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Course_Instructor
  @Crs_ID INT,
  @Ins_ID INT,
  @New_Crs_ID INT,
  @New_Ins_ID INT
AS
BEGIN
  UPDATE Course_Instructor
  SET Crs_ID = @New_Crs_ID,
    Ins_ID = @New_Ins_ID
  WHERE Crs_ID = @Crs_ID AND Ins_ID = @Ins_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Course_Instructor
  @Crs_ID INT,
  @Ins_ID INT
AS
BEGIN
  DELETE FROM Course_Instructor
  WHERE Crs_ID = @Crs_ID AND Ins_ID = @Ins_ID
END
GO

-- ------------------------------

-- ====================================================
--                 Table: Department                   --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Department
  @D_ID INT,
  @Dept_Name NVARCHAR(255)
AS
BEGIN
  UPDATE Department
  SET Dept_Name = @Dept_Name
  WHERE D_ID = @D_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Department
  @D_ID INT
AS
BEGIN
  DELETE FROM Department
  WHERE D_ID = @D_ID
END
GO

-- ------------------------------

-- ====================================================
--                Table: Instructor                    --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Instructor
  @Ins_ID INT,
  @Salary INT,
  @Hiring_Date DATE,
  @D_ID INT
AS
BEGIN
  UPDATE Instructor
  SET Salary = @Salary,
    Hiring_Date = @Hiring_Date,
    D_ID = @D_ID
  WHERE Ins_ID = @Ins_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Instructor
  @Ins_ID INT
AS
BEGIN
  DELETE FROM Instructor
  WHERE Ins_ID = @Ins_ID
END
GO

-- ------------------------------

-- ====================================================
--                  Table: Intake                      --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Intake
  @In_ID INT,
  @Start_Date DATE,
  @End_Date DATE,
  @Type NVARCHAR(10)
AS
BEGIN
  UPDATE Intake
  SET Start_Date = @Start_Date,
    End_Date = @End_Date,
    Type = @Type
  WHERE In_ID = @In_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Intake
  @In_ID INT
AS
BEGIN
  DELETE FROM Intake
  WHERE In_ID = @In_ID
END
GO

-- ------------------------------

-- ====================================================
--                   Table: Exam                       --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Exam
  @E_ID INT,
  @Date DATE,
  @Num_of_TF INT,
  @Num_of_MCQ INT,
  @Crs_id INT,
  @Ins_ID INT
AS
BEGIN
  UPDATE Exam
  SET Date = @Date,
    Num_of_TF = @Num_of_TF,
    Num_of_MCQ = @Num_of_MCQ,
    Crs_id = @Crs_id,
    Ins_ID = @Ins_ID
  WHERE E_ID = @E_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Exam
  @E_ID INT
AS
BEGIN
  DELETE FROM Exam
  WHERE E_ID = @E_ID
END
GO

-- ------------------------------

-- ====================================================
--               Table: Exam_Questions                 --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Exam_Questions
  @EQ_ID INT,
  @E_ID INT,
  @Q_ID INT
AS
BEGIN
  UPDATE Exam_Questions
  SET E_ID = @E_ID,
    Q_ID = @Q_ID
  WHERE EQ_ID = @EQ_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Exam_Questions
  @EQ_ID INT
AS
BEGIN
  DELETE FROM Exam_Questions
  WHERE EQ_ID = @EQ_ID
END
GO

-- ------------------------------

-- ====================================================
--             Table: Freelance_Platform               --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Freelance_Platform
  @F_ID INT,
  @Name NVARCHAR(255)
AS
BEGIN
  UPDATE Freelance_Platform
  SET Name = @Name
  WHERE F_ID = @F_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Freelance_Platform
  @F_ID INT
AS
BEGIN
  DELETE FROM Freelance_Platform
  WHERE F_ID = @F_ID
END
GO

-- ------------------------------

-- ====================================================
--                 Table: Graduation                   --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Graduation
  @S_ID INT,
  @IS_Graduated BIT,
  @Graduation_date DATE
AS
BEGIN
  UPDATE Graduation
  SET IS_Graduated = @IS_Graduated,
    Graduation_date = @Graduation_date
  WHERE S_ID = @S_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Graduation
  @S_ID INT
AS
BEGIN
  DELETE FROM Graduation
  WHERE S_ID = @S_ID
END
GO

-- ------------------------------

-- ====================================================
--                  Table: Person                      --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Person
  @P_ID INT,
  @SSN BIGINT,
  @Fname NVARCHAR(255),
  @Lname NVARCHAR(255),
  @Email NVARCHAR(255),
  @Marital_Status NVARCHAR(255),
  @City NVARCHAR(255),
  @Street NVARCHAR(255),
  @Gender NVARCHAR(255),
  @Bdate DATE,
  @Degree NVARCHAR(255),
  @Type VARCHAR(20)
AS
BEGIN
  UPDATE Person
  SET SSN = @SSN,
    Fname = @Fname,
    Lname = @Lname,
    Email = @Email,
    Marital_Status = @Marital_Status,
    City = @City,
    Street = @Street,
    Gender = @Gender,
    Bdate = @Bdate,
    Degree = @Degree,
    Type = @Type
  WHERE P_ID = @P_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Person
  @P_ID INT
AS
BEGIN
  DELETE FROM Person
  WHERE P_ID = @P_ID
END
GO

-- ------------------------------

-- ====================================================
--               Table: Person_Phone                   --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Person_Phone
  @P_ID INT,
  @Phone_Number VARCHAR(20),
  @New_Phone_Number VARCHAR(20)
AS
BEGIN
  UPDATE Person_Phone
  SET Phone_Number = @New_Phone_Number
  WHERE P_ID = @P_ID AND Phone_Number = @Phone_Number
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Person_Phone
  @P_ID INT,
  @Phone_Number VARCHAR(20)
AS
BEGIN
  DELETE FROM Person_Phone
  WHERE P_ID = @P_ID AND Phone_Number = @Phone_Number
END
GO

-- ------------------------------

-- ====================================================
--                 Table: Question                     --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Question
  @Q_ID INT,
  @Q_Text NVARCHAR(255),
  @Q_Answer NVARCHAR(255),
  @Type NVARCHAR(255),
  @Crs_id INT
AS
BEGIN
  UPDATE Question
  SET Q_Text = @Q_Text,
    Q_Answer = @Q_Answer,
    Type = @Type,
    Crs_id = @Crs_id
  WHERE Q_ID = @Q_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Question
  @Q_ID INT
AS
BEGIN
  DELETE FROM Question
  WHERE Q_ID = @Q_ID
END
GO

-- ------------------------------

-- ====================================================
--            Table: Question_Choices                  --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Question_Choices
  @Q_ID INT,
  @Choice NVARCHAR(255),
  @New_Choice NVARCHAR(255)
AS
BEGIN
  UPDATE Question_Choices
  SET Choice = @New_Choice
  WHERE Q_ID = @Q_ID AND Choice = @Choice
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Question_Choices
  @Q_ID INT,
  @Choice NVARCHAR(255)
AS
BEGIN
  DELETE FROM Question_Choices
  WHERE Q_ID = @Q_ID AND Choice = @Choice
END
GO

-- ------------------------------

-- ====================================================
--                 Table: Student                      --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Student
  @S_ID INT,
  @T_ID INT,
  @B_ID INT,
  @In_ID INT
AS
BEGIN
  UPDATE Student
  SET T_ID = @T_ID,
    B_ID = @B_ID,
    In_ID = @In_ID
  WHERE S_ID = @S_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Student
  @S_ID INT
AS
BEGIN
  DELETE FROM Student
  WHERE S_ID = @S_ID
END
GO

-- ------------------------------

-- ====================================================
--             Table: Student_Certificate              --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Student_Certificate
  @Cer_ID INT,
  @S_ID INT,
  @Date DATE
AS
BEGIN
  UPDATE Student_Certificate
  SET Date = @Date
  WHERE Cer_ID = @Cer_ID AND S_ID = @S_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Student_Certificate
  @Cer_ID INT,
  @S_ID INT
AS
BEGIN
  DELETE FROM Student_Certificate
  WHERE Cer_ID = @Cer_ID AND S_ID = @S_ID
END
GO

-- ------------------------------

-- ====================================================
--              Table: Student_Company                 --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Student_Company
  @C_ID INT,
  @S_ID INT,
  @Title NVARCHAR(255),
  @Hiring_Date DATE,
  @Salary INT
AS
BEGIN
  UPDATE Student_Company
  SET Title = @Title,
    Hiring_Date = @Hiring_Date,
    Salary = @Salary
  WHERE C_ID = @C_ID AND S_ID = @S_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Student_Company
  @C_ID INT,
  @S_ID INT
AS
BEGIN
  DELETE FROM Student_Company
  WHERE C_ID = @C_ID AND S_ID = @S_ID
END
GO

-- ------------------------------

-- ====================================================
--               Table: Student_Exam                   --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Student_Exam
  @SE_ID INT,
  @S_ID INT,
  @E_ID INT,
  @Exam_Date DATETIME,
  @Score FLOAT,
  @Status NVARCHAR(20)
AS
BEGIN
  UPDATE Student_Exam
  SET S_ID = @S_ID,
    E_ID = @E_ID,
    Exam_Date = @Exam_Date,
    Score = @Score,
    Status = @Status
  WHERE SE_ID = @SE_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Student_Exam
  @SE_ID INT
AS
BEGIN
  DELETE FROM Student_Exam
  WHERE SE_ID = @SE_ID
END
GO

-- ------------------------------

-- ====================================================
--          Table: Student_Exam_Questions              --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Student_Exam_Questions
  @EQ_ID INT,
  @S_ID INT,
  @S_Answer NVARCHAR(255),
  @Is_Correct_Answer BIT,
  @Status NVARCHAR(255)
AS
BEGIN
  UPDATE Student_Exam_Questions
  SET S_Answer = @S_Answer,
    Is_Correct_Answer = @Is_Correct_Answer,
    Status = @Status
  WHERE EQ_ID = @EQ_ID AND S_ID = @S_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Student_Exam_Questions
  @EQ_ID INT,
  @S_ID INT
AS
BEGIN
  DELETE FROM Student_Exam_Questions
  WHERE EQ_ID = @EQ_ID AND S_ID = @S_ID
END
GO

-- ------------------------------

-- ====================================================
--             Table: Student_Freelance                --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Student_Freelance
  @F_ID INT,
  @S_ID INT,
  @Details NVARCHAR(255),
  @Date DATE,
  @Cost INT
AS
BEGIN
  UPDATE Student_Freelance
  SET Details = @Details,
    Date = @Date,
    Cost = @Cost
  WHERE F_ID = @F_ID AND S_ID = @S_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Student_Freelance
  @F_ID INT,
  @S_ID INT
AS
BEGIN
  DELETE FROM Student_Freelance
  WHERE F_ID = @F_ID AND S_ID = @S_ID
END
GO

-- ------------------------------

-- ====================================================
--                   Table: Topic                      --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Topic
  @Crs_ID INT,
  @Name NVARCHAR(255),
  @New_Name NVARCHAR(255)
AS
BEGIN
  UPDATE Topic
  SET Name = @New_Name
  WHERE Crs_ID = @Crs_ID AND Name = @Name
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Topic
  @Crs_ID INT,
  @Name NVARCHAR(255)
AS
BEGIN
  DELETE FROM Topic
  WHERE Crs_ID = @Crs_ID AND Name = @Name
END
GO

-- ------------------------------

-- ====================================================
--                   Table: Track                      --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Track
  @T_ID INT,
  @Name NVARCHAR(255),
  @D_ID INT
AS
BEGIN
  UPDATE Track
  SET Name = @Name,
    D_ID = @D_ID
  WHERE T_ID = @T_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Track
  @T_ID INT
AS
BEGIN
  DELETE FROM Track
  WHERE T_ID = @T_ID
END
GO

-- ------------------------------

-- ====================================================
--             Table: Track_Branch_Intake              --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Track_Branch_Intake
  @T_ID INT,
  @B_ID INT,
  @In_ID INT,
  @New_T_ID INT,
  @New_B_ID INT,
  @New_In_ID INT
AS
BEGIN
  UPDATE Track_Branch_Intake
  SET T_ID = @New_T_ID,
    B_ID = @New_B_ID,
    In_ID = @New_In_ID
  WHERE T_ID = @T_ID AND B_ID = @B_ID AND In_ID = @In_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Track_Branch_Intake
  @T_ID INT,
  @B_ID INT,
  @In_ID INT
AS
BEGIN
  DELETE FROM Track_Branch_Intake
  WHERE T_ID = @T_ID AND B_ID = @B_ID AND In_ID = @In_ID
END
GO

-- ------------------------------

-- ====================================================
--               Table: Track_Course                   --
-- ====================================================
-- Update Procedure
CREATE OR ALTER PROCEDURE Update_Track_Course
  @T_ID INT,
  @Crs_ID INT,
  @New_T_ID INT,
  @New_Crs_ID INT
AS
BEGIN
  UPDATE Track_Course
  SET T_ID = @New_T_ID,
    Crs_ID = @New_Crs_ID
  WHERE T_ID = @T_ID AND Crs_ID = @Crs_ID
END
GO

-- Delete Procedure
CREATE OR ALTER PROCEDURE Delete_Track_Course
  @T_ID INT,
  @Crs_ID INT
AS
BEGIN
  DELETE FROM Track_Course
  WHERE T_ID = @T_ID AND Crs_ID = @Crs_ID
END
GO