SELECT Request_at AS Day,
ROUND(SUM(CASE WHEN Status != 'completed' THEN 1 ELSE 0 END)/COUNT(*),2) AS 'Cancellation Rate'
FROM Trips t
JOIN Users c ON t.Client_Id = c.Users_Id
JOIN Users d ON t.Driver_Id = d.Users_Id
WHERE c.Banned='No' AND d.Banned='No'
GROUP BY Request_at;