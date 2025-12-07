--Single-table aggregation(GROUP BY)
CREATE VIEW DOGS_PER_BREED(Breed_id, Num_of_dogs)
AS SELECT 
        breed_id,
        COUNT(*) 
   FROM DOGS
   GROUP BY breed_id;

--Interpretation: This view groups tuples from the base table DOGS by
--breed_id and computes the number of dogs belonging to each breed. It
--serves as a virtual summary table that eliminates the need to repeat
--the GROUP BY aggregation in future queries. Analysts can now retrieve
--breed-level statistics directly from this view as if it were a base
--relation.
