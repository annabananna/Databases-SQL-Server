--Calculate the count of all grades per Teacher in the system

Select TeacherID, Count(Grade) as TotalGrades
From Grade
Group By TeacherID

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

Select * From Grade

Select TeacherID, Count(Grade) as TotalGrades
From Grade
Where StudentID < 100
Group By TeacherID

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

Select g.StudentID, s.FirstName, s.LastName, Max(Grade) as MaxGrade, AVG(Grade) as AvgGrade
From Grade g
INNER JOIN Student s ON s.Id = g.StudentID
Group By g.StudentID, s.FirstName, s.LastName

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

Select TeacherID, Count(Grade) as TotalGrades
From Grade
Group By TeacherID
HAVING Count(Grade) > 200

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

Select g.StudentID, Count(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade
From Grade g
Group By g.StudentID
HAVING MAX(Grade) = AVG(Grade)


--List Student First Name and Last Name next to the other details from previous query

Select g.StudentID, s.FirstName, s.LastName, Count(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade
From Grade g
INNER JOIN Student s ON s.ID = g.StudentID
Group By g.StudentID, s.FirstName, s.LastName
HAVING MAX(Grade) = AVG(Grade)

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW vv_StudentGrades
AS
Select StudentID, Count(Grade) as TotalGrades
FROM Grade
Group By StudentID
GO


--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrades
AS
Select g.StudentID, s.FirstName, s.LastName, Count(Grade) as TotalGrades
FROM Grade g
INNER JOIN Student s ON s.ID = g.StudentID
Group By g.StudentID, s.FirstName, s.LastName
GO

--List all rows from view ordered by biggest Grade Count

Select *
FROM vv_StudentGrades
Order By TotalGrades DESC , FirstName
