/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name.
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two
columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than
them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no
two students got same salary offer.
*/

SELECT st.Name
FROM Students as st
JOIN Friends as fr
    ON st.ID = fr.ID
JOIN Packages as pa
    ON fr.ID = pa.ID
JOIN Packages as pa2
    ON fr.Friend_ID = pa2.ID
WHERE pa.Salary < pa2.Salary
ORDER BY pa2.Salary;