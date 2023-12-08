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

--