/*
Query comparation.
*/

-- Subquery in the where clause
SELECT  name,
        salary
FROM People
WHERE name IN (SELECT DISTINCT name
                FROM Population
                WHERE country = "Canada"
                    AND city = "Toronto")
    AND salary >= (SELECT AVG(salary)
                    FROM Salaries
                    WHERE gender = "Female")

--CTE
WITH toronto_people AS
(
SELECT DISTINCT name
FROM Population
WHERE country = "Canada"
    AND city = "Toronto"    
)
, avg_female_salary AS
(
SELECT AVG(salary) as avg_salary
FROM Salaries
WHERE gender = "Female"
)

SELECT  name,
        salary
FROM People
WHERE name IN (SELECT DISTINCT
                FROM toronto_people)
    AND salary >= (SELECT avg_salary
                FROM avg_female_salary)