drop database [Examination System]
Create database [Examination System]

create table Student 
(
	ID varchar(20) ,
	Fname varchar(20) not null,
	Lname varchar(20) not null,
	Age  int ,
	Phone varchar(20),
	constraint Std_pk primary key (ID),
	constraint [chk len] check (len(Fname) >= 3 and len(Lname) >=4),
	constraint [chk age] check (Age between 18 and 35),
	constraint [chk phone] check (Left(Phone, 3) = '+20' AND Len(Phone) = 11)
)

create table Course 
(
	ID varchar(20) ,
	[CRS Name] varchar(20) not null ,
	constraint crs_pk primary key (ID)
)
create table Std_Crs 
(
	St_ID varchar(20) ,
	Crs_ID varchar(20) , 
	constraint [std crs pk] primary key (St_ID,Crs_ID),
	constraint [std fk] foreign key (St_ID) references Student(ID) on update cascade on delete cascade,
	constraint [crs fk] foreign key (Crs_ID) references Course(ID) on update cascade on delete cascade,
)

create table Question 
(
	ID varchar(20),
	[Type] varchar(20),
	Corect_Answer varchar(150) not null,
	Body varchar(1000) not null ,
	Mark decimal(10,2) not null,
	Crs_ID varchar(20),
	constraint [Q pk] primary key (ID),
	constraint [chk Type] check ([Type] in ('MCQ','TF')),
	constraint [chk mark] check (Mark > 0),
	constraint [crs fk2] foreign key (Crs_ID) references  Course(ID) on update cascade on delete cascade,
)

create Table Q_Choice
(
	Q_ID varchar(20),
	Choice varchar(150),
	constraint [Q choice pk] primary key (Q_ID,Choice),
	constraint [qid fk] foreign key (Q_ID) references Question(ID) on update cascade on delete cascade,
	
)

Create table Exam 
(
	ID varchar(20) ,
	[Date] Date Default getdate(),
	Duration Decimal(10,2) not null,
	Degree Decimal(10,2) not null  ,
	constraint [exam pk] primary key (ID),
	constraint [chk Degree] check (Degree > 0),
)
create table Quest_Exam
(
	Q_ID varchar(20),
	E_ID varchar(20),
	constraint [q exm pk] primary key (Q_ID,E_ID),
	constraint [q fk] foreign key (Q_ID) references Question(ID) on update cascade on delete cascade,
	constraint [exm fk] foreign key (E_ID) references Exam(ID) on update cascade on delete cascade,

)
create table take_exam
(
	St_ID varchar(20),
	Q_ID varchar(20),
	E_ID varchar(20),
	St_Answer varchar(150),
	St_Grade decimal(10,2) default 0,
	constraint [std exm Q pk2] primary key (St_ID,E_ID,Q_ID),
	constraint [std fk3] foreign key (St_ID) references Student(ID) on update cascade on delete cascade,
	constraint [Q fk1] foreign key (Q_ID) references Question(ID) on update cascade on delete cascade,
	constraint [exm fk3] foreign key (E_ID) references Exam(ID) on update cascade on delete cascade,
)


drop table take_exam