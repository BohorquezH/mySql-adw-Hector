use adw;
-- NOMBRE CLIENTE
-- SALKES PERSON ID 
-- NOMBRE DEL TERRITORIO

SELECT 
    sales.SalesOrderID,
    sales.OrderDate,
    sales.CustomerID,
    CONCAT(person.FirstName,' ', person.LastName) AS CustomerName,
    sales.SalesPersonID,
    CONCAT(employee.FirstName,' ', employee.LastName) AS SalesPersonName,
    sales.TerritoryID, 
    salesterritory.Name AS Territory
FROM Sales_SalesOrderHeader AS sales
    JOIN Sales_Customer AS client
        ON sales.CustomerID = client.CustomerID
    LEFT OUTER JOIN Person_Person AS person
        ON client.PersonID = person.BusinessEntityID
    JOIN Sales_SalesPerson AS salesperson
        ON sales.SalesPersonID = salesperson.BusinessEntityID
    LEFT OUTER JOIN Person_Person AS employee
        ON salesperson.BusinessEntityID = employee.BusinessEntityID
    JOIN Sales_SalesTerritory AS salesterritory
        ON salesterritory.TerritoryID = sales.TerritoryID
LIMIT 10;
    