UPDATE tblEpisode
SET Title = CONCAT(Title, '_CANCELLED')
WHERE EpisodeId IN (
    SELECT e.EpisodeId
    FROM tblEpisode e
    LEFT JOIN tblDoctor d ON e.DoctorId = d.DoctorId
    WHERE d.DoctorId IS NULL
);
