--I used NorthWind Database for practicing complex queries of SQL

USE northwind;

SELECT * FROM Products;

--Retrieve the product name, unit price, and units in stock of all products that cost less than $100, ordered by product name

SELECT ProductName, UnitPrice, UnItsinStock
FROM Products
WHERE UnitPrice < 100
ORDER BY ProductName;

SELECT * FROM Orders;

--Retrieve the order ID, customer ID, and order date of all orders that do not have a customer ID, ordered by order date

SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE CustomerID IS NULL
ORDER BY OrderDate;


--Write a query to show a list of customers and their corresponding orders.

--Here we use inner join

SELECT C.CompanyName, P.ProductName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID 
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID;

--Write a query to show a list of employees and their corresponding managers.

--Here we use self join.

SELECT E.FirstName AS emp_name, M.FirstName AS manger_name
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID;


--Write a query to show a list of customers who have not placed any orders.

--Here we use left anti join.

SELECT C.CompanyName, P.ProductName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID 
LEFT JOIN [Order Details] OD ON O.OrderID = OD.OrderID
LEFT JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductID IS NULL;

--Write a query to show a list of employees and their corresponding territories, including those employees who have no territories assigned.

SELECT * FROM Territories;
SELECT * FROM Employees;
SELECT * FROM EmployeeTerritories;

SELECT E.FirstName, T.TerritoryDescription
FROM Employees E
LEFT JOIN EmployeeTerritories ET ON E.EmployeeID = ET.EmployeeID
LEFT JOIN Territories T ON ET.TerritoryID = T.TerritoryID;