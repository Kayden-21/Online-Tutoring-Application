CREATE PROCEDURE getUserType(@UserID int) AS 
    BEGIN
        return SELECT Persontype FROM PersonType WHERE PersonTypeID = (SELECT PersonTypeID FROM Users WHERE UserID = @UserID)
    END
GO;

CREATE PROCEDURE bookLesson(@BookingID int, @UserID int) AS
    BEGIN
        IF (getUserType(@UserID) = 'parent')
        INSERT INTO StudentBookingLinks (BookingID, StudentID)
        VALUES (@BookingID, (SELECT StudentID FROM ParentStudentLinks WHERE ParentID = @UserID))
    END
GO;

CREATE PROCEDURE unbookLesson (@UserID int, @BookingID int) AS
    BEGIN
        IF (getUserType(@UserID) = 'parent')
        DELETE FROM StudentBookingLinks WHERE StudentID = (SELECT StudentID FROM ParentStudentLinks WHERE ParentID = @UserID)
    END
GO;

CREATE PROCEDURE createLesson(@UserID int, @SubjectID int, @StudentLimit int, @StartTime datetime, @EndTime datetime) AS
    BEGIN
        IF (getUserType(@UserID) = 'tutor')
        INSERT INTO Bookings (TutorID, SubjectID, StudentLimit, StartTime, EndTime)
        VALUES (@UserID, @SubjectID, @StudentLimit, @StartTime, @EndTime)
    END
GO;

CREATE PROCEDURE cancelLesson (@UserID int, @BookingID int) AS
    BEGIN
        IF (getUserType(@UserID) = 'tutor')
        UPDATE Bookings SET Available = 0 WHERE BookingID = BookingId
    END
GO;