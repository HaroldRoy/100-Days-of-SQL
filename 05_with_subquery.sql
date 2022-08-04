/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id,
name, and the total number of challenges created by each student. Sort your results by the total
number of challenges in descending order. If more than one student created the same number of
challenges, then sort the result by hacker_id. If more than one student created the same number
of challenges and the count is less than the maximum number of challenges created, then exclude
those students from the result.
*/

-- Challenges
WITH num_challenges AS
(
SELECT  ch.hacker_id AS id,
        ha.name AS name,
        COUNT(ch.hacker_id) AS counter
FROM Hackers AS ha
INNER JOIN CHALLENGES AS ch
    ON ch.hacker_id = ha.hacker_id
GROUP BY ch.hacker_id, ha.name
)
SELECT  id,
        name,
        counter
FROM num_challenges
WHERE counter = (
                SELECT max(counter) 
                FROM num_challenges               
                )
OR
COUNTER IN (
            SELECT counter
            FROM num_challenges
            GROUP BY counter
            HAVING COUNT(counter) = 1
            )
ORDER BY counter DESC, id;