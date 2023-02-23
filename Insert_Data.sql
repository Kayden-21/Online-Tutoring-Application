Insert INTO dbo.PersonType(Persontype)
VALUES ('Parent'),
       ('Student'),
       ('Tutor');

INSERT INTO dbo.Users (Email, FirstName, LastName, PersonTypeID)
VALUES ('eric@gmail.com', 'Eric', 'Cartman', 1),
       ('kenny@gmail.com', 'Kenny', 'McCormick', 2),
       ('stan@gmail.com', 'Stan', 'Marsh', 3),
       ('kyle@gmail.com', 'Kyle', 'Broflovski', 3),
       ('guy@gmail.com', 'guy', 'man', 2),
       ('naruto@gmail.com', 'naruto', 'uzumaki', 1),
       ('kayden@gmail.com', 'kayden', 'kara', 2);

INSERT INTO dbo.Subject (Grade, Name, Description)
VALUES (7, 'Science', 'Biology and all things living'),
       (12, 'Maths', 'Numbers and Stuff'),
       (8, 'Engineering', 'Mechanics and stuff'),
       (5, 'Physics', 'Gravity/Laws and stuff'),
       (4, 'Chemistry', 'Chemicals and stuff'),
       (2, 'Coding', 'Java and stuff'),
       (11, 'English', 'Shakespeare and stuff');

INSERT INTO dbo.Bookings (TutorID, SubjectID, StudentLimit, StartTime, EndTime)
VALUES (3,2,5,'20230618 10:34:09 AM','20120618 10:40:09 AM'),
       (4,1,3,'20230615 10:34:09 AM','20120615 10:40:09 AM'),
       (3,4,5,'20230605 10:34:09 AM','20120605 10:40:09 AM'),
       (4,3,8,'20230607 10:34:09 AM','20120607 10:40:09 AM');

INSERT INTO dbo.StudentBookingLinks (BookingsID,StudentID)
VALUES (1,2),
       (1,5),
       (2,7);

Insert INTO dbo.ParentStudentLinks (ParentID,StudentID)
VALUES (1,2),
       (6,5),
       (1,7);
