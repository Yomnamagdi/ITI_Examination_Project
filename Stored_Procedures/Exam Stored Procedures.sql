use Examination_System_ITI_DB

CREATE PROCEDURE GenerateExam
    @NUM_OF_TF INT,
    @NUM_OF_MCQ INT,
    @CRS_ID INT,
    @INS_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NEW_E_ID INT;

    INSERT INTO Exam (DATE, NUM_OF_TF, NUM_OF_MCQ, CRS_ID, INS_ID)
    VALUES (GETDATE(), @NUM_OF_TF, @NUM_OF_MCQ, @CRS_ID, @INS_ID);

    SET @NEW_E_ID = SCOPE_IDENTITY();

    INSERT INTO EXAM_QUESTIONS (E_ID, Q_ID)
    SELECT TOP (@NUM_OF_TF) @NEW_E_ID, Q_ID
    FROM QUESTION
    WHERE TYPE = 'TF' AND CRS_ID = @CRS_ID
    ORDER BY NEWID();

    INSERT INTO EXAM_QUESTIONS (E_ID, Q_ID)
    SELECT TOP (@NUM_OF_MCQ) @NEW_E_ID, Q_ID
    FROM QUESTION
    WHERE TYPE = 'MCQ' AND CRS_ID = @CRS_ID
    ORDER BY NEWID();
END;



-------------------------------------------------------------------------


CREATE PROCEDURE SubmitStudentAnswer
    @S_ID INT,
    @EQ_ID INT,
    @S_ANSWER NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Q_ID INT;
    DECLARE @CorrectAnswer NVARCHAR(100);
    DECLARE @IsCorrect BIT;

    -- تحقق إن EQ_ID موجود
    IF NOT EXISTS (SELECT 1 FROM EXAM_QUESTIONS WHERE EQ_ID = @EQ_ID)
    BEGIN
        RAISERROR('EQ_ID غير موجود في جدول EXAM_QUESTIONS', 16, 1);
        RETURN;
    END

    -- احضار Q_ID
    SELECT @Q_ID = Q_ID
    FROM EXAM_QUESTIONS
    WHERE EQ_ID = @EQ_ID;

    -- احضار الإجابة الصحيحة
    SELECT @CorrectAnswer = Q_ANSWER
    FROM QUESTION
    WHERE Q_ID = @Q_ID;

    -- مقارنة الإجابة
    SET @IsCorrect = CASE 
                        WHEN @S_ANSWER = @CorrectAnswer THEN 1 
                        ELSE 0 
                     END;

    -- حفظ الإجابة
    INSERT INTO STUDENT_EXAM_QUESTIONS (EQ_ID, S_ID, S_ANSWER, IS_CORRECT_ANSWER, STATUS)
    VALUES (@EQ_ID, @S_ID, @S_ANSWER, @IsCorrect, 'answered');
END;



-------------------------------------------------------------------------------------------------------

CREATE PROCEDURE CalculateStudentScore
    @S_ID INT,
    @E_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- تحقق إن الامتحان موجود
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE E_ID = @E_ID)
    BEGIN
        RAISERROR('الامتحان غير موجود', 16, 1);
        RETURN;
    END

    -- تحقق إن الطالب شارك في الامتحان
    IF NOT EXISTS (
        SELECT 1 FROM STUDENT_EXAM_QUESTIONS SEQ
        JOIN EXAM_QUESTIONS EQ ON SEQ.EQ_ID = EQ.EQ_ID
        WHERE SEQ.S_ID = @S_ID AND EQ.E_ID = @E_ID
    )
    BEGIN
        RAISERROR('الطالب لم يشارك في هذا الامتحان', 16, 1);
        RETURN;
    END

    DECLARE @Total INT;
    DECLARE @Correct INT;
    DECLARE @Score FLOAT;

    -- حساب عدد الأسئلة
    SELECT @Total = COUNT(*)
    FROM EXAM_QUESTIONS
    WHERE E_ID = @E_ID;

    -- عدد الإجابات الصحيحة
    SELECT @Correct = COUNT(*)
    FROM STUDENT_EXAM_QUESTIONS SEQ
    JOIN EXAM_QUESTIONS EQ ON SEQ.EQ_ID = EQ.EQ_ID
    WHERE SEQ.S_ID = @S_ID AND EQ.E_ID = @E_ID AND IS_CORRECT_ANSWER = 1;

    -- حساب السكور
    SET @Score = CASE 
                    WHEN @Total = 0 THEN 0 
                    ELSE (@Correct * 100.0) / @Total 
                 END;

    -- عرض النتيجة
    SELECT 
        @S_ID AS StudentID,
        @E_ID AS ExamID,
        @Correct AS CorrectAnswers,
        @Total AS TotalQuestions,
        @Score AS ScorePercent;
END;


