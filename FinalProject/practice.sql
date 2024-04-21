-- HackerRank Queries

-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT * FROM CITY
WHERE COUNTRYCODE = "USA" AND POPULATION > 100000;


-- Query all columns (attributes) for every row in the CITY table.

SELECT * FROM CITY;


-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SELECT NAME FROM CITY
WHERE COUNTRYCODE = "USA" AND POPULATION > 120000;


-- Query all columns for a city in CITY with the ID 1661.

SELECT * FROM CITY
WHERE ID = 1661;


-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT * FROM CITY 
WHERE COUNTRYCODE = "JPN";


-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT NAME FROM CITY 
WHERE COUNTRYCODE = "JPN";


-- Query a list of CITY and STATE from the STATION table.

SELECT CITY, STATE FROM STATION;


-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT CITY FROM STATION
WHERE ID%2 = 0;


-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(CITY)-COUNT(DISTINCT CITY) FROM STATION;


/*Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered*/

SELECT CITY, LENGTH(CITY) AS NL		-- nl is city name length
FROM STATION
ORDER BY NL ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS NL
FROM STATION
ORDER BY NL DESC, CITY ASC
LIMIT 1;


-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u');


-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION 
WHERE SUBSTRING(CITY, LENGTH(CITY), 1) IN ('a', 'e', 'i', 'o', 'u');


-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) IN ('A', 'E', 'I', 'O', 'U')
  AND SUBSTRING(CITY, LENGTH(CITY), 1) IN ('A', 'E', 'I', 'O', 'U')
  ORDER BY CITY;


-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u');


-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION 
WHERE SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('a', 'e', 'i', 'o', 'u');


-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
OR SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('A', 'E', 'I', 'O', 'U')
ORDER BY CITY;


-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE SUBSTRING(CITY, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
AND SUBSTRING(CITY, LENGTH(CITY), 1) NOT IN ('A', 'E', 'I', 'O', 'U')
ORDER BY CITY;


/*Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/

SELECT NAME FROM STUDENTS
WHERE MARKS>75
ORDER BY RIGHT(NAME, 3), ID ASC;


-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name FROM Employee
ORDER BY name ASC;


/*Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  
per month who have been employees for less than  months. Sort your result by ascending employee_id.*/

SELECT name FROM Employee
WHERE salary>2000 AND months<10
ORDER BY employee_id ASC;


-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 388.7780. Round your answer to 4 decimal places.

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


/*Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
Output one of the following statements for each record in the table:
Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.*/

SELECT 
    CASE
        WHEN  A+B<=C OR A+C<=B OR B+C<=A THEN 'Not A Triangle'
        WHEN A=B AND B=C THEN 'Equilateral'
        WHEN A=B OR B=C OR C=A THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TT
FROM TRIANGLES;


/*Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.*/

SELECT concat(Name, '(',left(occupation,1),')') AS Names 
FROM OCCUPATIONS
ORDER BY Name;

SELECT concat('There are a total of ', count(Name), ' ', lower(Occupation), 's.') 
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation);



-- I used NorthWind Database for practicing complex queries of SQL

USE northwind;

SELECT * FROM Products;

-- Retrieve the product name, unit price, and units in stock of all products that cost less than $100, ordered by product name

SELECT ProductName, UnitPrice, UnItsinStock
FROM Products
WHERE UnitPrice < 100
ORDER BY ProductName;

SELECT * FROM Orders;

-- Retrieve the order ID, customer ID, and order date of all orders that do not have a customer ID, ordered by order date

SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE CustomerID IS NULL
ORDER BY OrderDate;


-- Write a query to show a list of customers and their corresponding orders.

-- Here we use inner join

SELECT C.CompanyName, P.ProductName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID 
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID;

-- Write a query to show a list of employees and their corresponding managers.

-- Here we use self join.

SELECT E.FirstName AS emp_name, M.FirstName AS manger_name
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID;


-- Write a query to show a list of customers who have not placed any orders.

-- Here we use left anti join.

SELECT C.CompanyName, P.ProductName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID 
LEFT JOIN [Order Details] OD ON O.OrderID = OD.OrderID
LEFT JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductID IS NULL;

-- Write a query to show a list of employees and their corresponding territories, including those employees who have no territories assigned.

SELECT * FROM Territories;
SELECT * FROM Employees;
SELECT * FROM EmployeeTerritories;

SELECT E.FirstName, T.TerritoryDescription
FROM Employees E
LEFT JOIN EmployeeTerritories ET ON E.EmployeeID = ET.EmployeeID
LEFT JOIN Territories T ON ET.TerritoryID = T.TerritoryID;


