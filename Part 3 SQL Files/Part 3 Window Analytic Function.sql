--Ranking the most common breeds within each ZIP code
SELECT 
    z.zip_code,
    b.breed_name,
    COUNT(*) AS num_dogs,
    RANK() OVER (
        PARTITION BY z.zip_code 
        ORDER BY COUNT(*) DESC
    ) AS breed_rank
FROM dogs d
JOIN breeds b ON d.breed_id = b.breed_id
JOIN zipcodes z ON d.zip_id = z.zip_id
GROUP BY z.zip_code, b.breed_name, b.breed_id;

--Interpretation: This query uses the analytic function RANK()
--with a PARTION BY clause to rank dog breeds within each ZIP code
--based on their frequency. The window function evaluates the ranking
--after aggregation, without colapsing ZIP codes into a single group.
--This demonstrates how analytic queries can reveal local patterns
--such as the most common breed per ZIP while preserving detailed
--row-level structure.