--  1. Get Number of Students in Booking
CREATE FUNCTION NumberOfStudentInBooking(@bookingid as int)
RETURNS int
AS
BEGIN
    DECLARE @studentnum int
    SELECT @studentnum = count(*)
    FROM StudentBookingLinks
    WHERE BookingsID = @bookingid

    RETURN @studentnum
END;

-- 2. Get Person Type of a user
CREATE FUNCTION getUserType(@UserID as int)
RETURNS varchar(120)
AS
BEGIN
    DECLARE @UserType as VARCHAR(120)
    SELECT @UserType = Persontype
    FROM dbo.PersonType
    WHERE PersonTypeID = (SELECT PersonTypeID FROM dbo.Users WHERE UserID = @UserID)

    RETURN @UserType
END;