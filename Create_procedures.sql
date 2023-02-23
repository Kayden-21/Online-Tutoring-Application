--  1. Create Lesson (Tutor Side)
CREATE PROCEDURE createLesson(@UserID int, @SubjectID int, @StudentLimit int, @StartTime datetime, @EndTime datetime) AS
    BEGIN
        IF (dbo.getUserType(@UserID) = 'Tutor')
        INSERT INTO Bookings (TutorID, SubjectID, StudentLimit, StartTime, EndTime)
        VALUES (@UserID, @SubjectID, @StudentLimit, @StartTime, @EndTime)
    END

--  2. Cancel Lesson (Tutor Side)
CREATE PROCEDURE cancelLesson (@UserID int, @BookingsID int) AS
    BEGIN
        IF (dbo.getUserType(@UserID) = 'Tutor')
        UPDATE Bookings SET Available = 0 WHERE BookingsID = BookingsId
    END

--  3. Book Lesson (Parent Side)
CREATE PROCEDURE bookLesson(@BookingsID int, @ParentID int, @StudentID int) AS
    BEGIN
        IF (dbo.getUserType(@ParentID) = 'Parent')
        INSERT INTO StudentBookingLinks (BookingsID, StudentID)
        VALUES (@BookingsID, @StudentID)
    END;

--  4. Un-book Lesson (Parent Side)
CREATE PROCEDURE unbookLesson (@ParentID int, @StudentID int, @BookingsID int) AS
    BEGIN
        IF (dbo.getUserType(@ParentID) = 'Parent') 
        DELETE FROM StudentBookingLinks 
        WHERE StudentID = @StudentID 
        AND ParentID = @ParentID 
        AND @BookingsID = BookingsID
    END
