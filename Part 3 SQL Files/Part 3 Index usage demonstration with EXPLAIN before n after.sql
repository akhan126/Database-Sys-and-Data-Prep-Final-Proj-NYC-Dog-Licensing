--Index-usage demonstration with EXPLAIN (before/after)

--Query performance before creating the index
EXPLAIN ANALYZE
SELECT *
FROM dogs
WHERE license_issued_date >= '2020-01-01';

--Create the index
CREATE INDEX idx_license_issued_date
ON dogs (license_issued_date);

--Query performance after creating the index
EXPLAIN ANALYZE
SELECT *
FROM dogs
WHERE license_issued_date >= '2020-01-01';

--Interpretation: This demonstration compares a SELECT query run before
--and after creating an index on the license_issued_date column of the 
--DOGS table. The first EXPLAIN ANALYZE typically shows a sequential scan,
--indicating that PostgreSQL must read the entire table to evaluate the
--filter condition. After adding the index, the query planner switches to 
--an index-based scan, lowering query cost and improving performance,
-- which illustrates the effectiveness of indexing frequently filtered columns.
