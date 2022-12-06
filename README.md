# SQL Zoo Solutions
Solutions to exercise set tutorials 0-9 from [SQL Zoo](https://sqlzoo.net/wiki/SQL_Tutorial) using `MySQL`.


## 0 SELECT basics
Some simple queries to get you started

<table class="db_ref">
    <caption>world</caption>
    <tbody>
        <tr>
            <th>name</th>
            <th>continent</th>
            <th>area</th>
            <th>population</th>
            <th>gdp</th>
        </tr>
        <tr>
            <td>Afghanistan</td>
            <td>Asia</td>
            <td class="r">652230</td>
            <td class="r">25500100</td>
            <td class="r">20343000000</td>
        </tr>
        <tr>
            <td>Albania</td>
            <td>Europe</td>
            <td class="r">28748 </td>
            <td class="r">2831741 </td>
            <td class="r">12960000000 </td>
        </tr>
        <tr>
            <td>Algeria</td>
            <td>Africa</td>
            <td class="r">2381741 </td>
            <td class="r">37100000 </td>
            <td class="r">188681000000 </td>
        </tr>
        <tr>
            <td>Andorra</td>
            <td>Europe</td>
            <td class="r">468</td>
            <td class="r">78115 </td>
            <td class="r">3712000000 </td>
        </tr>
        <tr>
            <td>Angola</td>
            <td>Africa</td>
            <td class="r">1246700 </td>
            <td class="r">20609294 </td>
            <td class="r">100990000000 </td>
        </tr>
        <tr>
            <td colspan="5">....</td>
        </tr>
    </tbody>
</table>

### 1. Introducing the world table of countries
The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

**Modify it to show the population of Germany**

```sql
SELECT population FROM world
  WHERE name = 'Germany';
```

### 2. Scandinavia
Checking a list The word **IN** allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

**Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.**

```sql
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway','Denmark');
```

### 3. Just the right size
Which countries are not too small and not too big? `BETWEEN` allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. 

**Modify it to show the country and the area for countries with an area between 200,000 and 250,000.**

Solution:
```sql
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
```


## 1 SELECT name
Some pattern matching queries. 

<table class="db_ref">
    <tbody>
        <tr>
            <th>name</th>
            <th>continent</th>
        </tr>
        <tr>
            <td>Afghanistan</td>
            <td>Asia</td>
        </tr>
        <tr>
            <td>Albania</td>
            <td>Europe</td>
        </tr>
        <tr>
            <td>Algeria</td>
            <td>Africa</td>
        </tr>
        <tr>
            <td>Andorra</td>
            <td>Europe</td>
        </tr>
        <tr>
            <td>Angola</td>
            <td>Africa</td>
        </tr>
        <tr>
            <td colspan="2">....</td>
        </tr>
    </tbody>
</table>

### 1. Find the country that start with Y
You can use `WHERE` name `LIKE` 'B%' to find the countries that start with "B". (The % is a wild-card it can match any characters)

```sql 
SELECT name FROM world
  WHERE name LIKE 'Y%';
```

### 2. Find the countries that end with y

```sql 
SELECT name FROM world
  WHERE name LIKE '%y';
```

### 3. Find the countries that contain the letter x
Luxembourg has an x - so does one other country. List them both.

```sql
SELECT name FROM world
  WHERE name LIKE '%x%';
```

### 4. Find the countries that end with land
Iceland, Switzerland end with land - but are there others?

```sql
SELECT name FROM world
  WHERE name LIKE '%land';
```

### 5. Find the countries that start with C and end with ia
Columbia starts with a C and ends with ia - there are two more like this.

```sql
SELECT name FROM world
  WHERE name LIKE 'C%ia';
```

### 6. Find the country that has oo in the name.
Greece has a double e - who has a double o?

```sql 
SELECT name FROM world
  WHERE name LIKE '%oo%';
```

### 7. Find the coutnries that have three or more a in the name.
Bahamas has three a - who else?

```sql
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';
```

### 8. Find the countries that have "t" as the second character.
India and Angola have an **n** as the second character. You can use the underscore (**_**) as a single character wildcard.

```sql
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;
```

### 9. Find the countries that have two "o" characters separated by two others.
Les**o**th**o** and M**o**ld**o**va both have two o characters separated by two other characters.

```sql
SELECT name FROM world
 WHERE name LIKE '%o__o%';
```

### 10. Find the countries that have exactly four characters.
Cuba and Togo have four character names. 

```sql
SELECT name FROM world
 WHERE name LIKE '____';
```

### 11. Find the country where the name is the capital city.
The capital of **Luxembourg** is **Luxembourg**. Show all the countries where the capital is the same as the name of the country

```sql
SELECT name
  FROM world
 WHERE name = capital;
```

### 12. Find the country where the capital is the country plus "City".
The capital of **Mexico** is **Mexico City**. Show all the countries where the capital has the country together with the word "City".

```sql
SELECT name
  FROM world
 WHERE capital LIKE CONCAT(name, ' ', 'City');
```

### 13. Find the capital and the name where the capital includes the name of the country. 

```sql
SELECT capital, name 
FROM world 
WHERE capital LIKE concat('%', name, '%');
```

### 14. Find the capital and the name where the capital is an extension of name of the country.
You should include **Mexico City** as it is longer than **Mexico**. You should not include **Luxembourg** as the capital is the same as the country.

```sql
SELECT capital, name
FROM world
WHERE (capital LIKE CONCAT(name, '%')) AND (capital !=  name);
```

### 15. Show the name and the extension where the capital is an extension of name of the country.
For **Monaco-Ville** the name is **Monaco** and the extension is ** -Ville**. You can use the SQL function `REPLACE`.

```sql
SELECT name, REPLACE(capital, name ,'')
FROM world
WHERE (capital LIKE CONCAT(name, '%')) AND (capital != name);
```


## 2 SELECT from World
In which we query the World country profile table.

### 1. Read the notes about this table. 
Observe the result of running this SQL command to show the name, continent and population of all countries.

```sql
SELECT name, continent, population FROM world;
```

### 2. How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 
200 million is 200000000, there are eight zeros.

```sql 
SELECT name FROM world
WHERE population >= 200000000;
```

### 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.

```sql
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;
```

### 4. Show the name and population in millions for the countries of the continent 'South America'.
Divide the population by 1000000 to get population in millions.

```sql
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';
```

### 5. Show the name and population for France, Germany, Italy

```
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy');
```

### 6. Show the countries which have a name that includes the word 'United'

```
SELECT name
FROM world
WHERE name LIKE '%United%';
```

### 7. Show the countries that are big by area or big by population. 
* Show name, population and area.
* Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

```sql
SELECT name, population, area
FROM world
WHERE (area > 3000000) OR (population > 250000000);
```

### 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.
* Show name, population and area.
* Australia has a big area but a small population, it should be included.
* Indonesia has a big population but a small area, it should be included.
* China has a big population and big area, it should be excluded.
* United Kingdom has a small population and a small area, it should be excluded.

```sql
SELECT name, population, area
FROM world
WHERE (area > 3000000) XOR (population > 250000000);
```

### 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
* Use the ROUND function to show the values to two decimal places.
* For South America show population in millions and GDP in billions both to 2 decimal places.

```sql
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America';
```

### 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). 
* Round this value to the nearest 1000.
* Show per-capita GDP for the trillion dollar countries to the nearest $1000.

```sql
SELECT name, ROUND(gdp/population/1000,0)*1000
FROM world
WHERE gdp >= 1000000000000;
```

### 11. Show the name and capital where the name and the capital have the same number of characters.
* Greece has capital Athens. Each of the strings 'Greece', and 'Athens' has 6 characters.
* You can use the LENGTH function to find the number of characters in a string

```sql
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
```

### 12. Show the name and the capital where the first letters of each match. 
* Don't include countries where the name and the capital are the same word.
* The capital of Sweden is Stockholm. Both words start with the letter 'S'.
* You can use the function LEFT to isolate the first character.
* You can use <> as the NOT EQUALS operator.

```sql
SELECT name, capital
FROM world
WHERE (LEFT(name, 1) = LEFT(capital, 1)) AND name <> capital;
```

### 13. Find the country that has all the vowels and no spaces in its name.
* Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
* You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.

```sql
SELECT name
   FROM world
WHERE name NOT LIKE '% %'
  AND name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
```


## 3 SELECT from Nobel
Additional practice of the basic features using a table of Nobel Prize winners.

<table class="db_ref">
    <caption>nobel</caption>
    <tbody>
        <tr>
            <th>yr</th>
            <th>subject</th>
            <th>winner</th>
        </tr>
        <tr>
            <td>1960</td>
            <td>Chemistry</td>
            <td align="left">Willard F. Libby</td>
        </tr>
        <tr>
            <td>1960</td>
            <td>Literature</td>
            <td align="left">Saint-John Perse</td>
        </tr>
        <tr>
            <td>1960</td>
            <td>Medicine</td>
            <td align="left">Sir Frank Macfarlane Burnet</td>
        </tr>
        <tr>
            <td>1960</td>
            <td>Medicine</td>
            <td align="left">Peter Madawar</td>
        </tr>
        <tr>
            <td colspan="5">...</td>
        </tr>
    </tbody>
</table>


### 1. Change the query shown so that it displays Nobel prizes for 1950.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;
```

### 2. Show who won the 1962 prize for literature.

```sql
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'literature';
```

### 3. Show the year and subject that won 'Albert Einstein' his prize.

```sql
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';
```

### 4. Give the name of the 'peace' winners since the year 2000, including 2000.

```sql
SELECT winner
FROM nobel
WHERE (subject = 'peace') AND (yr >= 2000);
```

### 5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'literature') AND (yr BETWEEN 1980 AND 1989);
```

### 6. Show all details of the presidential winners:
* Theodore Roosevelt
* Thomas Woodrow Wilson
* Jimmy Carter
* Barack Obama

```sql
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                 'Woodrow Wilson',
                 'Jimmy Carter',
                 'Barack Obama')
```

### 7. Show the winners with first name John

```sql
SELECT winner FROM nobel
WHERE winner LIKE 'John %'
```

### 8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE ((yr = 1980) AND (subject = 'physics')) OR
      ((yr = 1984) AND (subject = 'chemistry'));
```

### 9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine

```sql
SELECT yr, subject, winner FROM nobel
WHERE (yr = 1980) AND ((subject != 'chemistry') AND (subject != 'medicine'));
```

### 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

```sql
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR
      (subject = 'Literature' AND yr >= 2004);
```

### 11. Find all details of the prize won by PETER GRÜNBERG
* The u in his name has an umlaut. 
* You may find this link useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding

```sql
SELECT *
FROM nobel 
WHERE winner LIKE 'PETER GRÜNBERG';
```

### 12. Find all details of the prize won by EUGENE O'NEILL
* You can't put a single quote in a quote string directly. 
* You can use two single quotes within a quoted string.

```sql
SELECT *
FROM nobel
WHERE winner LIKE 'EUGENE O''NEILL';
```

### 13. Knights in order: List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

```sql
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;
```

### 14. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
* The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.

```sql
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('chemistry', 'physics'), subject, winner
```


## 4 SELECT within SELECT
In which we form queries using other queries.

### 1. List each country name where the population is larger than that of 'Russia'.
* world(name, continent, area, population, gdp)

```sql
SELECT name 
FROM world
WHERE population >
    (SELECT population FROM world
    WHERE name='Russia');
```

### 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
* The per capita GDP is the gdp/population

```sql
SELECT name
FROM world
WHERE gdp/population > 
        (SELECT gdp/population
        FROM world
        WHERE name = 'United Kingdom') AND 
      (continent = 'Europe');
```

### 3. List the name and continent of countries in the continents containing either Argentina or Australia. 
* Order by name of the country.

```sql
SELECT name, continent
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    WHERE name in ('Argentina','Australia'))
ORDER BY name;
```

### 4. Which country has a population that is more than United Kingdom but less than Germany? 
* Show the name and the population.

```sql
SELECT name, population
FROM world
WHERE population > (
        SELECT population FROM world 
        WHERE name = 'United Kingdom') AND
      population < (
        SELECT population FROM world 
        WHERE name = 'Germany');
