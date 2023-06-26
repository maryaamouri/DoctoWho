INSERT INTO tblEnemy (EnemyName, [Description])
VALUES ('EnemyA', 'this is the description of EnemyA'),
       ('EnemyB', 'this is the description of EnemyB'),
       ('EnemyC', 'this is the description of EnemyC'),
       ('EnemyD', 'this is the description of EnemyD'),
       ('EnemyE', 'this is the description of EnemyE');
INSERT INTO tblAuthor (AuthorName)
VALUES ('Author 1'),
       ('Author 2'),
       ('Author 3'),
       ('Author 4'),
       ('Author 5');
INSERT INTO tblDoctor (DoctorNumber, DoctorName, BirthDate, FirstEpisodeDate, LastEpisodeDate)
VALUES ('9', 'DoctorA', '1964-02-16', '2005-03-26', '2005-06-18'),
       ('10', 'DoctorB', '1971-04-18', '2005-12-25', '2010-01-01'),
       ('11', 'DoctorC', '1982-10-28', '2010-04-03', '2013-12-25'),
       ('12', 'DoctorD', '1958-04-14', '2013-12-25', '2017-12-25'),
       ('13', 'DoctorE', '1982-06-17', '2017-12-25', '2022-10-31');
INSERT INTO tblCompanion (CompanyName, WhoPlayed)
VALUES ('Company 1', 'Player1'),
       ('Company 1', 'Player1'),
       ('Company 5', 'Player2'),
       ('Company 1', 'Player2'),
       ('Company 12', 'Player1');

INSERT INTO tblEpisode (EpisodeNumber, SeriesNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Note)
VALUES (1, 1, 'Regular', 'Title1', '2005-03-26', 10, 1, 'no notes'),
       (2, 1, 'Regular', 'Title2', '2005-04-02', 10, null, 'no notes'),
       (3, 1, 'Regular', 'Title1', '2005-04-09', 6, 5, 'notes A'),
       (4, 2, 'Regular', 'Title1', '2006-04-15', 6, 3, 'notes B'),
       (5, 2, 'Regular', 'Title15', '2006-04-22', 7, null, 'notes D');

INSERT INTO tblEpisodeEnemy (EnemyId, EpisodeId)
VALUES (6, 11),
       (7, 11),
       (7, 12),
       (8, 13),
       (9, 13);
INSERT INTO tblEpisodeCompanion (EpisodeId, CompanionId)
VALUES (10, 4),
(11, 6),
(12, 6),
(14, 1),
(13, 8);
      

