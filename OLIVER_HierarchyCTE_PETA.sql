use DB_PETA_Hierarchy;

;WITH HierarchyCTE AS (

    SELECT ID, Name, LeaderID, 0 AS Rank 
	FROM Students WHERE LeaderID IS NULL UNION ALL

    SELECT S.ID, S.Name, S.LeaderID, H.Rank + 1 AS Rank
    FROM Students S INNER JOIN HierarchyCTE H ON S.LeaderID = H.ID
)

SELECT * FROM HierarchyCTE ORDER BY Rank, Name;