```

### 5. Show the name and the population of each country in Europe. 
* Show the population as a percentage of the population of Germany.
* Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
* You can use the function ROUND to remove the decimal places.
* You can use the function `CONCAT` to add the percentage symbol.

```sql
SELECT name, 
    CONCAT(ROUND(100*(population/(
        SELECT population
        FROM world
        WHERE name = 'Germany')
    ), 0),'%') as percentage
FROM world
WHERE continent = 'Europe';
```

### 6. Which countries have a GDP greater than every country in Europe?
* Give the name only.
* Some countries may have `NULL` gdp values.

```sql
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp
                FROM world
                WHERE (Continent = 'Europe') AND 
                      (gdp>0)
                );
```

### 7. Find the largest country (by area) in each continent, show the continent, the name and the area.
* A correlated (or synchronized) subquery works like a nested loop: the subquery only has access to rows related to a single record at a time in the outer query. The technique relies on table aliases to identify two different uses of the same table, one in the outer query and the other in the subquery.
* One way to interpret the line in the `WHERE` clause that references the two table is “… where the correlated values are the same”.
* In the example provided, you would say “select the country details from world where the population is greater than or equal to the population of all countries where the continent is the same”.
* In the solution below, we would say: 'select the country details from world where the area is greater than equal to the area of all countries where the continent is the same'

```sql
SELECT continent, name, area 
FROM world x
WHERE area >= ALL(
   SELECT area FROM world y
   WHERE y.continent=x.continent)
