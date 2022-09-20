/*
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N)
in STATION is greater than 38.7780. Round your answer to  decimal places.
*/

-- Weather Observation Station 17
SELECT CAST(LONG_W AS decimal(16, 4)) as western_longitude
FROM STATION
WHERE  LAT_N = (SELECT MIN(LAT_N)
        FROM STATION
        WHERE LAT_N > 38.7780);