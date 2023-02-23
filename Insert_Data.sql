Insert INTO dbo.PersonType(Persontype)
VALUES ('Parent'),
       ('Student'),
       ('Tutor');

INSERT INTO dbo.Users (Email, FirstName, LastName, PersonTypeID)
VALUES ('eric@gmail.com', 'Eric', 'Cartman', 1),
       ('kenny@gmail.com', 'Kenny', 'McCormick', 2),
       ('stan@gmail.com', 'Stan', 'Marsh', 3),
       ('kyle@gmail.com', 'Kyle', 'Broflovski', 3);
