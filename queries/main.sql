------Generate Exam
DECLARE @GeneratedExamID VARCHAR(20);  -- Declare variable to store the output ExamID

EXEC GenerateExam 
    @StudentID = 'S01',  
    @CourseID = 'C01',  
    @No_Of_TF_Questions = 5, 
    @No_Of_MCQ_Questions = 10, 
    @Duration = 90.00,  
    @ExamID = @GeneratedExamID OUTPUT;  

PRINT 'Generated Exam ID: ' + @GeneratedExamID;

----- Answer Exam
DECLARE @ExamAnswers AnswerTableType;

INSERT INTO @ExamAnswers (QuestionID, StudentAnswer)
VALUES
    ('Q001', 'Which SQL statement is used to retrieve all records from a table?'),
    ('Q002', 'GROUP BY'),
    ('Q003', 'INNER JOIN'),
	('Q004', 'Answer C'),
	('Q005', 'True');

	select * from @ExamAnswers
	EXEC AnswerExam 
    @StudentID = 'S01', 
    @ExamID = '869A133A5B2D492E9F8A', 
    @Answers = @ExamAnswers;


	---exam correction
	DECLARE @FinalGrade DECIMAL(10,2);

	EXEC ExamCorection 
    @ST_ID = 'S01', 
    @E_ID = '869A133A5B2D492E9F8A', 
    @TotalGrade = @FinalGrade OUTPUT;

	PRINT 'Total Grade: ' + CAST(@FinalGrade AS VARCHAR(10));