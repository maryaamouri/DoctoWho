CREATE FUNCTION fnEnemies (@EpisodeId INT)
RETURNS TABLE 
AS
RETURN (
SELECT en.EnemyName 
FROM tblEpisode e INNER JOIN tblEpisodeEnemy ee 
ON e.EpisodeId = ee.EpisodeId
INNER JOIN tblEnemy en ON ee.EnemyId=en.EnemyId
WHERE ee.EpisodeId = @EpisodeId
);

SELECT STRING_AGG(EnemyName, ', ') AS ConcatenatedValues
FROM fnEnemies(11);
