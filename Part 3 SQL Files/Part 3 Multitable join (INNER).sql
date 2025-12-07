SELECT 
    d.dog_id,
    d.animal_name,
    b.breed_name,
    z.zip_code,
    d.license_issued_date
FROM dogs d
INNER JOIN breeds b 
        ON d.breed_id = b.breed_id
INNER JOIN zipcodes z 
        ON d.zip_id = z.zip_id;
--This query demonstrates an INNER JOIN across three related tables
--DOGS, BREEDS, and ZIPCODES. It enriches each dog record by replacing
--foreign key identifiers with human-readable breed names and ZIP codes
--producing a unified and meaningful dataset. This multi-table join
--reflects how normalized relations can be combined to support practical
--reporting and analysis tasks.