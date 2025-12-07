--Add a column for dog age
ALTER TABLE dogs
ADD COLUMN dog_age INT;

--Populate a derived column for dog age
UPDATE dogs
SET dog_age = EXTRACT(YEAR FROM CURRENT_DATE) - animal_birth_year;

--Interpretation: This example demonstrates how to add a derived metric
--to an existing table using ALTER TABLE followed by UPDATE. The new
--column dog_age is computed by subtracting each dog's birth year from
--the current calender year, creating a meaningful attribute for
--age-based analysis. This approach shows how derived metrics can be
--incorporated into a relational schema to support richer analytical
--queries.
