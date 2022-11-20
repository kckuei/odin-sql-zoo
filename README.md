# odin-sql-zoo
Solutions to exercises  0-9 on SQL zoo.


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

Given:
```sql
SELECT population FROM world
  WHERE name = 'France'
```

Solution:
```sql
SELECT population FROM world
  WHERE name = 'Germany'
```

### 2. Scandinavia
Checking a list The word **IN** allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

**Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.**

Given:
```sql
SELECT name, population FROM world
  WHERE name IN ('Brazil', 'Russia', 'India', 'China');
```

Solution:
```sql
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway','Denmark');
```

### 3. Just the right size
Which countries are not too small and not too big? `BETWEEN` allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. 

**Modify it to show the country and the area for countries with an area between 200,000 and 250,000.**

Given:
```sql
SELECT name, area FROM world
  WHERE area BETWEEN 250000 AND 300000
```

Solution:
```sql
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
```


## 1 SELECT name
Some pattern matching queries. 



## 2 SELECT from World
In which we query the World country profile table.

## 3 SELECT from Nobel
Additional practice of the basic features using a table of Nobel Prize winners.
## 4 SELECT within SELECT
In which we form queries using other queries.

## 5 SUM and COUNT
In which we apply aggregate functions. more the same

## 6 JOIN
In which we join two tables; game and goals. previously music tutorial

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