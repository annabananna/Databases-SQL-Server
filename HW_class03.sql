--Find all Students with FirstName = Antonio

SELECT * FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’

SELECT * FROM Student
WHERE DateOfBirth > '1999-01-01';

--Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT * FROM Student
Where LastName like 'J%' and EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01'

--List all Students ordered by FirstName

SELECT * FROM Student
Order By FirstName ASC

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates

Select LastName
from Student 
UNION 
Select LastName 
From Teacher

--Create Foreign key constraints from diagram or with script

ALTER TABLE Grade WITH CHECK
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES Student (Id)

ALTER TABLE Grade WITH CHECK
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseID)
REFERENCES Course (Id)

ALTER TABLE Grade WITH CHECK
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID)
REFERENCES Teacher (Id)

ALTER TABLE GradeDetails WITH CHECK
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID)
REFERENCES Grade (Id)

ALTER TABLE GradeDetails WITH CHECK
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID)
REFERENCES AchievementType (Id)

--List all possible combinations of Courses names and AchievementType names that can be passed by student

Select * from Course c
Cross Join AchievementType

--List all Teachers without exam Grade

Select t.*
From Teacher t
Left Join Grade g ON g.TeacherID = t.Id
Where g.TeacherID IS NULL
Order By t.Id
