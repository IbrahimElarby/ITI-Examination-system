alter procedure ExamCorection
@ST_ID varchar(20),
@E_ID varchar(20),
@TotalGrade DECIMAL(10,2) OUTPUT 
as
begin
UPDATE take_exam
    SET St_Grade =  Mark
    FROM take_exam T ,  Question Q
    Where T.Q_ID = Q.ID and T.St_ID = @ST_ID  and T.E_ID = @E_ID and T.St_Answer = Q.Corect_Answer

	SELECT @TotalGrade = SUM(St_Grade)
    FROM take_exam
    WHERE St_ID = @ST_ID AND E_ID = @E_ID;
end

