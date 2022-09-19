/*
Query the smallest Northern Latitude (LAT_N) from STATION that
is greater than 38.7780. Round your answer to  decimal places.
*/

--Weather Observation Station 16
SELECT CAST(MIN(LAT_N) AS decimal(16, 4))
FROM STATION
WHERE LAT_N > 38.7780;