```

### 8. List each continent and the name of the country that comes first alphabetically.
* Nested `SELECT` is picking all the countries with the same continent
* Outer `SELECT` is keeping the countries where the name is less than the country names in the Nested `SELECT`, so it will filter down to the lowest, or first alphabetical

```sql
SELECT continent, name
FROM world x
WHERE name <= ALL(
    SELECT name 
    FROM world y
    WHERE y.continent = x.continent
    );
```

### 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
* Starting from inner most `SELECT`...
* Select all the country populations that are on the same continent
* Keep only those distinct countries whose populations are <= 25000000
* Get the country details of those countries that are in those continents

```sql
SELECT name, continent, population
FROM world z
WHERE z.continent IN (
SELECT DISTINCT continent
FROM world x
WHERE 25000000 > 
      ALL(SELECT population 
          FROM world y 
          WHERE x.continent = y.continent)
);
```

### 10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
* Starting from inner most `SELECT`...
* Select all other countries in the same continent and multiply those populations by 3
* For each country, keep only those country details whose populations are greater than that entire list

```sql
SELECT name, continent
FROM world x
WHERE population > 
      ALL(SELECT 3*population 
          FROM world y 
          WHERE (x.continent = y.continent) AND
                (x.name != y.name)
          );
```

## 5 SUM and COUNT
In which we apply aggregate functions. more the same

### 1. Show the total population of the world.
* world(name, continent, area, population, gdp)

```sql
SELECT SUM(population)
FROM world;
```

### 2. List all the continents - just once each.

```sql
SELECT DISTINCT continent
FROM world;
```

```sql
SELECT continent
FROM world
GROUP BY continent;
```

### 3. Give the total GDP of Africa

```sql
SELECT SUM(gdp) as total_GDP
FROM world
GROUP BY continent
HAVING continent = 'Africa'
```

### 4. How many countries have an area of at least 1000000

```sql
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;
```

### 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

```sql
SELECT SUM(population)
FROM world
WHERE name in ('Estonia', 'Latvia', 'Lithuania');
```

### 6. For each continent show the continent and number of countries.

```sql
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;
```

### 7. For each continent show the continent and number of countries with populations of at least 10 million.

```sql
SELECT t1.continent, COUNT(t1.name)
FROM (SELECT continent, name 
      FROM world
      WHERE population >= 10000000
      ) t1
