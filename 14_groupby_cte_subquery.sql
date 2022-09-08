/*
We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings
to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total
earnings for all employees as well as the total number of employees who have maximum total earnings. Then print
these values as  space-separated integers.
*/

--Top Earners
SELECT  TOP 1 (salary * months),
        COUNT(salary * months)
FROM Employee
GROUP BY (salary * months)
ORDER BY (salary * months) DESC;

--Using CTE's
WITH employee_max AS
(
SELECT  (salary * months) AS total_earnings
FROM Employee
)
SELECT TOP 1 total_earnings,
       COUNT(total_earnings)
FROM employee_max
GROUP BY total_earnings
ORDER BY total_earnings DESC;

--Using Subqueries
SELECT  MAX(salary * months),
        COUNT(*)
FROM Employee
WHERE (salary * months) = (SELECT MAX(salary*months)
                           FROM Employee
);