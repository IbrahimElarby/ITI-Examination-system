ALTER PROCEDURE GenerateExam
    @StudentID VARCHAR(20),  
    @CourseID VARCHAR(20),  
    @No_Of_TF_Questions INT, 
    @No_Of_MCQ_Questions INT,
    @Duration DECIMAL(10,2),  
    @ExamID VARCHAR(20) OUTPUT  -- Added OUTPUT parameter
AS
BEGIN
    SET NOCOUNT ON;

    -- Generate Exam ID
    SET @ExamID = LEFT(REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', ''), 20);

	--exam degree
	Declare @TotalGrade decimal(10,2) = 0;
    

    -- Insert into Exam table
    INSERT INTO Exam (ID, [Date], Duration,Degree)
    VALUES (@ExamID, GETDATE(), @Duration,1);

    -- Insert True/False Questions
    INSERT INTO Quest_Exam(Q_ID, E_ID)
    SELECT ID, @ExamID
    FROM (
        SELECT TOP (@No_Of_TF_Questions) ID
        FROM Question
        WHERE Crs_ID = @CourseID AND Type = 'TF'
        ORDER BY NEWID()
    ) AS RandomTF;

    -- Insert MCQ Questions
    INSERT INTO Quest_Exam(Q_ID, E_ID)
    SELECT ID, @ExamID
    FROM (
        SELECT TOP (@No_Of_MCQ_Questions) ID
        FROM Question
        WHERE Crs_ID = @CourseID AND Type = 'MCQ'
        ORDER BY NEWID()
    ) AS RandomMCQ;

    -- Insert into take_exam table
    INSERT INTO take_exam (St_ID, E_ID, Q_ID, St_Answer, St_Grade)
    SELECT @StudentID, @ExamID, Q_ID, 0, 0
    FROM Quest_Exam
    WHERE E_ID = @ExamID;


	SELECT @TotalGrade = SUM(q.Mark)
    FROM Question Q , Quest_Exam QE
    WHERE Q.ID = QE.Q_ID and QE.E_ID = @ExamID


	UPDATE Exam
	SET Degree = @TotalGrade
	WHERE ID = @ExamID;
END;
