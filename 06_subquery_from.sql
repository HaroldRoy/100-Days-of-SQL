/*
You did such a great job helping Julia with her last coding contest challenge that she
wants you to work on this one, too! The total score of a hacker is the sum of their
maximum scores for all of the challenges. Write a query to print the hacker_id, name,
and total score of the hackers ordered by the descending score. If more than one hacker
achieved the same total score, then sort the result by ascending hacker_id. Exclude all
hackers with a total score of  from your result.
*/

-- Contest Leaderboard
SELECT  h.hacker_id,
        h.name,
        SUM(max_score) 
FROM(
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
    ) AS t
JOIN Hackers AS h
    ON t.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(t.max_score) > 0
ORDER BY SUM(t.max_score) DESC, h.hacker_id ASC;