/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N)
in STATION that is less than 137.2345. Round your answer to 4 decimal places.
*/

--Weather Observation Station 15

SELECT CAST(LONG_W AS decimal(18, 4)) AS longitude
FROM Station
WHERE LAT_N = (SELECT MAX(LAT_N)
               FROM Station
               WHERE LAT_N < 137.2345);