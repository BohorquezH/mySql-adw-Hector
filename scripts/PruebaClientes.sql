SELECT SOH.CustomerID AS customer_id,
        -- C.CustomerID, C.StoreID,
        -- P.BusinessEntityID, P.PersonType, P.Title, 
        CONCAT(P.FirstName, ' ', P.LastName) AS nombre_cliente, -- P.EmailPromotion,
        ST.TerritoryID AS territory_id, ST.Name AS nombre_territorio, ST.CountryRegionCode AS cod_region, ST.Group AS grupo_region
        -- CONCAT(AD.AddressLine1,' ',AD.AddressLine2) AS Address, AD.City, AD.StateProvinceID,
        -- SP.Name
FROM Sales_SalesOrderHeader SOH
    INNER JOIN Sales_Customer C USING(CustomerID)
    INNER JOIN Person_Person P ON P.BusinessEntityID = C.CustomerID
    INNER JOIN Person_Address AD ON AD.AddressID = SOH.ShipToAddressID
    LEFT JOIN Person_StateProvince SP ON AD.StateProvinceID = SP.StateProvinceID
    INNER JOIN Sales_SalesTerritory ST ON ST.TerritoryID = SOH.TerritoryID
    -- INNER JOIN Sales_Store AS S ON S.BusinessEntityID = C.StoreID
GROUP BY SOH.CustomerID,nombre_cliente,ST.TerritoryID, ST.Name, ST.CountryRegionCode, ST.Group
ORDER BY C.CustomerID
LIMIT 50;