-- Cleanup
DROP VIEW vAvailableLessons
DROP VIEW vBookedSessions
DROP VIEW vStudentBookings
DROP VIEW vTutorSessions
GO

--  1. Available Lessons (Parent Side)
 
CREATE VIEW vAvailableLessons
AS
SELECT 
    S.[Name] as [Subject],
    S.[Grade],
    B.[StudentLimit],
    Tutor.[FirstName],
    Tutor.[LastName],
    B.[StartTime],
    B.[EndTime],
    dbo.NumberOfStudentsInBooking(B.BookingsID) AS [StudentCount]
FROM Bookings B
INNER JOIN Subject S 
    ON S.SubjectID = B.SubjectID
INNER JOIN Users Tutor 
    ON Tutor.UserID = B.TutorID
WHERE (StartTime > GETDATE() AND B.Available = 1);
GO

--  2. Booked Sessions (Parent Side)

CREATE VIEW vBookedSessions 
AS
SELECT 
    [StudentID],
    B.[BookingsID],
    Student.[FirstName] as [StudentName],
	Tutor.[FirstName] AS [TutorFirstName],
	Tutor.[LastName] AS [TutorLastName],
    [Name] AS [Subject],
    [Grade],
	B.[StartTime],
	B.[EndTime],
    B.[Available]
FROM StudentBookingLinks
INNER JOIN Users Student 
    ON StudentBookingLinks.StudentID = Student.UserID
INNER JOIN Bookings B 
    ON StudentBookingLinks.BookingsID = B.BookingsID
INNER JOIN Subject 
    ON B.SubjectID = Subject.SubjectID
INNER JOIN Users Tutor 
    ON B.tutorID = Tutor.UserID
WHERE (B.StartTime > GETDATE())
GO

--  3. Booked Session (Student Side)
CREATE VIEW vStudentBookings 
AS
SELECT 
    [StudentID],
    B.[BookingsID],
	Tutor.[FirstName] AS [TutorFirstName],
	Tutor.[LastName] AS [TutorLastName],
    [Name] AS [Subject],
    [Grade],
	B.[StartTime],
	B.[EndTime],
    B.[Available]
FROM StudentBookingLinks
INNER JOIN Users Student 
    ON StudentBookingLinks.StudentID = Student.UserID
INNER JOIN Bookings B 
    ON StudentBookingLinks.BookingsID = B.BookingsID
INNER JOIN Subject 
    ON B.SubjectID = Subject.SubjectID
INNER JOIN Users Tutor 
    ON B.tutorID = Tutor.UserID
WHERE (B.StartTime > GETDATE())
GO

--  4. Tutor's Available Sessions
CREATE VIEW vTutorSessions
AS
SELECT 
    Tutor.[UserID] AS [TutorID],
    B.[StartTime],
    B.[EndTime],
    S.[Name] AS [Subject],
    S.[Grade],
    B.[StudentLimit],
    dbo.NumberOfStudentsInBooking(B.BookingsID) AS [StudentCount],
    B.[Available]
    
FROM Users Tutor
INNER JOIN Bookings B 
    ON B.TutorID = Tutor.UserID
INNER JOIN Subject S 
    ON S.SubjectID = B.SubjectID
GO