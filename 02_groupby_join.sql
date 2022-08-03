/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name. If two or
more students both have names ending in the same last three characters
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

/*
Write a query that prints a list of employee names (i.e.: the name 
attribute) from the Employee table in alphabetical order.
*/

SELECT name
FROM Employee
ORDER BY name ASC;

/*
Write a query that prints a list of employee names (i.e.: the name
attribute) for employees in Employee having a salary greater than 
$2000 per month who have been employees for less than 10 months.
Sort your result by ascending employee_id.
*/

SELECT name
FROM Employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id ASC;

/*
Given the CITY and COUNTRY tables, query the names of all cities
where the CONTINENT is 'Africa'. Note: CITY.CountryCode and 
COUNTRY.Code are matching key columns.
*/

SELECT a.NAME
FROM CITY AS a
INNER JOIN COUNTRY AS b
    ON a.COUNTRYCODE = b.CODE
WHERE b.CONTINENT LIKE "Africa";

/*
Given the CITY and COUNTRY tables, query the names of all the 
continents (COUNTRY.Continent) and their respective average
city populations (CITY.Population) rounded down to the nearest integer.
*/

SELECT CONTINENT, AVG(a.POPULATION)
FROM CITY AS a
INNER JOIN COUNTRY AS b
    ON a.COUNTRYCODE = b.CODE
GROUP BY CONTINENT;
