create procedure insertStudent
    @id varchar(20),
    @fname varchar(20),
    @lname varchar(20),
    @age int,
    @phone varchar(20)
as
begin
    insert into student (id, fname, lname, age, phone)
    values (@id, @fname, @lname, @age, @phone)
end


create procedure getStudents
as
begin
    select * from student
end

create procedure updateStudent
    @id varchar(20),
    @fname varchar(20),
    @lname varchar(20),
    @age int,
    @phone varchar(20)
as
begin
    update student
    set fname = @fname, lname = @lname, age = @age, phone = @phone
    where id = @id
end


create procedure deleteStudent
    @id varchar(20)
as
begin
    delete from student where id = @id
end

-----------------------------------------------------------
create procedure insertCourse
    @id varchar(20),
    @crsName varchar(20)
as
begin
    insert into course (id, [crs name])
    values (@id, @crsName)
end


create procedure getCourses
as
begin
    select * from course
end


create procedure updateCourse
    @id varchar(20),
    @crsName varchar(20)
as
begin
    update course
    set [crs name] = @crsName
    where id = @id
end


create procedure deleteCourse
    @id varchar(20)
as
begin
    delete from course where id = @id
end


-----------------------------------------------------------

create procedure insertExam
    @id varchar(20),
    @date date,
    @duration decimal(10,2),
    @degree decimal(10,2)
as
begin
    insert into exam (id, [date], duration, degree)
    values (@id, @date, @duration, @degree)
end


create procedure getExams
as
begin
    select * from exam
end


create procedure updateExam
    @id varchar(20),
    @date date,
    @duration decimal(10,2),
    @degree decimal(10,2)
as
begin
    update exam
    set [date] = @date, duration = @duration, degree = @degree
    where id = @id
end


create procedure deleteExam
    @id varchar(20)
as
begin
    delete from exam where id = @id
end


-----------------------------------------------------------
create procedure insertQuestion
    @id varchar(20),
    @type varchar(20),
    @correctAnswer varchar(150),
    @body varchar(1000),
    @mark decimal(10,2),
    @crsId varchar(20)
as
begin
    insert into question (id, [type], corect_answer, body, mark, crs_id)
    values (@id, @type, @correctAnswer, @body, @mark, @crsId)
end


create procedure getQuestions
as
begin
    select * from question
end


create procedure updateQuestion
    @id varchar(20),
    @type varchar(20),
    @correctAnswer varchar(150),
    @body varchar(1000),
    @mark decimal(10,2),
    @crsId varchar(20)
as
begin
    update question
    set [type] = @type, corect_answer = @correctAnswer, body = @body, mark = @mark, crs_id = @crsId
    where id = @id
end


create procedure deleteQuestion
    @id varchar(20)
as
begin
    delete from question where id = @id
end


-----------------------------------------------------------

create procedure insertStdCrs
    @stId varchar(20),
    @crsId varchar(20)
as
begin
    insert into Std_Crs (St_ID, Crs_ID)
    values (@stId, @crsId)
end

create procedure getStdCrs
as
begin
    select * from Std_Crs
end

create procedure updateStdCrs
    @stId varchar(20),
    @crsId varchar(20)
as
begin
    update Std_Crs
    set Crs_ID = @crsId
    where St_ID = @stId
end

create procedure deleteStdCrs
    @stId varchar(20),
    @crsId varchar(20)
as
begin
    delete from Std_Crs
    where St_ID = @stId and Crs_ID = @crsId
end


-----------------------------------------------------------
create procedure insertQChoice
    @qId varchar(20),
    @choice varchar(150)
as
begin
    insert into Q_Choice (Q_ID, Choice)
    values (@qId, @choice)
end

create procedure getQChoices
as
begin
    select * from Q_Choice
end

create procedure updateQChoice
    @qId varchar(20),
    @oldChoice varchar(150),
    @newChoice varchar(150)
as
begin
    update Q_Choice
    set Choice = @newChoice
    where Q_ID = @qId and Choice = @oldChoice
end

create procedure deleteQChoice
    @qId varchar(20),
    @choice varchar(150)
as
begin
    delete from Q_Choice
    where Q_ID = @qId and Choice = @choice
end


-----------------------------------------------------------
create procedure insertQuestExam
    @qId varchar(20),
    @eId varchar(20)
as
begin
    insert into Quest_Exam (Q_ID, E_ID)
    values (@qId, @eId)
end

create procedure getQuestExams
as
begin
    select * from Quest_Exam
end

create procedure updateQuestExam
    @qId varchar(20),
    @eId varchar(20)
as
begin
    update Quest_Exam
    set E_ID = @eId
    where Q_ID = @qId
end

create procedure deleteQuestExam
    @qId varchar(20),
    @eId varchar(20)
as
begin
    delete from Quest_Exam
    where Q_ID = @qId and E_ID = @eId
end


-----------------------------------------------------------
create procedure insertTakeExam
    @stId varchar(20),
    @QId varchar(20),
    @eId varchar(20),
    @stAnswer varchar(150),
    @stGrade decimal(10,2)
as
begin
    insert into take_exam (St_ID, Q_ID, E_ID, St_Answer, St_Grade)
    values (@stId, @QId, @eId, @stAnswer, @stGrade)
end

create procedure getTakeExams
as
begin
    select * from take_exam
end

create procedure updateTakeExam
    @stId varchar(20),
    @eId varchar(20),
    @stAnswer varchar(150),
    @stGrade decimal(10,2)
as
begin
    update take_exam
    set St_Answer = @stAnswer, St_Grade = @stGrade
    where St_ID = @stId and E_ID = @eId
end

create procedure deleteTakeExam
    @stId varchar(20),
    @eId varchar(20)
as
begin
    delete from take_exam
    where St_ID = @stId and E_ID = @eId
end

-----------------------------------------------------------

execute insertCourse 'C001', 'SQL'
execute getCourses
execute updateCourse 'C001', 'SQL'
execute deleteCourse 'C001'

execute insertExam 'E001', '2025-06-01', 2.5, 100
execute getExams
execute updateExam 'E001', '2025-06-15', 3.0, 150
execute deleteExam 'E001'

execute insertQChoice 'Q001', 'A'
execute getQChoices
execute updateQChoice 'Q001', 'A', 'B'
execute deleteQChoice 'Q001', 'B'

execute insertQuestExam 'Q001', 'E001'
execute getQuestExams
execute updateQuestExam 'Q001', 'E002'
execute deleteQuestExam 'Q001', 'E001'

execute insertQuestion 'Q002', 'TF', 'T', 'What is C#?', 5, 'C001'
execute getQuestions
execute updateQuestion 'Q001', 'MCQ', 'C', 'What is 3+3?', 5, 'C001'
execute deleteQuestion 'Q001'

execute insertStdCrs 'S001', 'C001'
execute getStdCrs
execute updateStdCrs 'S001', 'C002'
execute deleteStdCrs 'S001', 'C001'

execute insertStudent 'S001', 'Ali', 'Ahmed', 22, '+2010167978'
execute getStudents
execute updateStudent 'S001', 'Moaz', 'Tamer', 23, '2011122334'
execute deleteStudent 'S001'

execute insertTakeExam 'S001', 'C001', 'E001', 'A', 10
execute getTakeExams
execute updateTakeExam 'S001', 'E001', 'B', 15
execute deleteTakeExam 'S001', 'E001'
