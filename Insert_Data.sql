Insert INTO dbo.PersonType(Persontype)
VALUES ('Parent'),
       ('Student'),
       ('Tutor');
GO

INSERT INTO dbo.Users (Email, FirstName, LastName, PersonTypeID)
VALUES ('eric@gmail.com', 'Eric', 'Cartman', 1),
       ('kenny@gmail.com', 'Kenny', 'McCormick', 2),
       ('stan@gmail.com', 'Stan', 'Marsh', 3),
       ('kyle@gmail.com', 'Kyle', 'Broflovski', 3),
       ('guy@gmail.com', 'guy', 'man', 2),
       ('naruto@gmail.com', 'naruto', 'uzumaki', 1),
       ('boruto@gmail.com', 'boruto', 'uzumaki', 2),
       ('hima@gmail.com', 'himawari', 'uzumaki', 2),
       ('kayden@gmail.com', 'kayden', 'kara', 2),
       ('rick@gmail.com', 'rick', 'astly', 2),
       ('bob@gmail.com', 'bob', 'builder', 2),
       ('rob@gmail.com', 'rob', 'builder', 2),
       ('noel@gmail.com', 'noel', 'builder', 1),
       ('nick@gmail.com', 'nick', 'astly', 1),
       ('mr@gmail.com', 'mr', 'smith', 3),
       ('sam@gmail.com', 'sam', 'astly', 3);
GO

INSERT INTO dbo.Subject (Grade, Name, Description)
VALUES (7, 'Science', 'Biology and all things living'),
       (12, 'Maths', 'Numbers and Stuff'),
       (8, 'Engineering', 'Mechanics and stuff'),
       (5, 'Physics', 'Gravity/Laws and stuff'),
       (4, 'Chemistry', 'Chemicals and stuff'),
       (2, 'Coding', 'Java and stuff'),
       (11, 'English', 'Shakespeare and stuff'),
       (12, 'English', 'Shakespeare and stuff'),
       (12, 'Coding', 'Java and stuff'),
       (12, 'Chemistry', 'Chemicals and stuff')
       ;
GO

INSERT INTO dbo.Bookings (TutorID, SubjectID, StudentLimit, StartTime, EndTime)
VALUES (3,2,5,'20230618 10:34:09 AM','20120618 10:40:09 AM'),
       (4,1,3,'20230615 10:34:09 AM','20120615 10:40:09 AM'),
       (3,4,5,'20230605 10:34:09 AM','20120605 10:40:09 AM'),
       (3,4,5,'20230605 10:34:09 AM','20120605 10:40:09 AM'),
       (3,2,15,'20230301 03:00:00 PM','20120307 05:00:00 PM'),
       (4,8,10,'20230301 03:00:00 PM','20120307 05:00:00 PM'),
       (4,9,10,'20230302 03:00:00 PM','20120307 05:00:00 PM'),
       (3,10,20,'20230302 03:00:00 PM','20120307 05:00:00 PM')
       ;
GO

INSERT INTO dbo.StudentBookingLinks (BookingsID,StudentID)
VALUES (1,2),
       (1,5),
       (2,7),
       (dbo.getUserID('rick@gmail.com'), 1),
       (dbo.getUserID('rick@gmail.com'), 5),
       (dbo.getUserID('rick@gmail.com'), 6),
       (dbo.getUserID('rick@gmail.com'), 8),
       (dbo.getUserID('nick@gmail.com'), 5),
       (dbo.getUserID('nick@gmail.com'), 7),
       (dbo.getUserID('nick@gmail.com'), 8),
       (dbo.getUserID('hima@gmail.com'), 5)
       ;

Insert INTO dbo.ParentStudentLinks (ParentID,StudentID)
VALUES (1,2),
       (6,5),
       (1,7),
       (dbo.getUserID('sam@gmail.com'),dbo.getUserID('rick@gmail.com')),
       (dbo.getUserID('sam@gmail.com'),dbo.getUserID('nick@gmail.com')),
       (dbo.getUserID('noel@gmail.com'),dbo.getUserID('rob@gmail.com')),
       (dbo.getUserID('noel@gmail.com'),dbo.getUserID('bob@gmail.com')),
       (dbo.getUserID('naruto@gmail.com'),dbo.getUserID('boruto@gmail.com')),
       (dbo.getUserID('naruto@gmail.com'),dbo.getUserID('hima@gmail.com'));
GO
