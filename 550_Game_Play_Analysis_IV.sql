SELECT player_id
FROM (
    SELECT player_id,
    MIN(event_date) AS first_login,
    LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS next_login
    FROM Activity
) AS t
WHERE DATEDIFF(next_login, first_login) = 1;