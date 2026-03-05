--FreeSQL - Analytic Functions: Databases for Developers--
--First Try it--
select b.*,
       count(*) over (
         partition by shape
       ) bricks_per_shape,
       median ( weight ) over (
         partition by shape
       ) median_weight_per_shape
from   bricks b
order  by shape, weight, brick_id;

--Second Try it--
select b.brick_id, b.weight,
       round ( avg ( weight ) over (
         order by brick_id
       ), 2 ) running_average_weight
from   bricks b
order  by brick_id;

--Third Try it--
select b.*,
       min ( colour ) over (
         order by brick_id
         rows between 2 preceding and 1 preceding
       ) first_colour_two_prev,
       count (*) over (
         order by weight
         range between 1 preceding and 1 following
       ) count_values_this_and_next
from   bricks b
order  by weight;

--Fourth Try it--
with totals as (
  select b.*,
         sum ( weight ) over (
           partition by shape
         ) weight_per_shape,
         sum ( weight ) over (
           order by brick_id
         ) running_weight_by_id
  from   bricks b
)
select * from totals
where  weight_per_shape>4 AND running_weight_by_id>4
order  by brick_id

--datalemur - Top Three Salaries--
WITH max_salary AS (
  SELECT name, salary, department_id,
    DENSE_RANK() OVER (
      PARTITION BY department_id ORDER BY salary DESC) AS top_salary
  FROM employee
)

SELECT department_name, name, salary
FROM max_salary AS m
INNER JOIN department AS d
  ON m.department_id = d.department_id
WHERE top_salary <= 3
ORDER BY department_name ASC, salary DESC, name ASC;
