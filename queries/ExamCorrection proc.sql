create procedure ExamCorection
@ST_ID varchar(20),
@E_ID varchar(20)
as
begin
UPDATE take_exam
    SET St_Grade = St_Grade + Mark
    FROM take_exam T ,  Question Q
    Where T.Q_ID = Q.ID and T.St_ID = @ST_ID  and T.E_ID = @E_ID and T.St_Answer like Q.Corect_Answer
end