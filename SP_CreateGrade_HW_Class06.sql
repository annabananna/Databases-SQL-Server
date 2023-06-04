--Create new procedure called CreateGrade
--   Procedure should create only Grade header info (not Grade Details)
--   Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--   Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)

Select * from Grade

CREATE PROCEDURE dbo.CreateGrade 
(
    @StudentId INT,
	@CourseId INT,
	@TeacherId INT,
	@Grade INT,
	@Comment NVARCHAR(MAX)
)
AS
BEGIN
   INSERT INTO [dbo].[Grade]
              ([StudentId], 
              [CourseID],
	          [TeacherID],
	          [Grade],
	          [Comment],
	          [CreatedDate])
   VALUES
         (@StudentId,
		  @CourseId,
		  @TeacherId,
		  @Grade,
		  @Comment,
		  GETDATE())

	Select Count(*) as TotalNumberOfGradesPerStudent
	From Grade
	Where StudentId = @StudentId

	Select MAX(Grade) as MaxGradePerStudent
	From Grade
	Where StudentId = @StudentId AND TeacherID = @TeacherId
END

select * from Student
select * from Course
select * from Teacher
Select * from Grade where StudentId = 555

exec dbo.CreateGrade 
    @StudentId = 555,
	@CourseId = 7,
	@TeacherId = 13,
	@Grade = 9,
	@Comment = 'Dobar'

	