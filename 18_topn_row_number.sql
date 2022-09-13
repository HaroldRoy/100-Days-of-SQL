/*
Query the top 5 publisher channels per total impressions in the
reporting_table
*/

--Top 5
WITH rank_all AS
(
SELECT  campaign_name,
        publisher_channel,
        SUM(impressions) as total_impressions
FROM reporting_table
GROUP BY 1, 2
ORDER BY 3 DESC
),
top_5 AS
(
SELECT  campaign_name,
        publisher_channel,
        total_impressions,
        ROW_NUMBER() OVER (PARTITION BY campaign_name ORDER BY total_impressions DESC) AS impressions_rank
FROM rank_all
)
SELECT *
FROM top_5
WHERE impressions_rank <= 5;