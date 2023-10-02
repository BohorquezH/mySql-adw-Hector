-- BUSCAR CLIENTE
SELECT SOH.CustomerID,
        C.CustomerID, C.StoreID,
        P.BusinessEntityID, P.PersonType, P.Title, CONCAT(P.FirstName, ' ', P.LastName) AS Nombre, P.EmailPromotion,
        CONCAT(AD.AddressLine1,' ',AD.AddressLine2) AS Address, AD.City, AD.StateProvinceID,
        SP.Name
FROM Sales_SalesOrderHeader SOH
    INNER JOIN Sales_Customer C USING(CustomerID)
    INNER JOIN Person_Person P ON P.BusinessEntityID = C.CustomerID
    INNER JOIN Person_Address AD ON AD.AddressID = SOH.ShipToAddressID
    LEFT JOIN Person_StateProvince SP ON AD.StateProvinceID = SP.StateProvinceID
    INNER JOIN Sales_Store AS S ON S.BusinessEntityID = C.StoreID
-- WHERE CustomerID = 11012
LIMIT 20;