
-- FESTIVE SALES IMPACT ANALYSIS


SELECT ROUND(SUM(Revenue),2) AS Total_Revenue
FROM SalesData;

SELECT COUNT(Order_ID) AS Total_Orders
FROM SalesData;

SELECT Festival_Flag,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY Festival_Flag;

WITH Revenue_Comparison AS (
    SELECT Festival_Flag,
           SUM(Revenue) AS Revenue
    FROM SalesData
    GROUP BY Festival_Flag
)
SELECT ROUND(((MAX(Revenue)-MIN(Revenue))/MIN(Revenue))*100,2)
       AS Revenue_Growth_Percentage
FROM Revenue_Comparison;

SELECT Festival_Name,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
WHERE Festival_Flag='Festive'
GROUP BY Festival_Name
ORDER BY Revenue DESC;

SELECT Product_Category,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY Product_Category
ORDER BY Revenue DESC;

SELECT Product_Category,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
WHERE Festival_Flag='Festive'
GROUP BY Product_Category
ORDER BY Revenue DESC;

SELECT State,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY State
ORDER BY Revenue DESC;

SELECT City,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY City
ORDER BY Revenue DESC
LIMIT 5;

SELECT MONTH(Order_Date) AS Month_Number,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY MONTH(Order_Date)
ORDER BY Month_Number;

SELECT Payment_Mode,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY Payment_Mode
ORDER BY Revenue DESC;

SELECT Sales_Channel,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY Sales_Channel;

SELECT ROUND(AVG(Revenue),2) AS Average_Order_Value
FROM SalesData;

SELECT Product_Category,
       SUM(CASE WHEN Festival_Flag='Festive' THEN Revenue ELSE 0 END) AS Festive_Revenue,
       SUM(CASE WHEN Festival_Flag='Non-Festive' THEN Revenue ELSE 0 END) AS Non_Festive_Revenue
FROM SalesData
GROUP BY Product_Category
ORDER BY Festive_Revenue DESC;

SELECT Product_Name,
       ROUND(SUM(Revenue),2) AS Revenue
FROM SalesData
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;
