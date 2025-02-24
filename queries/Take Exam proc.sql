CREATE TYPE AnswerTableType AS TABLE (
    QuestionID VARCHAR(20),
    StudentAnswer VARCHAR(150)
);




create PROCEDURE AnswerExam
    @StudentID VARCHAR(20),
    @ExamID VARCHAR(20),
    @Answers AnswerTableType READONLY  -- Table Parameter
AS
BEGIN
    UPDATE take_exam
    SET St_Answer = A.StudentAnswer
    FROM take_exam T
    INNER JOIN @Answers A ON T.Q_ID = A.QuestionID
    WHERE T.St_ID = @StudentID AND T.E_ID = @ExamID;
END;