GROUP BY t1.continent;
```

### 8. List the continents that have a total population of at least 100 million.

```sql
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
```


## 6 JOIN
In which we join two tables; game and goals. previously music tutorial

<table class="db_ref">
    <caption>game</caption>
    <tbody>
        <tr>
            <th>id</th>
            <th>mdate</th>
            <th>stadium</th>
            <th>team1</th>
            <th>team2</th>
        </tr>
        <tr>
            <td>1001</td>
            <td>8 June 2012</td>
            <td>National Stadium, Warsaw</td>
            <td>POL</td>
            <td>GRE</td>
        </tr>
        <tr>
            <td>1002</td>
            <td>8 June 2012</td>
            <td>Stadion Miejski (Wroclaw)</td>
            <td>RUS</td>
            <td>CZE</td>
        </tr>
        <tr>
            <td>1003</td>
            <td>12 June 2012</td>
            <td>Stadion Miejski (Wroclaw)</td>
            <td>GRE</td>
            <td>CZE</td>
        </tr>
        <tr>
            <td>1004</td>
            <td>12 June 2012</td>
            <td>National Stadium, Warsaw</td>
            <td>POL</td>
            <td>RUS</td>
        </tr>
        <tr>
            <td colspan="5">...</td>
        </tr>
    </tbody>
</table>

<table class="db_ref">
    <caption>goal</caption>
    <tbody>
        <tr>
            <th>matchid</th>
            <th>teamid</th>
            <th>player</th>
            <th>gtime</th>
        </tr>
        <tr>
            <td>1001</td>
            <td>POL</td>
            <td>Robert Lewandowski</td>
            <td>17</td>
        </tr>
        <tr>
            <td>1001</td>
            <td>GRE</td>
            <td>Dimitris Salpingidis</td>
            <td>51</td>
        </tr>
        <tr>
            <td>1002</td>
            <td>RUS</td>
            <td>Alan Dzagoev</td>
            <td>15</td>
        </tr>
        <tr>
            <td>1002</td>
            <td>RUS</td>
            <td>Roman Pavlyuchenko</td>
            <td>82</td>
        </tr>
        <tr>
            <td colspan="5">...</td>
        </tr>
    </tbody>
</table>

<table class="db_ref">
    <caption>eteam</caption>
    <tbody>
        <tr>
            <th>id</th>
            <th>teamname</th>
            <th>coach</th>
        </tr>
        <tr>
            <td>POL</td>
            <td>Poland</td>
            <td>Franciszek Smuda</td>
        </tr>
        <tr>
            <td>RUS</td>
            <td>Russia</td>
            <td>Dick Advocaat</td>
        </tr>
        <tr>
            <td>CZE</td>
            <td>Czech Republic</td>
            <td>Michal Bilek</td>
        </tr>
        <tr>
            <td>GRE</td>
            <td>Greece</td>
            <td>Fernando Santos</td>
        </tr>
        <tr>
            <td colspan="5">...</td>
        </tr>
    </tbody>
</table>

* game(id (#), mdate, stadium, team1, team2)
* goal(matchid (#), teamid (POL), player, gtime)
* eteam(id (POL), teamname, coach)

### 1. Modify it to show the matchid and player name for all goals scored by Germany. 
* To identify German players, check for: teamid = 'GER'

```sql
SELECT matchid, player 
FROM goal 
WHERE teamid LIKE 'GER';
```

### 2. Show id, stadium, team1, team2 for just game 1012
* From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
* Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.

```sql
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;
```

### 3. Modify it to show the player, teamid, stadium and mdate for every German goal.
* You can combine the two steps into a single query with a `JOIN`: `SELECT` * `FROM` game `JOIN` goal `ON` (id=matchid)
* The `FROM` clause says to merge data from the goal table with that from the game table. The `ON` says how to figure out which rows in game go with which rows in goal
* The matchid from goal must match id from game. (If we wanted to be more clear/specific we could say `ON` (game.id=goal.matchid)

```sql
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (id=matchid)
HAVING teamid = 'GER';
```

### 4. Show the team1, team2 and player for every goal scored by a player called Mario player `LIKE` 'Mario%'. 
* Use the same `JOIN` as in the previous question.

```sql
SELECT team1, team2, player
FROM game 
JOIN goal ON (id=matchid)
HAVING player LIKE 'Mario%';
```

### 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
* The table eteam gives details of every national team including the coach. You can `JOIN` goal to eteam using the phrase goal `JOIN` eteam on teamid=id

```sql
SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON teamid=id
WHERE gtime<=10;
```

### 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
* To `JOIN` game with eteam you could use either game `JOIN` eteam ON (team1=eteam.id) or game `JOIN` eteam ON (team2=eteam.id)
* Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

```sql
SELECT mdate, eteam.teamname
FROM game
JOIN eteam on game.team1 = eteam.id 
WHERE eteam.coach = 'Fernando Santos'
```

### 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

```sql
SELECT player
FROM goal
JOIN game on goal.matchid=game.id
WHERE stadium = 'National Stadium, Warsaw';
```

### 8. Instead show the name of all players who scored a goal against Germany.
* Select goals scored only by non-German players in matches where GER was the id of either team1 or team2.
* You can use teamid!='GER' to prevent listing German players.
* You can use `DISTINCT` to stop players being listed twice

```sql
SELECT DISTINCT player
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE goal.teamid!='GER' AND 
      (game.team1 = 'GER' OR game.team2 = 'GER');
