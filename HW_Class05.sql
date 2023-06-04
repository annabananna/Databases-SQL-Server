--Declare scalar variable for storing FirstName values
--  Assign value ‘Antonio’ to the FirstName variable
--  Find all Students having FirstName same as the variable


DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

Select * From Student WHERE FirstName = @FirstName

--  Declare table variable that will contain StudentId, StudentName and DateOfBirth
--  Fill the table variable with all Female students

DECLARE @StudentInfo TABLE(StudentId INT NOT NULL, StudentName NVARCHAR(100) NOT NULL, DateOfBirth DATE NOT NULL)

INSERT INTO @StudentInfo (StudentId, StudentName, DateOfBirth)
SELECT Id, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F'

Select * From @StudentInfo


--  Declare temp table that will contain LastName and EnrolledDate columns
--  Fill the temp table with all Male students having First Name starting with ‘A’
--  Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #StudentTempTable (LastName NVARCHAR(100) NOT NULL, EnrolledDate DATE NOT NULL)

INSERT INTO #StudentTempTable (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' and FirstName like 'A%'

Select *
From #StudentTempTable
WHERE LEN(LastName) = '7'


--  Find all teachers whose FirstName length is less than 5 and
--  the first 3 characters of their FirstName and LastName are the same

Select * From Teacher
Where LEN(FirstName) < 5 and LEFT(FirstName, 3) = LEFT(LastName, 3)