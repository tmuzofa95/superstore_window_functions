use Superstore;

/*Total Sales and Profit by Category and Sub-Category*/
SELECT 
    Category,
    SubCategory,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM orders
GROUP BY Category, SubCategory
ORDER BY Category, TotalSales DESC;

/*Monthly Sales Trend*/
SELECT 
    FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth,
    ROUND(SUM(Sales), 2) AS MonthlySales
FROM orders
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY OrderMonth;

/*Top 10 Best-Selling Products by Revenue*/
SELECT TOP 10
    ProductName,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM orders
GROUP BY ProductName
ORDER BY TotalSales DESC;

/*Top 10 Customers by Total Spend*/
SELECT TOP 10
    CustomerID,
    CustomerName,
    ROUND(SUM(Sales), 2) AS TotalSpend
FROM orders
GROUP BY CustomerID, CustomerName
ORDER BY TotalSpend DESC;

/*Customer Segmentation Breakdown*/
SELECT 
    Segment,
    COUNT(DISTINCT OrderID) AS TotalOrders,
    ROUND(SUM(Sales), 2) AS TotalRevenue
FROM orders
GROUP BY Segment
ORDER BY TotalRevenue DESC;

/*Average Shipping Time by Ship Mode*/
SELECT 
    ShipMode,
    ROUND(AVG(DATEDIFF(DAY, OrderDate, ShipDate)), 1) AS AvgShippingDays
FROM orders
GROUP BY ShipMode
ORDER BY AvgShippingDays;

/*Sales and Profit by Region and State*/
SELECT 
    Region,
    State,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM orders
GROUP BY Region, State
ORDER BY Region, TotalSales DESC;

/*Which Citys Generates the Most Revenue*/
SELECT TOP 3
    City,
    State,
    ROUND(SUM(Sales), 2) AS TotalRevenue
FROM orders
GROUP BY City, State
ORDER BY TotalRevenue DESC;

/*Discount Impact on Profit*/
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low Discount (1-20%)'
        WHEN Discount <= 0.4 THEN 'Medium Discount (21-40%)'
        ELSE 'High Discount (40%+)'
    END AS DiscountBand,
    COUNT(*) AS TotalOrders,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND(AVG(Profit / NULLIF(Sales, 0)) * 100, 2) AS AvgProfitMarginPct
FROM orders
GROUP BY 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low Discount (1-20%)'
        WHEN Discount <= 0.4 THEN 'Medium Discount (21-40%)'
        ELSE 'High Discount (40%+)'
    END
ORDER BY AvgProfitMarginPct DESC;

/*Year-to-Year Sales Comparison*/
SELECT 
    YEAR(OrderDate) AS OrderYear,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    COUNT(DISTINCT OrderID) AS TotalOrders
FROM orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

/*Sub-Category with Highest Profit Margin Percentage*/
SELECT 
    SubCategory,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND((SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100, 2) AS ProfitMarginPct
FROM orders
GROUP BY SubCategory
ORDER BY ProfitMarginPct DESC;

/*Average Order Value per Customer Segment*/
SELECT 
    Segment,
    COUNT(DISTINCT OrderID) AS TotalOrders,
    ROUND(SUM(Sales), 2) AS TotalRevenue,
    ROUND(SUM(Sales) / NULLIF(COUNT(DISTINCT OrderID), 0), 2) AS AvgOrderValue
FROM orders
GROUP BY Segment
ORDER BY AvgOrderValue DESC;

/*Bottom 10 Worst Performing Products by Profit*/
SELECT TOP 10
    ProductName,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM orders
GROUP BY ProductName
ORDER BY TotalProfit ASC;