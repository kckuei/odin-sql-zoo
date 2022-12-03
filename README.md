# odin-sql-zoo
Solutions to exercises 0-9 on [SQL Zoo](https://sqlzoo.net/wiki/SQL_Tutorial) with `MYSQL`.


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


## 5 SUM and COUNT
In which we apply aggregate functions. more the same


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

### 13. 

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


## 7 More JOIN operations
In which we join actors to movies in the Movie Database.


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


## 8+ Numeric Examples
In which we look at a survey and deal with some more complex calculations.


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