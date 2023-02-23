--  1. Get Number of Students in Booking

IF OBJECT_ID (N'NumberOfStudentInBooking', N'FN') IS NOT NULL
    DROP FUNCTION NumberOfStudentInBooking;
GO

CREATE FUNCTION dbo.NumberOfStudentInBooking(@bookingid as int)
RETURNS int
AS
BEGIN
    DECLARE @studentnum int
    SELECT @studentnum = count(*)
    FROM StudentBookingLinks
    WHERE BookingsID = @bookingid

    RETURN @studentnum
END;
GO

-- 2. Get Person Type of a user

IF OBJECT_ID (N'getUserType', N'FN') IS NOT NULL
    DROP FUNCTION getUserType;
GO

CREATE FUNCTION dbo.getUserType(@UserID as int)
RETURNS varchar(120)
AS
BEGIN
    DECLARE @UserType as VARCHAR(120)
    SELECT @UserType = Persontype
    FROM dbo.PersonType
    WHERE PersonTypeID = (SELECT PersonTypeID FROM dbo.Users WHERE UserID = @UserID)

    RETURN @UserType
END;
GO


IF OBJECT_ID (N'getUserID', N'FN') IS NOT NULL
    DROP FUNCTION getUserID;
GO

CREATE FUNCTION dbo.getUserID(@UserEmail as varchar(120))
RETURNS int
AS
BEGIN
    DECLARE @ID AS INT
    SELECT @ID = U.UserID
    FROM Users U
    WHERE (U.Email = @UserEmail)

    Return @ID
END;
GO