/*
Samantha interviews many candidates from different colleges using coding
challenges and contests. Write a query to print the contest_id, hacker_id,
name, and the sums of total_submissions, total_accepted_submissions,
total_views, and total_unique_views for each contest sorted by contest_id.
Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one
college, but each college only holds 1 screening contest.
*/

-- Interviews
WITH SUM_View_Stats
AS (
SELECT  challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
FROM View_Stats 
GROUP BY challenge_id
),
SUM_Submission_Stats
AS (
SELECT  challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
FROM Submission_Stats 
GROUP BY challenge_id
)
SELECT  con.contest_id,
        con.hacker_id,
        con.name,
        SUM(total_submissions),
        SUM(total_accepted_submissions),
        SUM(total_views),
        SUM(total_unique_views)
FROM Contests AS con
INNER JOIN Colleges col
    ON con.contest_id = col.contest_id
INNER JOIN Challenges AS cha
    ON cha.college_id = col.college_id
LEFT JOIN SUM_View_Stats AS vs
    ON vs.challenge_id = cha.challenge_id
LEFT JOIN SUM_Submission_Stats AS ss
    ON ss.challenge_id = cha.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING (SUM(total_submissions) +
        SUM(total_accepted_submissions) +
        SUM(total_views) +
        SUM(total_unique_views)) <> 0
ORDER BY con.contest_ID

/* Look at the sample input in the problem statement. In the table Challenges there is a challenge_id 18765.
This ID is not present in the Submission_Stats table, but is present in the View_Stats table. So, if you do
the inner join on Challenges and Submissions_Stats first, there will be no rows with challenge_id 18765 in
the result set. And when you do the second inner join with Vew_Stats table, the rows with challenge_id 18765
in it will not be regarded.
If you do the left join, the rows with challege_id 18765 from the Challenges table (the left table) will be
preserved in the result set even if there are no rows with this id in the rgiht table.  