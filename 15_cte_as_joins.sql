/*
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016
and the end date was March 15, 2016.
Write a query to print total number of unique hackers who made at least 1 submission each day (starting
on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number
of submissions each day. If more than one such hacker has a maximum number of submissions, print the
lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.
*/

-- 15 Days of learning SQL
WITH cte
AS (
    SELECT s.hacker_id,
           s.submission_date,
           1 AS cnt
    FROM submissions AS s
    WHERE s.submission_date = '20160301'
    UNION ALL
    SELECT s2.hacker_id,
           s2.submission_date,
           1 AS cnt
    FROM cte
    JOIN submissions s2
        ON cte.hacker_id = s2.hacker_id
        AND cte.submission_date = Dateadd(day, -1, s2.submission_date)
),
tbl
AS (
    SELECT DISTINCT *
	FROM   cte
),
pts
AS (
    SELECT  s3.submission_date,
			s3.hacker_id,
			h2.name,
			COUNT(*)
			tt,
			ROW_NUMBER() OVER(
				PARTITION BY s3.submission_date
				ORDER BY Count(*) DESC, s3.hacker_id),
			pt
	FROM submissions AS s3
	JOIN hackers h2
		ON s3.hacker_id = h2.hacker_id
	GROUP  BY  s3.submission_date,
			   s3.hacker_id,
			   h2.NAME
)	
SELECT tbl.submission_date,
       SUM(cnt),
       MAX(pts.hacker_id),
       MAX(pts.NAME)
FROM tbl
JOIN pts
    ON tbl.submission_date = pts.submission_date
WHERE pts.pt = 1
GROUP BY tbl.submission_date
ORDER BY 1 ASC;