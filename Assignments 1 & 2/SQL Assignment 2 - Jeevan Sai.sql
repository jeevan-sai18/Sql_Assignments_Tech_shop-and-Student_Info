create database SISDB;
use SISDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    date_of_birth DATE,
    email VARCHAR(200),
    phone_number VARCHAR(20)
);
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)ON DELETE CASCADE
);

-- Inserting Data into tables

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
  (11, 'Etha', 'Mill', '1994-02-14', 'ethan.miler@email.com', '1234567890'),
  (12, 'Ema', 'John', '1996-07-30', 'ema.john@email.com', '1234567980'),
  (13, 'Car', 'Davi', '1998-10-17', 'car.davi@email.com', '1234569870'),
  (14, 'Mia', 'Garc', '1995-03-25', 'mia.garc@email.com', '1234596870'),
  (15, 'Moah', 'riguez', '1997-12-03', 'Moah.riguez@email.com', '1234987500'),
  (16, 'Ave', 'Smith', '1992-09-18', 'ave.smith@email.com', '12324567899'),
  (17, 'Log', 'Jones', '1995-11-11', 'log.jones@email.com', '1234567888'),
  (18, 'Soe', 'Mart', '1991-08-22', 'soe.martinez@email.com', '1234567988'),
  (19, 'Luc', 'Whit', '1992-05-07', 'luc.whit@email.com', '1234567770'),
  (20, 'Isa', 'son', '1999-03-26', 'isa.son@email.com', '1234566604');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
  (21, 'Introduction to Programming', 3,101),
  (22, 'Database t', 4,102),
  (23, 'Web Development', 3,103),
  (24, 'DSA', 4,104),
  (25, 'JAVA', 3,105),
  (26, 'Cloud', 4,106),
  (27, 'AI', 3,107),
  (28, 'Python', 4,108),
  (29, 'Os', 3,109),
  (30, 'Cybersecurity ', 4,110);
  
  
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
  (101, 'Prof', 'vijay', 'prof.vijay@email.com'),
  (102, 'Dr.', 'satish', 'dr.satish@email.com'),
  (103, 'Ms.', 'mural', 'ms.mural@email.com'),
  (104, 'Mr.', 'Brow', 'mr.brow@email.com'),
  (105, 'Profe', 'sekar', 'prof.sekar@email.com'),
  (106, 'Dr.', 'Clak', 'dr.clrk@email.com'),
  (107, 'Ms.', 'Mere', 'ms.mere@email.com'),
  (108, 'Mr.', 'Ander', 'mr.ander@email.com'),
  (109, 'Professor', 'Garci', 'prof.garci@email.com'),
  (110, 'Dr.', 'Rodri', 'dr.rodri@email.com');

  INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
  (31, 11, 21, '2023-01-15'),
  (32, 12, 22, '2023-01-20'),
  (33, 13, 23, '2023-02-25'),
  (34, 14, 24, '2023-04-15'),
  (35, 15, 25, '2023-05-05'),
  (36, 16, 26, '2023-06-15'),
  (37, 17, 27, '2023-07-20'),
  (38, 18, 28, '2023-06-25'),
  (39, 19, 29, '2023-08-10'),
  (40, 20, 30, '2023-03-05');

INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
  (1, 11, 500.00, '2023-02-15'),
  (2, 12, 600.00, '2023-01-30'),
  (3, 13, 450.00, '2023-08-25'),
  (4, 14, 700.00, '2023-01-20'),
  (5, 15, 550.00, '2023-08-05'),
  (6, 16, 800.00, '2023-05-15'),
  (7, 17, 350.00, '2023-04-20'),
  (8, 18, 900.00, '2023-03-25'),
  (9, 19, 400.00, '2023-04-10'),
  (10, 20, 750.00, '2023-10-05');

-- QNUM 3(b) 1

insert into [dbo].[Students]([student_id],[first_name],[last_name],[date_of_birth],[email],[phone_number])
values(21,'John','Doe','1995-08-15','john.doe@example.com','1234567890'); 


-- QNUM 3(b) 2
DECLARE @studentId INT = 11; 
DECLARE @courseId INT = 21;  
DECLARE @enrollmentDate DATE = '2023-01-15'; 
INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date)
VALUES (41,@studentId, @courseId, @enrollmentDate);

-- QNUM 3(b) 3

update [dbo].[Teacher] set email='professor.vijay@email.com' where teacher_id = 101;

--QNUM 3(b) 4


DECLARE @studentId INT = 11;  
DECLARE @courseId INT = 21;   
DELETE FROM Enrollments
WHERE student_id = @studentId
  AND course_id = @courseId;

  


--QNUM 3(b) 5


Update [dbo].[Courses] set teacher_id=101 where [course_name]='DSA';


--QNUM 3(b) 6


DECLARE @studentIdToDelete INT = 11; 
DELETE FROM Students
WHERE student_id = @studentIdToDelete;

--QNUM 3(b) 7



update [dbo].[Payments] set [amount]=999.00 where [payment_id]=2;

--4. JOINS

-- QNUM 1

select [dbo].[Students].[student_id], [dbo].[Students].[first_name],[dbo].[Students].[last_name],
Sum([dbo].[Payments].[amount]) as total
from Students join Payments on 
[dbo].[Students].[student_id]=[dbo].[Payments].[student_id]
where [dbo].[Students].[student_id]=15
group by [dbo].[Students].[student_id], [dbo].[Students].[first_name],[dbo].[Students].[last_name];

-- QNUM 2

select [dbo].[Courses].[course_id],[dbo].[Courses].[course_name] ,
COUNT([dbo].[Enrollments].[student_id]) as Count_stu
from [dbo].[Courses] left join [dbo].[Enrollments] on 
[dbo].[Courses].[course_id]=[dbo].[Enrollments].[course_id]
group by [dbo].[Courses].[course_id],[dbo].[Courses].[course_name];

--QNUM 3

select [dbo].[Students].[first_name],[dbo].[Students].[last_name] 
from [dbo].[Students] left join [dbo].[Enrollments] on
[dbo].[Students].[student_id]=[dbo].[Enrollments].[student_id]
where [Enrollments].[student_id]=   NULL;

-- QNUM 4

select [dbo].[Students].[first_name] ,[dbo].[Students].[last_name],[dbo].[Courses].[course_name] from [dbo].[Students]
join [dbo].[Enrollments] on [dbo].[Students].[student_id]=[dbo].[Enrollments].[student_id]
join [dbo].[Courses] on [dbo].[Enrollments].[course_id]=[dbo].[Courses].[course_id];

-- QNUM 5


select [dbo].[Teacher].[first_name],[dbo].[Teacher].[last_name],[dbo].[Courses].[course_name]
from [dbo].[Teacher] join  [dbo].[Courses] on [dbo].[Teacher].[teacher_id]=[dbo].[Courses].[teacher_id];

-- QNUM 6

select [dbo].[Students].[first_name] ,[dbo].[Students].[last_name],[dbo].[Enrollments].[enrollment_date],[dbo].[Courses].[course_name] from [dbo].[Students]
join [dbo].[Enrollments] on [dbo].[Students].[student_id]=[dbo].[Enrollments].[student_id]
join  [dbo].[Courses] on [dbo].[Enrollments].[course_id]=[dbo].[Courses].[course_id];

-- QNUM 7

select [dbo].[Students].[first_name],[dbo].[Students].[last_name] from [dbo].[Students] 
left join [dbo].[Payments] on [dbo].[Students].[student_id]=[dbo].[Payments].[student_id]
where [dbo].[Payments].[amount]=NULL;

-- QNUM 8

-- Identify courses that have no enrollments
SELECT [dbo].[Courses].[course_id],[dbo].[Courses].[course_name]
FROM [dbo].[Courses]
LEFT JOIN [dbo].[Enrollments] on [dbo].[Courses].[course_id] =[dbo].[Enrollments].[course_id]
WHERE
    [dbo].[Enrollments].[course_id]= NULL;

-- QNUM 9

SELECT [dbo].[Enrollments].student_id,[dbo].[Students].first_name,[dbo].[Students].last_name,
 COUNT([dbo].[Enrollments].[course_id])as enrolled_courses_count
FROM Enrollments
JOIN [dbo].[Students] on [dbo].[Enrollments].[student_id]=[dbo].[Students].[student_id]
GROUP BY [dbo].[Enrollments].[student_id],[dbo].[Students].[first_name],[dbo].[Students].[last_name]
HAVING COUNT([dbo].[Enrollments].course_id) > 1;

