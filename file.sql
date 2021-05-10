SELECT population 
FROM world
WHERE name = 'Germany'

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

Table-E
Albania	3200000
Algeria	32900000

SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

name	length(name)
Italy	5
Malta	5
Spain	5

Andorra	936

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000


SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')


 SELECT name, continent, population FROM world

 SELECT name
  FROM world
 WHERE population >= 200000000


SELECT name, gdp/population
FROM world
WHERE population > 200000000

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

SELECT name
FROM world
WHERE name LIKE '%United%'
 
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000


SELECT name, population, area
FROM world
WHERE (population > 250000000 AND area < 3000000) OR (population < 250000000 AND area > 3000000)

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

SELECT name, capital 
FROM world
WHERE LEN(name) = LEN(capital)

SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital

SELECT name
FROM world
WHERE name LIKE '%a%' 
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'

SELECT name
  FROM world
 WHERE name LIKE 'U%'

 SELECT population
  FROM world
 WHERE name = 'United Kingdom'

 'name' should be name

 Nauru	990

 SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

 SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

Brazil
Colombia

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989

SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
OR (subject = 'Chemistry' AND yr = 1984);

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

SELECT yr, subject, winner 
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910
OR subject = 'Literature' AND yr >= 2004

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

SELECT * 
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'SIR%'
ORDER BY yr
DESC, winner

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY
CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END,
 subject, winner


SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

   SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

 Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')


Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1                                    