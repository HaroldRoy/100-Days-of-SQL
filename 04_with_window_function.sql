/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to
buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power
of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has
same power, sort the result in order of descending age.
*/

-- Ollivander's Inventory
WITH min_coins_wand AS
(
SELECT  wa.id,
        wp.age,
        wa.coins_needed,
        wa.power,
        MIN(wa.coins_needed) OVER(
                        PARTITION BY wp.age, wa.power
                        ORDER BY wa.coins_needed
                        ) AS min_coins
FROM Wands AS wa
LEFT JOIN Wands_Property AS wp
    ON wa.code = wp.code
WHERE wp.is_evil = 0
)
SELECT id, age, coins_needed, power
FROM min_coins_wand
WHERE coins_needed = min_coins
ORDER BY power DESC, age DESC;