--QNUM 10

select [dbo].[Teacher].[first_name],[dbo].[Teacher].[last_name] from [dbo].[Teacher]
left join  [dbo].[Courses] on [dbo].[Teacher].[teacher_id]=[dbo].[Courses].[teacher_id]
where [dbo].[Courses].[course_id]= NULL;

-- 5. Aggregate Functions and Subqueries

-- QNUM 1

 SELECT C.[course_id], C.[course_name], AVG(NumOfStudents) AS AverageStudentsEnrolled FROM Courses AS C
JOIN (
	SELECT [course_id], COUNT(DISTINCT [student_id]) AS NumOfStudents FROM Enrollments
	GROUP BY [course_id]
) AS E ON C.[course_id] = E.[course_id]
GROUP BY C.[course_id], C.[course_name];

-- QNUM 2

SELECT S.[student_id], [first_name], [last_name] FROM Students AS S
JOIN Payments AS P ON S.[student_id] = P.[student_id]
WHERE P.Amount=(
	SELECT MAX(Amount) FROM Payments
);

-- QNUM 3

SELECT [course_name] , COUNT(E.[enrollment_id]) FROM Courses AS C
JOIN Enrollments AS E ON C.[course_id] = E.[course_id]
GROUP BY [course_name];

--QNUM 4

SELECT t.[teacher_id], t.[first_name], t.[last_name], SUM(p.Amount) AS TotalPayments
FROM Teacher t
JOIN Courses c ON t.[teacher_id] = c.[teacher_id]
JOIN Enrollments e ON c.[course_id] = e.[course_id]
JOIN Payments p ON e.[student_id] = p.[student_id]
GROUP BY t.[teacher_id], t.[first_name], t.[last_name];

--QNUM 5

SELECT [student_id],[first_name], [last_name]  FROM Students
WHERE (
        SELECT COUNT(DISTINCT [course_id]) FROM Enrollments
        ) = (
        SELECT  COUNT(DISTINCT [course_id]) FROM Enrollments e
        WHERE Students.[student_id] = e.[student_id]
);

-- QNUM 6

SELECT [teacher_id], [first_name], [last_name] FROM Teacher
WHERE [teacher_id] NOT IN(
	SELECT t.[teacher_id] FROM Teacher t
	JOIN Courses c ON t.[teacher_id] = c.[teacher_id]
);

-- QNUM7

SELECT StudentAges.[student_id], AVG(StudentAge) AS AverageAge 
FROM (
	SELECT [student_id], DATEDIFF(YEAR,[date_of_birth], GETDATE()) AS StudentAge FROM Students
) As StudentAges
GROUP BY StudentAges.[student_id];


-- QNUM 8

SELECT [course_id], [course_name] FROM Courses
WHERE [course_id] NOT IN(
	SELECT C.[course_id] From Courses C
	JOIN Enrollments E on c.[course_id] = E.[course_id]
);


-- QNUM 9

SELECT S.[first_name], S.[last_name], SUM(Amount) AS TotalPayments FROM Students S
JOIN Enrollments E ON S.[student_id] = E.[student_id]
JOIN Courses C ON E.[course_id] = C.[course_id]
JOIN Payments P ON E.[student_id] = P.[student_id]
GROUP BY S.[first_name], S.[last_name];

-- QNUM 10

SELECT S.[first_name], S.[last_name] FROM Students S 
WHERE  [student_id] IN (
	SELECT [student_id] From Payments
	GROUP BY [student_id]
	HAVING COUNT(*)>1
);

-- QNUM11

SELECT S.[first_name], S.[last_name], SUM(Amount) AS TotalPayments FROM Students S
JOIN Payments P ON S.[student_id] = P.[student_id]
GROUP BY S.[first_name], S.[last_name];

--QNUM 12

SELECT [course_name], COUNT([enrollment_id]) FROM Courses C
JOIN Enrollments E ON C.[course_id] = E.[course_id]
GROUP BY [course_name];

-- QNUM 13

SELECT  S.[first_name], S.[last_name], AVG(Amount) From Students S
JOIN Payments P ON S.[student_id] = P.[student_id]
GROUP BY S.[first_name], S.[last_name];

-- THE END