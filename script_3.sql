SELECT 
    i.BatchID,
    p.ProductName,
    i.CurrentStock,
    i.ExpiryDate,
    p.UnitCost,
    (i.CurrentStock * p.UnitCost) AS PotentialRevenueLoss,
    CASE 
        WHEN i.ExpiryDate <= CURRENT_DATE + INTERVAL '30 days' THEN 'Critical: < 30 Days'
        WHEN i.ExpiryDate <= CURRENT_DATE + INTERVAL '90 days' THEN 'Warning: 31-90 Days'
        ELSE 'Safe'
    END AS ExpiryRiskStatus
FROM Inventory_Batches i
JOIN Products p ON i.ProductID = p.ProductID
WHERE i.ExpiryDate <= CURRENT_DATE + INTERVAL '90 days'
AND i.CurrentStock > 0
ORDER BY i.ExpiryDate ASC;