```

### 9. Show teamname and the total number of goals scored. 
* You should `COUNT(*)` in the `SELECT` line and `GROUP BY` teamname

```sql
SELECT teamname, COUNT(player)
FROM goal 
JOIN eteam ON eteam.id=goal.teamid
GROUP BY teamname;
```

### 10. Show the stadium and the number of goals scored in each stadium.

```sql
SELECT stadium, COUNT(player)
FROM goal 
JOIN game ON goal.matchid = game.id
GROUP BY stadium;
```

### 11. For every match involving 'POL', show the matchid, date and the number of goals scored.

```sql
SELECT t.matchid, t.mdate, COUNT(t.player)
FROM (SELECT matchid, mdate, player
      FROM game 
      JOIN goal ON game.id = goal.matchid
      WHERE (team1 = 'POL' OR team2 = 'POL')) AS t
GROUP BY t.matchid, t.mdate
```

### 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

```sql
SELECT matchid, mdate, COUNT(*)
FROM (SELECT *
      FROM goal
      JOIN game ON goal.matchid = game.id
      HAVING teamid = 'GER') AS t
GROUP BY matchid, mdate
```

### 13. List every match with the goals scored by each team as shown. 
* This will use "`CASE WHEN`" which has not been explained in any previous exercises.
* Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.

<table class="sqlmine">
    <tbody>
        <tr>
            <th>mdate</th>
            <th>team1</th>
            <th>score1</th>
            <th>team2</th>
            <th>score2</th>
        </tr>
        <tr>
            <td>1 July 2012</td>
            <td>ESP</td>
            <td class="r">4</td>
            <td>ITA </td>
            <td class="r">0</td>
        </tr>
        <tr>
            <td>10 June 2012</td>
            <td>ESP</td>
            <td class="r">1</td>
            <td>ITA</td>
            <td class="r">1</td>
        </tr>
        <tr>
            <td>10 June 2012</td>
            <td>IRL</td>
            <td class="r">1</td>
            <td>CRO</td>
            <td class="r">3</td>
        </tr>
        <tr>
            <td colspan="5">...</td>
        </tr>
    </tbody>
</table>


```sql
SELECT t.mdate, t.team1, sum(t.score1) as score1, 
                t.team2, sum(t.score2) as score2
