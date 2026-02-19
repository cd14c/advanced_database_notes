--Lesson 6--
SELECT Title, Domestic_Sales, International_Sales
FROM Movies
INNER JOIN Boxoffice 
ON Movies.id = Boxoffice.Movie_id;

SELECT Title, Domestic_Sales, International_Sales
FROM Movies
INNER JOIN Boxoffice 
    ON Movies.id = Boxoffice.Movie_id
WHERE International_Sales > Domestic_Sales;

SELECT Title, Rating
FROM Movies
INNER JOIN Boxoffice 
    ON Movies.id = Boxoffice.Movie_id
ORDER BY Rating DESC;

--Lesson 7--
SELECT DISTINCT Building_name
FROM Buildings
INNER JOIN Employees
ON Building_name = Building;

SELECT Building_name, Capacity FROM Buildings;

SELECT DISTINCT Building_name, Role
FROM Buildings
LEFT JOIN Employees
ON Building_name = Building;

--Interview question--
SELECT * FROM pages
LEFT OUTER JOIN page_likes 
ON pages.page_id = page_likes.page_id
WHERE user_id IS NULL;