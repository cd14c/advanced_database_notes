--Lesson 10 SQLBolt--
SELECT MAX(Years_employed) FROM employees;

SELECT Role, AVG(Years_employed) FROM employees GROUP BY Role;

SELECT Building, SUM(Years_employed) FROM employees GROUP BY Building;

--Lesson 11 SQLBolt--
SELECT COUNT(*) FROM employees WHERE Role = 'Artist';

SELECT Role, COUNT(*) FROM employees GROUP BY Role;

SELECT SUM(Years_employed) FROM employees WHERE Role = 'Engineer';

--FreeSQL Try it 1--

select COUNT(DISTINCT shape) AS number_of_shapes,
       STDDEV(DISTINCT WEIGHT) AS distinct_weight_stddev
from   bricks;

select shape, SUM(WEIGHT) AS shape_weight
from   bricks
GROUP BY shape ORDER BY shape ASC;

select shape, sum ( weight )
from   bricks
HAVING sum(weight) < 4
group  by shape;