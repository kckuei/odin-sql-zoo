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
  WHERE name = 'Germany'
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
  WHERE area BETWEEN 200000 AND 250000
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
  WHERE name LIKE 'Y%'
```

### 2. Find the countries that end with y

```sql 
SELECT name FROM world
  WHERE name LIKE '%y'
```

### 3. Find the countries that contain the letter x
Luxembourg has an x - so does one other country. List them both.

```sql
SELECT name FROM world
  WHERE name LIKE '%x%'
```

### 4. Find the countries that end with land
Iceland, Switzerland end with land - but are there others?

```sql
SELECT name FROM world
  WHERE name LIKE '%land'
```

### 5. Find the countries that start with C and end with ia
Columbia starts with a C and ends with ia - there are two more like this.

```sql
SELECT name FROM world
  WHERE name LIKE 'C%ia'
```

### 6. Find the country that has oo in the name.
Greece has a double e - who has a double o?

```sql 
SELECT name FROM world
  WHERE name LIKE '%oo%'
```

### 7. Find the coutnries that have three or more a in the name.
Bahamas has three a - who else?

```sql
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
```

### 8. Find the countries that have "t" as the second character.
India and Angola have an **n** as the second character. You can use the underscore (**_**) as a single character wildcard.

```sql
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
```

### 9. Find the countries that have two "o" characters separated by two others.
Les**o**th**o** and M**o**ld**o**va both have two o characters separated by two other characters.

```sql
SELECT name FROM world
 WHERE name LIKE '%o__o%'
```

### 10. Find the countries that have exactly four characters.
Cuba and Togo have four character names. 

```sql
SELECT name FROM world
 WHERE name LIKE '____'
```

### 11. Find the country where the name is the capital city.
The capital of **Luxembourg** is **Luxembourg**. Show all the countries where the capital is the same as the name of the country

```sql
SELECT name
  FROM world
 WHERE name = capital
```

### 12. Find the country where the capital is the country plus "City".
The capital of **Mexico** is **Mexico City**. Show all the countries where the capital has the country together with the word "City".

```sql
SELECT name
  FROM world
 WHERE capital LIKE CONCAT(name, ' ', 'City')
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
WHERE (capital LIKE CONCAT(name, '%')) AND (capital !=  name)
```

### 15. Show the name and the extension where the capital is an extension of name of the country.
For **Monaco-Ville** the name is **Monaco** and the extension is ** -Ville**. You can use the SQL function `REPLACE`.

```sql
SELECT name, REPLACE(capital, name ,'')
FROM world
WHERE (capital LIKE CONCAT(name, '%')) AND (capital != name)
```

## 2 SELECT from World
In which we query the World country profile table.


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

## 8+ Numeric Examples
In which we look at a survey and deal with some more complex calculations.

## 9- Window function
In which we examine UK general election results.

## 9+ COVID 19
In which we measure the impact of COVID-19

## 9 Self join
In which we join Edinburgh bus routes to Edinburgh bus routes.