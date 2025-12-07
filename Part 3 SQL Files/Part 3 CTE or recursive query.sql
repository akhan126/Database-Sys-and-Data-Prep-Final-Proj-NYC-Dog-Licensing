--Counting dogs licensed per year
WITH yearly_counts AS (
    SELECT 
        extract_year,
        COUNT(*) AS num_dogs
    FROM dogs
    GROUP BY extract_year
)
SELECT 
    extract_year,
    num_dogs
FROM yearly_counts
ORDER BY extract_year;

--Interpretaion: This query uses a Common Table Expression to separate
--the logic of computing dog counts per year from the final retrieval
--step. The CTE yearly_counts performs the aggregation, while the outer
--query selects from the intermediate result as if it were a temporary
--view. This structure improves readability and breaking a complex
--task into smaller, simpler, reusable parts when working with multi-step
--analytical queries.