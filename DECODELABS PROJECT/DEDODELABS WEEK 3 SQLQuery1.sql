SELECT * FROM dbo.Sheet1$;
SELECT OrderID, Product,TotalPrice FROM dbo.Sheet1$

Orders that were delivered
SELECT * FROM DBO.Sheet1$ WHERE OrderStatus = 'Delivered'

Most Expensive orders
SELECT OrderID, PRODUCT, TotalPrice FROM dbo.Sheet1$ ORDER BY TotalPrice DESC;

Shipped orders from Instagram referrals
SELECT * FROM dbo.Sheet1$ WHERE OrderStatus = 'Shipped' AND ReferralSource = 'Instagram';

Total Revenue by Product
SELECT PRODUCT, SUM(TotalPrice) as TotalRevenue FROM dbo.Sheet1$ GROUP BY Product;

Count of Orders by status
SELECT OrderStatus, COUNT(*) AS OrderCount FROM dbo.Sheet1$ GROUP BY OrderStatus;

Average order values by payment method
SELECT PaymentMethod, AVG(TotalPrice) AS AvgOrderValue FROM dbo.Sheet1$ GROUP BY PaymentMethod;

Top referrral sources by revenue
SELECT ReferralSource, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue 
FROM dbo.Sheet1$ GROUP BY ReferralSource ORDER BY Revenue DESC;

Percentage Count by Order
SELECT OrderStatus,COUNT(*) AS Total,
    CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Sheet1$) AS DECIMAL(5,2)) AS Percentage
FROM dbo.Sheet1$
GROUP BY OrderStatus
ORDER BY Total DESC;