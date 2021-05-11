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

SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia')

SELECT name
FROM world
WHERE continent = 'Europe' AND 
GDP/population > (SELECT GDP/population FROM world WHERE name = 'United Kingdom')

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN('Argentina', 'Australia'))
ORDER BY name


SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')


SELECT name, CONCAT(
               ROUND(
                 100*population/
(SELECT population FROM world WHERE name = 'Germany'), 0),'%')
FROM world
WHERE continent = 'Europe'


SELECT name FROM world
WHERE gdp >
(SELECT MAX(gdp) FROM world WHERE continent = 'Europe')


SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)


SELECT continent, name FROM world x
WHERE name <= ALL (SELECT name FROM world y 
WHERE y.continent=x.continent AND area > 0)

SELECT name, continent, population FROM world x 
WHERE 25000000 >= ALL (SELECT population FROM world y
                        WHERE x.population=y.population
                         AND area>0)


SELECT name,continent FROM world x
WHERE population >= ALL(
SELECT population*3
FROM world y
WHERE x.continent = y.continent
AND x.name <> y.name  
)

SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

Table-D
France
Germany
Russia
Turkey

SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')


SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')


Table-B
Bangladesh
India
Pakistan

SELECT SUM(population)
FROM world

SELECT DISTINCT(continent)
FROM world

SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa'

SELECT COUNT(name)
FROM world
WHERE area >= 1000000

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(name)
FROM world
GROUP BY continent

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

SELECT COUNT(name) FROM bbc WHERE population < 150000

AVG(), COUNT(), MAX(), MIN(), SUM()

No result due to invalid use of the WHERE function

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710

SELECT matchid, player 
FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
   WHERE id = '1012'

SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid ='GER'

SELECT team1, team2, player
FROM game JOIN goal on (id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id) 
 WHERE gtime<=10


SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

SELECT player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER')
AND teamid <> 'GER'

SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
   GROUP BY teamname

SELECT stadium, COUNT(player)
FROM game JOIN goal ON (game.id=goal.matchid)
GROUP BY stadium

SELECT matchid,mdate, COUNT(mdate)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') AND id = matchid GROUP BY mdate,matchid

SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON (matchid=id)
WHERE teamid = 'GER'
GROUP BY matchid, mdate

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON matchid = id GROUP BY mdate,matchid,team1,team2
ORDER BY mdate,matchid,team1,team2

