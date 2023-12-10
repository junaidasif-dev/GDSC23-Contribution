--HackerRank Queries

--Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT * FROM CITY
WHERE COUNTRYCODE = "USA" AND POPULATION > 100000;


--Query all columns (attributes) for every row in the CITY table.

SELECT * FROM CITY;


--Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SELECT NAME FROM CITY
WHERE COUNTRYCODE = "USA" AND POPULATION > 120000;


--Query all columns for a city in CITY with the ID 1661.

SELECT * FROM CITY
WHERE ID = 1661;


--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT * FROM CITY 
WHERE COUNTRYCODE = "JPN";


--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT NAME FROM CITY 
WHERE COUNTRYCODE = "JPN";


--Query a list of CITY and STATE from the STATION table.

SELECT CITY, STATE FROM STATION;


--Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT CITY FROM STATION
WHERE ID%2 = 0;


--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(CITY)-COUNT(DISTINCT CITY) FROM STATION;


/*Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered*/

SELECT CITY, LENGTH(CITY) AS NL		--nl is city name length
FROM STATION
ORDER BY NL ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS NL
FROM STATION
ORDER BY NL DESC, CITY ASC
LIMIT 1;


--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u');


--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION 
WHERE SUBSTRING(CITY, LENGTH(CITY), 1) IN ('a', 'e', 'i', 'o', 'u');


--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ('A', 'E', 'I', 'O', 'U')
  AND SUBSTRING(CITY, LENGTH(CITY), 1) IN ('A', 'E', 'I', 'O', 'U')
  ORDER BY CITY;


--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u');


--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION 
WHERE SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('a', 'e', 'i', 'o', 'u');


--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
OR SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('A', 'E', 'I', 'O', 'U')
ORDER BY CITY;


--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
AND SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('A', 'E', 'I', 'O', 'U')
ORDER BY CITY;


/*Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/

SELECT NAME FROM STUDENTS
WHERE MARKS>75
ORDER BY RIGHT(NAME, 3), ID ASC;


--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name FROM Employee
ORDER BY name ASC;


/*Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  
per month who have been employees for less than  months. Sort your result by ascending employee_id.*/

SELECT name FROM Employee
WHERE salary>2000 AND months<10
ORDER BY employee_id ASC;


--Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 388.7780. Round your answer to 4 decimal places.

SELECT ROUND(LONG_W, 4) FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);


/*Consider  P1(a, b) and P2(c, d) to be two points on a 2D plane.
'a' happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
'b' happens to equal the minimum value in Western Longitude (LONG_W in STATION).
'c' happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
'd' happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of  4 decimal places.*/

SELECT ROUND((MAX(LAT_N)-MIN(LAT_N))+(MAX(LONG_W)-MIN(LONG_W)), 4) 
FROM STATION;


/*Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values 
of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.*/

SELECT ROUND(SQRT((POWER((MAX(LAT_N)-MIN(LAT_N)), 2))+(POWER((MAX(LONG_W)-MIN(LONG_W)), 2))), 4) 
FROM STATION;