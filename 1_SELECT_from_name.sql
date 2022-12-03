-- 1. Find the country that starts with Y 
-- You can use `WHERE` name `LIKE` 'B%' to find the countries that start with "B". (The % is a wild-card it can match any characters)

SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2. Find the countries that end with y

SELECT name FROM world
  WHERE name LIKE '%y';

-- 3. Find the countries that contain the letter x
-- Luxembourg has an x - so does one other country. List them both.

SELECT name FROM world
  WHERE name LIKE '%x%';

-- 4. Find the countries that end with land
-- Iceland, Switzerland end with land - but are there others?

SELECT name FROM world
  WHERE name LIKE '%land';

-- 5. Find the countries that start with C and end with ia
-- Columbia starts with a C and ends with ia - there are two more like this.

SELECT name FROM world
  WHERE name LIKE 'C%ia';

-- 6. 6. Find the country that has oo in the name.
-- Greece has a double e - who has a double o?

SELECT name FROM world
  WHERE name LIKE '%oo%';

-- 7. Find the coutnries that have three or more a in the name.
-- Bahamas has three a - who else?

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have "t" as the second character.
-- India and Angola have an **n** as the second character. You can use the underscore (**_**) as a single character wildcard.

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

-- 9. Find the countries that have two "o" characters separated by two others.
-- Lesotho and Moldova both have two o characters separated by two other characters.

SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- 10. Find the countries that have exactly four characters.
-- Cuba and Togo have four character names. 

SELECT name FROM world
 WHERE name LIKE '____';

--  11. Find the country where the name is the capital city.
-- The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

SELECT name
  FROM world
 WHERE name = capital;

-- 12. Find the country where the capital is the country plus "City".
-- The capital of **Mexico** is **Mexico City**. Show all the countries where the capital has the country together with the word "City".

SELECT name
  FROM world
 WHERE capital LIKE CONCAT(name, ' ', 'City');

-- 13. Find the capital and the name where the capital includes the name of the country. 

SELECT capital, name 
FROM world 
WHERE capital LIKE concat('%', name, '%');

-- 14. Find the capital and the name where the capital is an extension of name of the country.
-- You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.

SELECT capital, name
FROM world
WHERE (capital LIKE CONCAT(name, '%')) AND (capital !=  name);

-- 15.15. Show the name and the extension where the capital is an extension of name of the country.
-- For Monaco-Ville the name is Monaco and the extension is -Ville. You can use the SQL function `REPLACE`.

SELECT name, REPLACE(capital, name ,'')
FROM world
WHERE (capital LIKE CONCAT(name, '%')) AND (capital != name);
