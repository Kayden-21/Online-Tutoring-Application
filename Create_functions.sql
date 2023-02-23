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
END