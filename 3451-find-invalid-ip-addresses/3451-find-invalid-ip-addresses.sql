# Write your MySQL query statement below
WITH RECURSIVE split AS(
    SELECT
        log_id,
        ip,
        SUBSTRING_INDEX(ip,'.',1) as octet,
        SUBSTRING(ip, LENGTH(SUBSTRING_INDEX(ip,'.',1)) + 2) AS rest
    FROM logs
    UNION ALL
    SELECT
        log_id,
        ip,
        SUBSTRING_INDEX(rest,'.',1),
        SUBSTRING(rest, LENGTH(SUBSTRING_INDEX(rest,'.',1)) + 2)
    FROM split
    WHERE rest<>''
),
check_invalid AS (
    SELECT
        log_id,
        ip,
        MAX(CAST(octet AS UNSIGNED) > 255 OR octet LIKE '0_%') AS is_invalid
    FROM split
    GROUP BY log_id,ip
    HAVING COUNT(*) <> 4
        OR is_invalid = 1
)
SELECT
    ip,
    COUNT(ip) AS invalid_count
FROM check_invalid
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC