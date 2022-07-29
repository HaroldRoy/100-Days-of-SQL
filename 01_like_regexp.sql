/*
Query the list of CITY names starting with vowels (a, e, i, o, u)
from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[aeiou]%';

/*
Query the list of CITY names ending with vowels (a, e, i, o, u)
from STATION. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%[aeiou]';

/*
Query the list of CITY names from STATION which have
vowels (a, e, i, o, u) as both their first and last
character. Your result cannot duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[aeiou]%'
AND CITY LIKE '%[aeiou]';

/*
Query the list of CITY names from STATION that do not
start with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[aeiou]%';

/*
Query the list of CITY names from STATION that either do
not start with vowels or do not end with vowels. Your result
cannot contain duplicates
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[aeiou]%'
OR CITY NOT LIKE '%[aeiou]';

--Solution in MYSQL

MYSQL:

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOU]' 
OR CITY NOT REGEXP '[AEIOU]$';

ALSO

SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT (CITY, 1) NOT IN ('A','E', 'I', 'O', 'U') 
OR LEFT (CITY,1) IN ('A','E', 'I', 'O', 'U');