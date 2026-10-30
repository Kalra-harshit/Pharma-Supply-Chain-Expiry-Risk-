SELECT 
    p.ProductName,
    l.FacilityName,
    SUM(s.QuantitySold) AS TotalSold_Last30Days,
    i.CurrentStock,
    (SUM(s.QuantitySold)::NUMERIC / NULLIF(i.CurrentStock, 0)) AS SellThroughRate
FROM Products p
JOIN Inventory_Batches i ON p.ProductID = i.ProductID
JOIN Sales_Records s ON i.BatchID = s.BatchID
JOIN Locations l ON i.LocationID = l.LocationID
WHERE s.SaleDate >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY p.ProductName, l.FacilityName, i.CurrentStock
ORDER BY TotalSold_Last30Days DESC;
