CREATE FUNCTION fnAuthorName (@AuthorId INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @AuthorName VARCHAR(100);
    
    SELECT @AuthorName = STRING_AGG(AuthorName , ', ')
    FROM (
        SELECT a.AuthorName 
        FROM tblAuthor a
        INNER JOIN tblEpisode e ON a.AuthorId = e.AuthorId
        WHERE a.AuthorId = @AuthorId
    ) AS subquery;
    
    RETURN @AuthorName;
END;

CREATE FUNCTION fnDoctorName (@DoctorId INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @DoctorName VARCHAR(100);
    
    SELECT @DoctorName = STRING_AGG(DoctorName , ', ')
    FROM (
        SELECT d.DoctorName 
        FROM tblEpisode e
        INNER JOIN tblDoctor d ON e.DoctorId = d.DoctorId
        WHERE d.DoctorId = @DoctorId
    ) AS subquery;
    
    RETURN @DoctorName;
END;
CREATE FUNCTION fnCompanions (@EpisodeId INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @ConcatenatedValues VARCHAR(100);
    
    SELECT @ConcatenatedValues = STRING_AGG(CompanyName , ', ')
    FROM (
        SELECT c.CompanyName 
        FROM tblEpisodeCompanion ec INNER JOIN tblCompanion c 
        ON c.CompanionId = ec.CompanionId
        WHERE ec.EpisodeId = @EpisodeId
    ) AS subquery;
    
    RETURN @ConcatenatedValues;
END;
CREATE FUNCTION fnEnemies (@EpisodeId INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @ConcatenatedValues VARCHAR(100);
    
    SELECT @ConcatenatedValues = STRING_AGG(EnemyName , ', ')
    FROM (
        SELECT en.EnemyName 
        FROM tblEpisode e
        INNER JOIN tblEpisodeEnemy ee ON e.EpisodeId = ee.EpisodeId
        INNER JOIN tblEnemy en ON ee.EnemyId = en.EnemyId
        WHERE ee.EpisodeId = @EpisodeId
    ) AS subquery;
    
    RETURN @ConcatenatedValues;
END;

CREATE VIEW viewEpisodes AS
SELECT
    e.EpisodeId,
    e.EpisodeNumber,
    e.SeriesNumber,
    e.EpisodeType,
    e.Title,
    e.EpisodeDate,
    dbo.fnAuthorName(e.AuthorId) AS AuthorName,
    dbo.fnDoctorName(e.DoctorId) AS DoctorName,
    dbo.fnCompanions(e.EpisodeId) AS Companions,
    dbo.fnEnemies(e.EpisodeId) AS Enemies
FROM
    tblEpisode e;
	
SELECT * FROM viewEpisodes;