FROM (SELECT mdate, team1,
      CASE WHEN goal.teamid=team1 THEN 1 
           ELSE 0 
      END AS score1, 
      team2, 
      CASE WHEN goal.teamid=team2 THEN 1 
           ELSE 0 
      END AS score2
FROM game JOIN goal ON game.id = goal.matchid) as t
GROUP BY t.mdate, t.team1, t.team2
ORDER BY t.mdate, t.team1, t.team2;
```

```sql
SELECT DISTINCT mdate, 
team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, 
team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game JOIN goal ON goal.matchid = game.id
GROUP BY mdate,team1,team2
ORDER BY mdate,team1,team2;
```


## 7 More JOIN operations
In which we join actors to movies in the Movie Database.

* movie(id (PK, 10212), title (A Kind of Loving), yr, director (FK), budget, gross)
* actor(id (PK), name)
* casting(movieid (PK,FK), actorid (PK,FK), ord)

### 1. List the films where the yr is 1962 [Show id, title]

```sql
SELECT id, title
FROM movie
WHERE yr=1962;
```

### 2. Give year of 'Citizen Kane'.

```sql
SELECT yr 
FROM movie
WHERE title = 'Citizen Kane';
```

### 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

```sql
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
```

### 4. What id number does the actor 'Glenn Close' have?

```sql
SELECT id FROM actor WHERE name = 'Glenn Close';
```

### 5. What is the id of the film 'Casablanca'

```sql
SELECT id FROM movie WHERE title = 'Casablanca';
```

### 6. SELECT id FROM movie WHERE title = 'Casablanca';
* The cast list is the names of the actors who were in the movie.
* Use movieid=11768, (or whatever value you got from the previous question)

```sql
SELECT name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE movieid=11768;
```

### 7. Obtain the cast list for the film 'Alien'

```sql
SELECT name
FROM casting
JOIN actor ON casting.actorid = actor.id
JOIN movie ON movie.id = casting.movieid
WHERE title = 'Alien';
```

### 8. List the films in which 'Harrison Ford' has appeared

```sql
SELECT title
FROM movie 
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford';
```

### 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
* The ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role.

```sql
SELECT title
FROM movie 
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford' AND ord > 1;
```

### 10. List the films together with the leading star for all 1962 films.

```sql
SELECT title, name
FROM movie 
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962 AND ord = 1;
```

### 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

```sql
SELECT yr,COUNT(title) 
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
```

### 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
* Did you get "Little Miss Marker twice"?
* Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
* Title is not a unique field, create a table of IDs in your subquery

```sql
-- All the movieids of movies with Julie Andrews
SELECT movieid 
FROM casting
WHERE actorid IN (
   SELECT id FROM actor
   WHERE name='Julie Andrews');

--Hence
SELECT title, name
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE ord = 1 AND movieid IN (
  SELECT movieid 
  FROM casting
  WHERE actorid IN (
     SELECT id FROM actor
     WHERE name='Julie Andrews'));
```

### 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

```sql
SELECT name 
FROM actor 
JOIN casting ON actorid = actor.id
JOIN movie ON movieid = movie.id 
WHERE ord = 1 AND actor.id = casting.actorid 
GROUP BY name HAVING count(*) >= 15;
```

### 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

```sql
SELECT title, COUNT(actorid)
FROM casting
JOIN movie ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;
```

### 15. List all the people who have worked with 'Art Garfunkel'.

```sql
SELECT name
FROM actor 
JOIN casting ON actorid = actor.id
WHERE name != 'Art Garfunkel' AND movieid IN (
   SELECT movieid
   FROM movie 
   JOIN casting ON movieid = movie.id
   JOIN actor ON actorid = actor.id
   WHERE actor.name = 'Art Garfunkel');
