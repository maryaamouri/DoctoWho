CREATE FUNCTION fnCompanions (@EpisodeId INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @CompanionList VARCHAR(MAX);

    SELECT @CompanionList = COALESCE(@CompanionList + ', ', '') + c.CompanyName
    FROM tblEpisodeCompanion ec
    INNER JOIN tblCompanion c ON c.CompanionId = ec.CompanionId
    WHERE ec.EpisodeId = @EpisodeId;

    RETURN @CompanionList;
END;
SELECT dbo.fnCompanions(12) AS CompanionName;
