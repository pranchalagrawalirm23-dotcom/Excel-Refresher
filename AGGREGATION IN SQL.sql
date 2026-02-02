

SHOW DATABASES;
USE world;
SHOW TABLES;
SELECT COUNT(*) FROM country;

ANSWER 1

SELECT country.Name, COUNT(city.ID)
FROM country, city
WHERE country.Code = city.CountryCode
GROUP BY country.Name;

ANSWER 2

SELECT Continent, COUNT(Code) AS total_countries
FROM country
GROUP BY Continent
HAVING COUNT(Code) > 30;

ANSWER 3

SELECT Region, SUM(Population)
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;

ANSWER 4

SELECT Continent, AVG(GNP)
FROM country
GROUP BY Continent
ORDER BY AVG(GNP) DESC
LIMIT 5;

ANSWER 5

SELECT country.Continent, COUNT(countrylanguage.Language)
FROM country, countrylanguage
WHERE country.Code = countrylanguage.CountryCode
AND countrylanguage.IsOfficial = 'T'
GROUP BY country.Continent;

ANSWER 6

SELECT Continent, MAX(GNP), MIN(GNP)
FROM country
GROUP BY Continent;

ANSWER 7

SELECT country.Name, AVG(city.Population)
FROM country, city
WHERE country.Code = city.CountryCode
GROUP BY country.Name
ORDER BY AVG(city.Population) DESC
LIMIT 1;

ANSWER 8

SELECT country.Continent, AVG(city.Population)
FROM country, city
WHERE country.Code = city.CountryCode
GROUP BY country.Continent
HAVING AVG(city.Population) > 200000

ANSWER 9

SELECT Continent, SUM(Population), AVG(LifeExpectancy)
FROM country
GROUP BY Continent
ORDER BY AVG(LifeExpectancy) DESC;

ANSWER 10

SELECT Continent, SUM(Population), AVG(LifeExpectancy)
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AVG(LifeExpectancy) DESC
LIMIT 3;
