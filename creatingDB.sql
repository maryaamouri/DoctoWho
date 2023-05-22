CREATE TABLE tblEnemy (
    EnemyId INT IDENTITY(1,1) PRIMARY KEY,
    EnemyName VARCHAR(50),
    [Description] TEXT
);

CREATE TABLE tblAuthor (
    AuthorId INT IDENTITY(1,1) PRIMARY KEY,
    AuthorName VARCHAR(50)
);

CREATE TABLE tblDoctor (
    DoctorId INT IDENTITY(1,1) PRIMARY KEY,
    DoctorNumber VARCHAR(10),
    DoctorName VARCHAR(50),
    BirthDate DATE,
    FirstEpisodeDate DATE,
    LastEpisodeDate DATE
);

CREATE TABLE tblEpisode (
    EpisodeId INT IDENTITY(1,1) PRIMARY KEY,
    EpisodeNumber INT,
    SeriesNumber INT,
    EpisodeType VARCHAR(50),
    Title VARCHAR(50),
    EpisodeDate DATE,
    AuthorId INT,
    DoctorId INT,
    Note TEXT,
    CONSTRAINT FK_EpisodeAuthor FOREIGN KEY (AuthorId) REFERENCES tblAuthor (AuthorId),
    CONSTRAINT FK_EpisodeDoctor FOREIGN KEY (DoctorId) REFERENCES tblDoctor (DoctorId)
);

CREATE TABLE tblEpisodeEnemy (
    EnemyId INT,
    EpisodeId INT,
    CONSTRAINT FK_EpisodeEnemy_Enemy FOREIGN KEY (EnemyId) REFERENCES tblEnemy (EnemyId),
    CONSTRAINT FK_EpisodeEnemy_Episode FOREIGN KEY (EpisodeId) REFERENCES tblEpisode (EpisodeId)
);
ALTER TABLE tblEpisodeEnemy
ADD EpisodeEnemyId INT IDENTITY(1,1) PRIMARY KEY;
CREATE TABLE tblCompanion (
    CompanionId INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName VARCHAR(50),
    WhoPlayed VARCHAR(50)
);

CREATE TABLE tblEpisodeCompanion (
    EpisodeId INT,
    CompanionId INT,
    CONSTRAINT FK_EpisodeCompanion_Companion FOREIGN KEY (CompanionId) REFERENCES tblCompanion (CompanionId),
    CONSTRAINT FK_EpisodeCompanion_Episode FOREIGN KEY (EpisodeId) REFERENCES tblEpisode (EpisodeId)
);
ALTER TABLE tblEpisodeCompanion
ADD lEpisodeCompanionId INT IDENTITY(1,1) PRIMARY KEY;
