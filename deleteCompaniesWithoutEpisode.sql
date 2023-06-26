DELETE FROM tblCompanion
WHERE CompanionId NOT IN (
    SELECT ec.CompanionId
    FROM tblEpisodeCompanion ec
);
