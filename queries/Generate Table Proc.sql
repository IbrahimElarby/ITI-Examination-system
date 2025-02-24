CREATE PROCEDURE GenerateExam 
    @CourseID INT, 
    @No_Of_TF_Questions INT, 
    @No_Of_MCQ_Questions INT, 
    @GeneratedExamID VARCHAR(50) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Generate a Unique Exam ID (e.g., EXAM20250223_123456)
    SET @GeneratedExamID = 'EXAM' + FORMAT(GETDATE(), 'yyyyMMdd_HHmmss') + '_' + CAST(ABS(CHECKSUM(NEWID())) % 10000 AS VARCHAR);

    -- Step 2: Insert TF Questions
    INSERT INTO Quest_Exam(Q_ID, E_ID)
    SELECT ID, @GeneratedExamID
    FROM (
        SELECT TOP (@No_Of_TF_Questions) ID
        FROM Question
        WHERE Crs_ID = @CourseID AND Type = 'TF'
        ORDER BY NEWID()
    ) AS RandomTF;

    -- Step 3: Insert MCQ Questions
    INSERT INTO Quest_Exam(Q_ID, E_ID)
    SELECT ID, @GeneratedExamID
    FROM (
        SELECT TOP (@No_Of_MCQ_Questions) ID
        FROM Question
        WHERE Crs_ID = @CourseID AND Type = 'MCQ'
        ORDER BY NEWID()
    ) AS RandomMCQ;

    -- Return the Exam ID
    SELECT @GeneratedExamID AS ExamID;
END;