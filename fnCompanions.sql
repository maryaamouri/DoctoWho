CREATE FUNCTION fnCompanions (@EpisodeId INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @Companions VARCHAR(MAX);
    SELECT @Companions = COALESCE(@Companions + ', ', '') + c.CompanyName
    FROM tblEpisodeCompanion e
    INNER JOIN 
	tblCompanion c 
	ON c.CompanionId = e.CompanionId
    WHERE e.EpisodeId = @EpisodeId;
    RETURN @Companions;
END;

SELECT dbo.fnCompanions(8) AS CompanionName;
SELECT * FROM tblCompanion;