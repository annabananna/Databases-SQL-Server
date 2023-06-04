USE SEDC
CREATE TABLE [Student](
[Id] [int] IDENTITY(1, 1) NOT NULL,
[FirstName] [nvarchar](100) NOT NULL,
[LastName] [nvarchar](100) NOT NULL,
[DateOfBirth] [date] NOT NULL,
[EnrolledDate] [date] NOT NULL,
[Gender] [nchar] NOT NULL,
[NationallIDNumber] [int] NOT NULL,
[StudentCardNumber] [int] NOT NULL,
CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED (
[Id] ASC
))

CREATE TABLE [Teacher](
[Id] [int] IDENTITY(1, 1) NOT NULL,
[FirstName] [nvarchar](100) NOT NULL,
[LastName] [nvarchar](100) NOT NULL,
[DateOfBirth] [date] NOT NULL,
[AcademicRank] [nvarchar](100) NOT NULL,
[HireDate] [date] NOT NULL,
CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED (
[Id] ASC
))


CREATE TABLE [Grade](
[Id] [int] IDENTITY(1, 1) NOT NULL,
[StudentID] [int] NOT NULL,
[CourseID] [int] NOT NULL,
[TeacherID] [int] NOT NULL,
[Grade] [int] NOT NULL,
[Comment] [nvarchar](500) NOT NULL,
[CreatedDate] [date] NOT NULL,
CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED (
[Id] ASC
))

CREATE TABLE [Course](
[Id] [int] IDENTITY(1, 1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[Credit] [int] NOT NULL,
[AcademicYear] [date] NOT NULL,
[Semester] [int] NOT NULL,
CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED (
[Id] ASC
))

CREATE TABLE [GradeDetails](
[Id] [int] IDENTITY(1, 1) NOT NULL,
[GradeID] [int] NOT NULL,
[AchievmentTypeID] [int] NOT NULL,
[AchievmentPoints] [int] NOT NULL,
[AchievmentMaxPoints] [int] NOT NULL,
[AchievmentDate] [date] NOT NULL,
CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED (
[Id] ASC
))

CREATE TABLE [AchievmentType](
[Id] [int] IDENTITY(1, 1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[Description] [nvarchar](500) NOT NULL,
[ParticipationRate] [int] NOT NULL,
CONSTRAINT [PK_AchievmentType] PRIMARY KEY CLUSTERED (
[Id] ASC
))


SELECT * FROM Student
SELECT * FROM Teacher
SELECT * FROM Grade
SELECT * FROM Course
SELECT * FROM GradeDetails
SELECT * FROM AchievmentType
