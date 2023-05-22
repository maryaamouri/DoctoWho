CREATE PROCEDURE spSummariseEpisodes
AS
BEGIN

	SELECT TOP 3 c.CompanionId, c.CompanyName, COUNT(ec.CompanionId) AS AppearanceCount
	FROM tblEpisodeCompanion ec
	JOIN tblCompanion c ON c.CompanionId = ec.CompanionId
	GROUP BY c.CompanionId, c.CompanyName
	ORDER BY AppearanceCount DESC;

	SELECT TOP 3 en.EnemyId, en.EnemyName, COUNT(*) AS AppearanceCount
	FROM tblEpisodeEnemy ee
	INNER JOIN tblEnemy en ON ee.EnemyId = en.EnemyId
	GROUP BY en.EnemyId, en.EnemyName
	ORDER BY AppearanceCount DESC;

END;

