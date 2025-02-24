execute insertStudent 'S01','Mariam','Hossini',23,'+2010167978'
execute insertStudent 'S02','Mariam','Reda',22,'+2010167978'
execute insertStudent 'S03','Nada','Tarek',23,'+2010167978'
execute insertStudent 'S04','Ibrahim','Elarabi',24,'+2010167978'
execute insertStudent 'S05','Mostafa','Tarek',24,'+2017665446'
execute insertStudent 'S06','Moaz','Tamer',22,'+2010167978'
execute insertStudent 'S07','Ahmed','Khaled',23,'+2010123456'
execute insertStudent 'S08','Mohammed','Khaled',19,'+2010987654'
execute insertStudent 'S09','Noura','Hassan',18,'+2010654999'
execute insertStudent 'S10','Mai','Ahmed',35,'+2010169877'


--courses

execute insertCourse 'C01', 'SQL'
execute insertCourse 'C02', 'C#'
execute insertCourse 'C03', 'C++'
execute insertCourse 'C04', 'Angular'

--questions
EXEC insertQuestion 'Q001', 'MCQ', 'SELECT * FROM table_name;', 'Which SQL statement is used to retrieve all records from a table?', 1.00, 'C01';
EXEC insertQuestion 'Q002', 'MCQ', 'GROUP BY', 'Which SQL clause is used to group rows with the same values?', 2.00, 'C01';
EXEC insertQuestion 'Q003', 'MCQ', 'INNER JOIN', 'Which SQL join returns only matching records from both tables?', 1.00, 'C01';
EXEC insertQuestion 'Q004', 'MCQ', 'VARCHAR', 'Which SQL data type is used to store variable-length text?', 2.00, 'C01';
EXEC insertQuestion 'Q005', 'TF', 'True', 'SQL is a case-insensitive language.', 1.00, 'C01';

EXEC insertQuestion 'Q006', 'MCQ', 'using System;', 'Which namespace is essential for basic C# programs?', 2.00, 'C02';
EXEC insertQuestion 'Q007', 'MCQ', 'class', 'Which keyword is used to define a class in C#?',1.00, 'C02';
EXEC insertQuestion 'Q008', 'MCQ', 'static', 'Which keyword is used to declare a static method in C#?', 2.00, 'C02';
EXEC insertQuestion 'Q009', 'MCQ', 'int', 'Which data type is used to store whole numbers in C#?', 1.00, 'C02';
EXEC insertQuestion 'Q010', 'TF', 'False', 'In C#, you can use multiple inheritance directly.', 2.00, 'C02';

EXEC insertQuestion 'Q011', 'MCQ', 'cout << "Hello";', 'How do you print "Hello" in C++?', 1.00, 'C03';
EXEC insertQuestion 'Q012', 'MCQ', '#include <iostream>', 'Which header file is required for input/output operations in C++?', 2.00, 'C03';
EXEC insertQuestion 'Q013', 'MCQ', 'new', 'Which keyword is used to allocate memory dynamically in C++?', 1.00, 'C03';
EXEC insertQuestion 'Q014', 'MCQ', 'public', 'Which access specifier allows members to be accessed from outside the class in C++?', 2.00, 'C03';
EXEC insertQuestion 'Q015', 'TF', 'True', 'C++ supports function overloading.', 1.00, 'C03';

EXEC insertQuestion 'Q016', 'MCQ', 'Component', 'Which decorator is used to define an Angular component?', 2.00, 'C04';
EXEC insertQuestion 'Q017', 'MCQ', 'ngFor', 'Which Angular directive is used for looping through an array?', 1.00, 'C04';
EXEC insertQuestion 'Q018', 'MCQ', 'TypeScript', 'What is the primary programming language used in Angular?', 2.00, 'C04';
EXEC insertQuestion 'Q019', 'MCQ', 'RouterModule', 'Which module is required for Angular routing?', 1.00, 'C04';
EXEC insertQuestion 'Q020', 'TF', 'False', 'Angular templates are written in Java.', 2.00, 'C04';