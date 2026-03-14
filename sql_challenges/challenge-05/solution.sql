--First Try it--
select colour from my_brick_collection
UNION
select colour from your_brick_collection
order by colour;

select shape from my_brick_collection
UNION ALL
select shape from your_brick_collection
order  by shape;

--Second Try it--
select shape from my_brick_collection
MINUS
select shape from your_brick_collection;

select colour from my_brick_collection
INTERSECT
select colour from your_brick_collection
order  by colour;
