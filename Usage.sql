
USE TutoringApplicationDB

SELECT * FROM Users Where UserID = (dbo.getUserID('jeff@gmail.com'));
GO

SELECT * FROM Subject
GO

DECLARE @TutorID AS INT
SELECT @TutorID = dbo.getUserID('jeff@gmail.com')

EXEC dbo.createLesson @TutorID, 6, 12, '20120301 05:00:00 PM', '20120301 06:00:00 PM';

SELECT * FROM dbo.Bookings Where TutorID = @TutorID

SELECT * FROM vAvailableLessons WHERE Grade = 12