CREATE FUNCTION fnCompanions (@EpisodeId INT)
RETURNS TABLE 
AS
RETURN (
    SELECT STRING_AGG(CompanyName , ', ') AS ConcatenatedValues
    FROM (
        SELECT c.CompanyName 
        FROM tblEpisodeCompanion ec INNER JOIN tblCompanion c 
		ON c.CompanionId = ec.CompanionId
		WHERE ec.EpisodeId = @EpisodeId) AS subquery
);

SELECT *
FROM dbo.fnCompanions(11);
