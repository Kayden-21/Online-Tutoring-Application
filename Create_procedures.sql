--  1. Create Lesson (Tutor Side)
CREATE PROCEDURE createLesson(@UserID int, @SubjectID int, @StudentLimit int, @StartTime datetime, @EndTime datetime) AS
    BEGIN
        IF (dbo.getUserType(@UserID) = 'tutor')
        INSERT INTO Bookings (TutorID, SubjectID, StudentLimit, StartTime, EndTime)
        VALUES (@UserID, @SubjectID, @StudentLimit, @StartTime, @EndTime)
    END

--  2. Cancel Lesson (Tutor Side)
CREATE PROCEDURE cancelLesson (@UserID int, @BookingsID int) AS
    BEGIN
        IF (dbo.getUserType(@UserID) = 'tutor')
        UPDATE Bookings SET Available = 0 WHERE BookingsID = BookingsId
    END

--  3. Book Lesson (Parent Side)
CREATE PROCEDURE bookLesson(@BookingsID int, @UserID int) AS
    BEGIN
        IF (dbo.getUserType(@UserID) = 'parent' 
        AND (SELECT COUNT(*) FROM StudentBookingLinks WHERE BookingsID = @BookingsID) < (SELECT StudentLimit FROM Bookings WHERE BookingsID = @BookingsID))
        INSERT INTO StudentBookingLinks (BookingsID, StudentID)
        VALUES (@BookingsID, (SELECT StudentID FROM ParentStudentLinks WHERE ParentID = @UserID))
    END;

--  4. Un-book Lesson (Parent Side)
CREATE PROCEDURE unbookLesson (@UserID int, @BookingsID int) AS
    BEGIN
        IF (dbo.getUserType(@UserID) = 'parent')
        DELETE FROM StudentBookingLinks WHERE StudentID = (SELECT StudentID FROM ParentStudentLinks WHERE ParentID = @UserID) AND @BookingsID = BookingsID
    END
