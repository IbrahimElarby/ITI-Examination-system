CREATE TYPE AnswerTableType AS TABLE (
    QuestionID VARCHAR(20),
    StudentAnswer VARCHAR(150)
);




alter PROCEDURE AnswerExam
    @StudentID VARCHAR(20),
    @ExamID VARCHAR(20),
    @Answers AnswerTableType READONLY  -- Table Parameter
AS
BEGIN
    UPDATE take_exam
    SET St_Answer = A.StudentAnswer
    FROM take_exam T , @Answers A 
    WHERE T.Q_ID = A.QuestionID and  T.St_ID = @StudentID AND T.E_ID = @ExamID;
END;