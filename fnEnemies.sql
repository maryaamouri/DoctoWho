CREATE FUNCTION fnEnemies (@EpisodeId INT)
RETURNS TABLE 
AS
RETURN (
    SELECT STRING_AGG(EnemyName , ', ') AS ConcatenatedValues
    FROM (
        SELECT en.EnemyName 
        FROM tblEpisode e
        INNER JOIN tblEpisodeEnemy ee ON e.EpisodeId = ee.EpisodeId
        INNER JOIN tblEnemy en ON ee.EnemyId = en.EnemyId
        WHERE ee.EpisodeId = @EpisodeId
    ) AS subquery
);

SELECT ConcatenatedValues
FROM dbo.fnEnemies(11);
