-- Materialized view: Most common breed per ZIP code
CREATE MATERIALIZED VIEW mv_breed_counts_by_zip AS
SELECT 
    z.zip_code,
    b.breed_name,
    COUNT(*) AS num_dogs
FROM dogs d
JOIN breeds b ON d.breed_id = b.breed_id
JOIN zipcodes z ON d.zip_id = z.zip_id
GROUP BY z.zip_code, b.breed_name, b.breed_id;

--Refresh strategy
REFRESH MATERIALIZED VIEW mv_breed_counts_by_zip;

--Interpretation: This materialized view stores precomputed dog counts
--per breed and zip code improving performance for repeated analytical
--queries. Because the data is materialized physically, it must be
--refreshed when new dog records are loaded into the database.
--The REFRESH MATERIALIZED VIEW command regenerates the stored results,
--ensuring that the view remains synchronized with updates to the
--underlying tables. 