```


## 8 Using Null
In which we look at teachers in departments. previously Scottish Parliament

<table class="zoo db_ref">
    <caption>teacher</caption>
    <tbody>
        <tr>
            <th>id</th>
            <th>dept</th>
            <th>name</th>
            <th>phone</th>
            <th>mobile</th>
        </tr>
        <tr>
            <td align="right">101</td>
            <td align="right">1</td>
            <td>Shrivell</td>
            <td align="right">2753</td>
            <td>07986 555 1234</td>
        </tr>
        <tr>
            <td align="right">102</td>
            <td align="right">1</td>
            <td>Throd</td>
            <td align="right">2754</td>
            <td>07122 555 1920</td>
        </tr>
        <tr>
            <td align="right">103</td>
            <td align="right">1</td>
            <td>Splint</td>
            <td align="right">2293</td>
            <td></td>
        </tr>
        <tr>
            <td align="right">104</td>
            <td align="right"></td>
            <td>Spiregrain</td>
            <td align="right">3287</td>
            <td></td>
        </tr>
        <tr>
            <td align="right">105</td>
            <td align="right">2</td>
            <td>Cutflower</td>
            <td align="right">3212</td>
            <td>07996 555 6574</td>
        </tr>
        <tr>
            <td align="right">106</td>
            <td align="right"></td>
            <td>Deadyawn</td>
            <td align="right">3345</td>
            <td></td>
        </tr>
        <tr>
            <td colspan="5">...</td>
        </tr>
    </tbody>
</table>

<table class="zoo db_ref">
    <caption>dept</caption>
    <tbody>
        <tr>
            <th>id</th>
            <th>name</th>
        </tr>
        <tr>
            <td align="right">1</td>
            <td>Computing</td>
        </tr>
        <tr>
            <td align="right">2</td>
            <td>Design</td>
        </tr>
        <tr>
            <td align="right">3</td>
            <td>Engineering</td>
        </tr>
        <tr>
            <td colspan="2">...</td>
        </tr>
    </tbody>
</table>

* teacher(id, dept, name, phone, mobile)
* dept(id, name)

### 1. List the teachers who have NULL for their department.

```sql
SELECT name 
FROM teacher
WHERE dept IS NULL;
```

### 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

```sql
SELECT teacher.name, dept.name
FROM teacher
INNER JOIN dept
ON (teacher.dept=dept.id);
```

### 3. Use a different JOIN so that all teachers are listed.

```sql
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept
ON (teacher.dept=dept.id);
```

### 4. Use a different JOIN so that all departments are listed.
* `COALESCE` takes any number of arguments and returns the first value that is not null.
* `COALESCE(x,y,z)` = x if x is not `NULL`
* `COALESCE(x,y,z)` = y if x is `NULL` and y is not `NULL`
* `COALESCE(x,y,z)` = z if x and y are `NULL` but z is not `NULL`
* `COALESCE(x,y,z)` = `NULL` if x and y and z are all `NULL`

```sql
SELECT name, COALESCE(mobile, '07986 444 2266' )
FROM teacher;
```

### 6. Use the `COALESCE` function and a `LEFT JOIN` to print the teacher name and department name. Use the string 'None' where there is no department.

```sql
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept on teacher.dept = dept.id;
```

### 7. Use `COUNT` to show the number of teachers and the number of mobile phones.

```sql
SELECT COUNT(name), COUNT(mobile)
FROM teacher;
```

### 8. Use `COUNT` and `GROUP BY` dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

```sql
SELECT dept.name, COUNT(teacher.name) AS staff
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;
```

### 9. Use `CASE` to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

```sql
SELECT 
  name,
  CASE
    WHEN dept = 1 OR dept = 2 THEN 'Sci'
    ELSE 'Art'
  END AS subject
FROM teacher;
```

### 10. Use `CASE` to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

```sql
SELECT 
  name,
  CASE
    WHEN dept = 1 OR dept = 2 THEN 'Sci'
    WHEN dept = 3 THEN 'Art'
    ELSE 'None'
  END AS subject
