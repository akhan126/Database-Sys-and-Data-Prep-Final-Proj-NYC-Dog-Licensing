--Querry Dogs with Missing Breed Information
SELECT 
    d.dog_id,
    d.animal_name,
    b.breed_name,
    d.license_issued_date
FROM dogs d
LEFT JOIN breeds b
       ON d.breed_id = b.breed_id
WHERE b.breed_name IS NULL;

--Interpretation: This query uses a LEFT OUTER JOIN to identify
--dog records that have no matching breed entry in the BREEDS
--lookup table. The LEFT JOIN preserves all rows from the DOGS
-- table and inserts NULL values when no corresponding breed exists
--allowing analysts to detect missing or inconsistent reference data.
--This example demonstrates how outer joins support data-quality checks
--and highlight integrity issues in a relational schema.