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

game  JOIN goal ON (id=matchid)

matchid, teamid, player, gtime, id, teamname, coach

SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

DEN	9 June 2012
GER	9 June 2012

SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2
   
SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

SELECT actor.id 
FROM movie
JOIN actor ON (movie.id = actor.id)
WHERE name = 'Glenn Close'

SELECT id
FROM movie
WHERE title = 'Casablanca'

SELECT name FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE movieid = (SELECT id
FROM movie
WHERE title = 'Casablanca') and casting.actorid =actor.id

SELECT name FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE movieid = (SELECT id
FROM movie
WHERE title = 'Alien') and casting.actorid =actor.id


SELECT DISTINCT title FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'

SELECT DISTINCT title FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND ord <> 1

SELECT DISTINCT title,name FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962
AND ord = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1


SELECT DISTINCT title,name FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE ord = 1 AND movieid IN (SELECT movieid FROM casting JOIN actor ON actorid=id WHERE name = 'Julie Andrews')

SELECT DISTINCT name
FROM actor
JOIN casting on actorid =actor.id
GROUP BY name,ord
HAVING COUNT(name) >= 15 AND ord = 1

SELECT title, COUNT(movieid)
FROM movie
JOIN casting ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY movieid,title
ORDER BY COUNT(movieid) DESC ,title

SELECT name From actor
WHERE id IN (
SELECT actorid FROM casting
WHERE movieid IN(
SELECT movieid FROM casting
JOIN actor ON actor.id = casting.actorid
WHERE name = 'Art Garfunkel')) AND name <> 'Art Garfunkel' ORDER BY name


SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC


Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack


SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table


Table-B
A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011

SELECT name
FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)


SELECT name, 
CASE 
  WHEN mobile IS NULL THEN '07986 444 2266' 
  ELSE mobile 
  END
FROM teacher

SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher

SELECT teacher.name, COALESCE(dept.name,'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT COUNT(name),COUNT(mobile)
FROM teacher

SELECT dept.name ,COUNT(dept)
From teacher RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name

SELECT name,
CASE dept
WHEN 1 THEN 'Sci'
WHEN 2 THEN 'Sci'
ELSE 'Art'
END
FROM teacher

SELECT name,
CASE dept
WHEN 1 THEN 'Sci'
WHEN 2 THEN 'Sci'
WHEN 3 THEN 'Art'
ELSE 'None'
END
FROM teacher

SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'
 
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

display 0 in result column for all teachers without department

'four' for Throd

Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other

SELECT COUNT(id)
FROM stops

SELECT id
FROM stops
WHERE name= 'Craiglockhart'

SELECT id,name
FROM stops
JOIN route ON stops.id = route.stop
WHERE company = 'LRT' AND num = '4'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop =149


SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name ='London Road'

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop =137

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'Tollcross'

SELECT stopb.name,a.company,a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart'

SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'