FROM teacher;
```


## 8+ Numeric Examples
In which we look at a survey and deal with some more complex calculations.

* nss(
* ukprn, varchar(8)
* institution, varchar(100)
* subject, varchar(60)
* level, varchar(50)
* question, varchar(10)
* A_STRONGLY_DISAGREE, int(11)
* A_DISAGREE, int(11)
* A_NEUTRAL, int(11)
* A_AGREE, int(11)
* A_STRONGLY_AGREE, int(11)
* A_NEUTRAL, int(11)
* CI_MIN, int(11)
* score, int(11)
* CI_MAX, int(11)
* response, int(11)
* sample, int(11)
* aggregate, char(1)
 )

### 1.The example shows the number who responded for:
* question 1
* at 'Edinburgh Napier University'
* studying '(8) Computer Science'
* Show the the percentage who STRONGLY AGREE

```sql
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
AND institution='Edinburgh Napier University'
AND subject='(8) Computer Science';
```

### 2. Show the institution and subject where the score is at least 100 for question 15.

```sql
SELECT institution, subject
FROM nss
WHERE question='Q15'
AND score >= 100;
```

### 3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'

```sql
SELECT institution,score
FROM nss
WHERE question='Q15'
AND subject='(8) Computer Science'
AND score < 50;
```

### 4. Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
* You will need to use `SUM` over the response column and `GROUP BY` subject

```sql
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22' AND (
subject='(8) Computer Science' OR 
subject='(H) Creative Arts and Design')
GROUP BY subject;
```

### 5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
* The A_STRONGLY_AGREE column is a percentage. To work out the total number of students who strongly agree you must multiply this percentage by the number who responded (response) and divide by 100 - take the `SUM` of that.

```sql
SELECT subject, sum(A_STRONGLY_AGREE*response/100) AS total
FROM nss
WHERE question='Q22' AND (
subject='(8) Computer Science' OR 
subject='(H) Creative Arts and Design')
GROUP by subject;
```

### 6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
* Use the `ROUND` function to show the percentage without decimal places.

```sql
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response))
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR
    subject='(H) Creative Arts and Design')
GROUP BY subject;
```

### 7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.
* The column score is a percentage - you must use the method outlined above to multiply the percentage by the response and divide by the total response. Give your answer rounded to the nearest whole number.

```sql
SELECT institution, ROUND(SUM(score*response)/SUM(response)) AS avg_score
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution;
```

### 8. Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.

```sql
SELECT nss.institution, SUM(nss.sample) as total, T.comp as compsci
FROM nss 
JOIN (SELECT institution, SUM(sample), SUM(sample) as comp
      FROM nss WHERE question='Q01'
        AND (institution LIKE '%Manchester%')
        AND (subject='(8) Computer Science')
      GROUP BY institution) T 
ON nss.institution = T.institution
WHERE nss.question='Q01'
   AND (nss.institution LIKE '%Manchester%')
GROUP BY nss.institution;
```


## 9- Window function
In which we examine UK general election results.


## 9+ COVID 19
In which we measure the impact of COVID-19

### COVID-19 Data
Notes on the data: This data was assembled based on work done by Rodrigo Pombo based on John Hopkins University, based on World Health Organisation. The data was assembled 21st April 2020 - there are no plans to keep this data set up to date.

### Window Function
The SQL Window functions include LAG, LEAD, RANK and NTILE. These functions operate over a "window" of rows - typically these are rows in the table that are in some sense adjacent.

### 3. 

#### LAG operation
Here is the correct query showing the cases for the day before:

```sql
SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (partition by name ORDER BY whn) AS lag
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn
```

Notice how the values in the LAG column match the value of the row diagonally above and to the left.
<table class="sqlmine">
    <tbody>
        <tr>
            <th>name</th>
            <th>DAY(whn)</th>
            <th>confirmed</th>
            <th>dbf</th>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">1</td>
            <td class="r" style="background:pink">1694</td>
            <td class="r">null</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">2</td>
            <td class="r">2036</td>
            <td class="r" style="background:pink">1694</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">3</td>
            <td class="r">2502</td>
            <td class="r">2036</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">4</td>
            <td class="r">3089</td>
            <td class="r">2502</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">5</td>
            <td class="r" style="background:skyblue">3858</td>
            <td class="r">3089</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">6</td>
            <td class="r">4636</td>
            <td class="r" style="background:skyblue">3858</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">7</td>
            <td class="r">5883</td>
            <td class="r">4636</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">8</td>
            <td class="r">7375</td>
            <td class="r">5883</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">9</td>
            <td class="r">9172</td>
            <td class="r">7375</td>
        </tr>
        <tr>
            <td>Italy</td>
            <td class="r">10</td>
            <td class="r">10149</td>
            <td class="r">9172</td>
        </tr>
        <tr>
            <td colspan="4">...</td>
        </tr>
    </tbody>
</table>


## 9 Self join
In which we join Edinburgh bus routes to Edinburgh bus routes.

<table class="db_ref">
    <tbody><tr>
        <th><b>stops</b></th>
    </tr>
    <tr>
        <td><i>id</i></td>
    </tr>
    <tr>
        <td>name</td>
    </tr>
</tbody></table>
<p><br />
</p>
<table class="db_ref">
    <tbody><tr>
        <th><b>route</b></th>
    </tr>
    <tr>
        <td><i>num</i></td>
    </tr>
    <tr>
        <td><i>company</i></td>
    </tr>
    <tr>
        <td><i>pos</i></td>
    </tr>
    <tr>
        <td>stop</td>
    </tr>
</tbody></table>