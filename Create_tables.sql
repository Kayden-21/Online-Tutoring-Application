--Create Initial Database
Create Database TutoringApplicationDB;
GO

USE TutoringApplicationDB;
GO

-- Create our Person Type table
CREATE TABLE dbo.PersonType(
    PersonTypeID int IDENTITY(1,1) NOT NULL,
    Persontype varchar(20) NULL,
    CONSTRAINT [PK_PersonType] PRIMARY KEY CLUSTERED ([PersonTypeID] ASC)
);
GO

-- Create our Subject table
CREATE TABLE dbo.Subject(
    SubjectID int IDENTITY(1,1) NOT NULL,
    Grade int NULL,
    Name varchar(120) NULL,
    Description varchar(120) NULL,
    CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED ([SubjectID] ASC)
);
GO

-- Create our main Users table
CREATE TABLE dbo.Users(
    UserID int IDENTITY(1,1) NOT NULL,
    Email varchar(120) NOT NULL, 
    FirstName varchar(120) NULL,
	LastName varchar(120) NULL,
    PersonTypeID int NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC),
	CONSTRAINT [FK_User_PersonType] FOREIGN KEY (PersonTypeID)
	REFERENCES dbo.PersonType (PersonTypeID),
    CONSTRAINT [Email] CheckEmail CHECK(Email LIKE '%_@___%') 
);
GO

-- Create our Parent Student Relationship table
CREATE TABLE dbo.ParentStudentLinks(
    ParentStudentID int IDENTITY(1,1) NOT NULL,
    ParentID int NULL,
    StudentID int NULL,
    CONSTRAINT [PK_ParentStudent] PRIMARY KEY CLUSTERED ([ParentStudentID] ASC),
	CONSTRAINT [FK_Parent] FOREIGN KEY (ParentID)
	REFERENCES dbo.Users (UserID),
    CONSTRAINT [FK_Student] FOREIGN KEY (StudentID)
	REFERENCES dbo.Users (UserID)
);
GO

-- Create our main Bookings table
CREATE TABLE dbo.Bookings(
    BookingsID int IDENTITY(1,1) NOT NULL,
    TutorID int NULL,
	SubjectID int NULL,
    StudentLimit int NULL,
    StartTime datetime NULL,
    EndTime datetime NULL,
    Available bit NOT NULL DEFAULT 1,
    CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED ([BookingsID] ASC),
	CONSTRAINT [FK_Tutor] FOREIGN KEY (TutorID)
	REFERENCES dbo.Users (UserID),
    CONSTRAINT [FK_Subject] FOREIGN KEY (SubjectID)
	REFERENCES dbo.Subject (SubjectID)
);
GO

-- Create our Student Booking Link table
CREATE TABLE dbo.StudentBookingLinks(
    StudentBookingID int IDENTITY(1,1) NOT NULL,
    BookingsID int NULL,
    StudentID int NULL,
    CONSTRAINT [PK_StudentBooking] PRIMARY KEY CLUSTERED ([StudentBookingID] ASC),
	CONSTRAINT [FK_StudentBooking] FOREIGN KEY (StudentID)
	REFERENCES dbo.Users (UserID),
    CONSTRAINT [FK_Bookings] FOREIGN KEY (BookingsID)
	REFERENCES dbo.Bookings (BookingsID)
);
GO