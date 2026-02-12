--Lesson 1--
SELECT Title FROM movies;
SELECT Director FROM movies;
SELECT Title, Director FROM movies;
SELECT Title, Year FROM movies;
SELECT * FROM movies;

--Lesson 2--
SELECT * FROM movies WHERE id=6;
SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;
SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;
SELECT Title, Year FROM movies WHERE id BETWEEN 1 AND 5;

--Lesson 3--
SELECT * FROM movies WHERE Title LIKE 'Toy Story%';
SELECT * FROM movies WHERE Director = 'John Lasseter';
SELECT Title, Director FROM movies WHERE Director != 'John Lasseter';
SELECT * FROM movies WHERE Title LIKE 'WALL-_';

--Lesson 4--
SELECT DISTINCT Director FROM movies ORDER BY Director ASC;
SELECT * FROM movies ORDER BY Year DESC LIMIT 4;
SELECT * FROM movies ORDER BY Title ASC LIMIT 5;
SELECT * FROM movies ORDER BY Title ASC LIMIT 5 OFFSET 5;

--Review: SELECT Queries--
SELECT City, Population FROM north_american_cities WHERE Country = 'Canada';
SELECT * FROM north_american_cities WHERE Country = 'United States' ORDER BY Latitude DESC;
SELECT * FROM north_american_cities WHERE Longitude < -87.629798 ORDER BY Longitude ASC;
SELECT * FROM north_american_cities WHERE COUNTRY = 'Mexico' ORDER BY Population DESC LIMIT 2;
SELECT * FROM north_american_cities WHERE COUNTRY = 'United States' ORDER BY Population DESC LIMIT 2 OFFSET 2;
