/*
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark.
Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report
must be in descending order by grade -- i.e. higher grades are entered first. If there is 
more than one student with the same grade (8-10) assigned to them, order those particular
students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as
their name and list them by their grades in descending order. If there is more than one student
with the same grade (1-7) assigned to them, order those particular students by their marks in
ascending order. Write a query to help Eve.
*/

SELECT  IIF(Grade<8, NULL, a.Name),
        b.Grade,
        a.Marks
FROM Students AS a
INNER JOIN Grades AS b
    ON a.Marks BETWEEN b.Min_mark AND b.Max_Mark
ORDER BY Grade Desc, Name ASC;

--Using Case
SELECT  CASE
            WHEN Grade < 8
            THEN NULL
            WHEN Grade >= 8
            THEN a.Name
        END,
        b.Grade,
        a.Marks
FROM Students AS a
INNER JOIN Grades AS b
    ON a.Marks BETWEEN b.Min_mark AND b.Max_Mark
ORDER BY Grade Desc, Name ASC;

/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard!
Write a query to print the respective hacker_id and name of hackers who achieved full scores for
more than one challenge. Order your output in descending order by the total number of challenges in
which the hacker earned a full score. If more than one hacker received full scores in same number of
challenges, then sort them by ascending hacker_id.
*/

SELECT a.hacker_id, a.name
FROM Hackers AS a
INNER JOIN Submissions AS b
    ON a.hacker_id = b.hacker_id
INNER JOIN Challenges AS c
    ON b.challenge_id = c.challenge_id
INNER JOIN Difficulty AS d
    ON c.difficulty_level = d.difficulty_level
WHERE d.score = b.score
GROUP BY a.hacker_id, a.name
HAVING COUNT(a.hacker_id) > 1
ORDER BY COUNT(a.hacker_id) DESC,
    a.hacker_id ASC;