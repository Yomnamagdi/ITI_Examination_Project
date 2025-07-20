                               ---- Reports Stored Procedures ----

-------GetStudentsByDepartment-----
CREATE PROCEDURE dbo.GetStudentsByDepartment
    @In_ID INT
AS
BEGIN
    SELECT S_ID, T_ID, B_ID, In_ID
    FROM Student
    WHERE In_ID = @In_ID;
END;


------GetStudentGrades----
CREATE PROCEDURE dbo.GetStudentGrades
    @S_ID INT
AS
BEGIN
    SELECT 
        SE.S_ID,
        SE.E_ID,
        E.Date,
        SE.Score,
        SE.Status
    FROM Student_Exam SE
    JOIN Exam E ON SE.E_ID = E.E_ID
    WHERE SE.S_ID = @S_ID;
END;



---ins_info----------

CREATE PROCEDURE dbo.ins_info
    @Ins_ID INT
AS
BEGIN
    SELECT *
    FROM Instructor
    WHERE Ins_ID = @Ins_ID;
END;

-----crs_topics----
CREATE PROCEDURE dbo.crs_topics
    @Crs_ID INT
AS
BEGIN
    SELECT *
    FROM Course_Topics
    WHERE Crs_ID = @Crs_ID;
END;

------GetExamQuestions-------
CREATE PROCEDURE dbo.GetExamQuestions
    @E_ID INT
AS
BEGIN
    SELECT Q.*
    FROM Exam_Questions EQ
    JOIN Question Q ON EQ.Q_ID = Q.Q_ID
    WHERE EQ.E_ID = @E_ID;
END;

-----show_qu-------
CREATE PROCEDURE dbo.show_qu
AS
BEGIN
    SELECT *
    FROM Question;
END;


