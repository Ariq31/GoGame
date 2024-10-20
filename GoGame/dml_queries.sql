-- 1
SELECT 
	[StaffID] =	replace(s.StaffID, 'ST', 'Staff'),
	[StaffName] = UPPER(StaffName),
	[Total Sales] = COUNT(SalesID)
FROM staff s
JOIN sales_header sh ON s.StaffID = sh.StaffID
JOIN customer c ON sh.CustomerID = c.CustomerID
WHERE StaffGender = 'Male'
AND CustomerGender = 'Female'
GROUP BY replace(s.StaffID, 'ST', 'Staff'), UPPER(StaffName)

-- 2
SELECT
	ph.PurchaseID,
	[PurchaseDate] = CONVERT(VARCHAR, PurchaseDate, 103),
	[Total Game Type] = COUNT(gt.GameTypeID)
FROM purchase_header ph
JOIN purchase_detail pd ON ph.PurchaseID = pd.PurchaseID
JOIN game g ON pd.GameID = g.GameID
JOIN game_type gt ON g.GameTypeID = gt.GameTypeID
WHERE YEAR(PurchaseDate) = 2019
GROUP BY ph.PurchaseID, CONVERT(VARCHAR, PurchaseDate, 103)
HAVING COUNT(gt.GameTypeID) > 2

-- 3
SELECT DISTINCT
	[CustomerCode] = REVERSE(c.CustomerID),
	[CustomerName] = UPPER(CustomerName),
	[TotalTransaction] = COUNT(sh.SalesID),
	[MinimumPurchase] = MIN(sd.Quantity)
FROM customer c
JOIN sales_header sh ON c.CustomerID = sh.CustomerID
JOIN sales_detail sd ON sh.SalesID = sd.SalesID
WHERE LEFT(CustomerName, 1) = 'M'
GROUP BY REVERSE(c.CustomerID), UPPER(CustomerName)
HAVING COUNT(sh.SalesID) > 1

-- 4
SELECT
	s.SupplierID,
	[SupplierName] = CONCAT(SupplierName, ' Inc.'),
	[TotalGamesSold] = SUM(pd.Quantity),
	[MaximumGamesSold] = MAX(pd.Quantity)
FROM supplier s
JOIN purchase_header ph ON s.SupplierID = ph.SupplierID
JOIN purchase_detail pd ON ph.PurchaseID = pd.PurchaseID
WHERE SupplierAddress LIKE '%Drive%'
AND CAST(RIGHT(s.SupplierID, 3) AS INT) % 2 = 1
GROUP BY s.SupplierID, CONCAT(SupplierName, ' Inc.')

-- 5
SELECT
	PurchaseID,
	s.SupplierID,
	SupplierName,
	[StaffFirstName] = SUBSTRING(StaffName, 1, CHARINDEX(' ', StaffName) -1),
	StaffDoB
FROM supplier s
JOIN purchase_header ph ON s.SupplierID = ph.SupplierID
JOIN staff st ON ph.StaffID = st.StaffID, (
	SELECT AVG(StaffSalary) AS AverageSalary
	FROM staff
) AS x
WHERE StaffSalary > x.AverageSalary
AND YEAR(StaffDoB) > 2000

-- 6
SELECT
	sh.SalesID,
	TransactionDate,
	[CustomerName] = LOWER(CustomerName)
FROM customer c
JOIN sales_header sh ON c.CustomerID = sh.CustomerID
JOIN sales_detail sd ON sh.SalesID = sd.SalesID, (
	SELECT AVG(Quantity) AS AvgTransactionQuantity
	FROM sales_detail
) AS x
WHERE DATEDIFF(year, CustomerDoB, GETDATE()) < 24
AND Quantity > x.AvgTransactionQuantity

-- 7
SELECT
	[PurchasedDay] = DATENAME(WEEKDAY, PurchaseDate),
	[GameID] = REPLACE(g.GameID, 'GA', 'Game'),
	[GameReleasedYear] = YEAR(GameReleaseDate),
	[TotalPurchased] = COUNT(pd.PurchaseID)
FROM purchase_header ph
JOIN purchase_detail pd ON ph.PurchaseID = pd.PurchaseID
JOIN game g ON pd.GameID = g.GameID, (
	SELECT AVG(GamePrice) AS AveragePrice
	FROM game
) AS x
WHERE GamePrice > x.AveragePrice
AND DATENAME(QUARTER, GameReleaseDate) = 2
GROUP BY DATENAME(WEEKDAY, PurchaseDate), REPLACE(g.GameID, 'GA', 'Game'), YEAR(GameReleaseDate)

-- 8
SELECT
	[SalesID] = LOWER(sh.SalesID),
	[SalesDate] = CONVERT(VARCHAR, TransactionDate, 105),
	[TotalSalesCost] = CONCAT('Rp. ', FORMAT(SUM(Quantity * GamePrice), '#,0'))
FROM staff s
JOIN sales_header sh ON s.StaffID = sh.StaffID
JOIN sales_detail sd ON sh.SalesID = sd.SalesID
JOIN game g ON sd.GameID = g.GameID, (
	SELECT AVG(StaffSalary) AS AverageSalary
	FROM staff
) AS x
WHERE StaffSalary > x.AverageSalary
AND DATENAME(MONTH, TransactionDate) = 'February'
GROUP BY  LOWER(sh.SalesID), CONVERT(VARCHAR, TransactionDate, 105)
GO

-- 9
CREATE VIEW Customer_Quarterly_Transaction_View AS
SELECT 
	c.CustomerID, 
	CustomerName,
	[TotalTransaction] = COUNT(sh.SalesID),
	[MaximumPurchaseQuantity] = CONCAT(CAST(MAX(Quantity) AS VARCHAR), ' Pc(s)')
FROM customer c 
JOIN sales_header sh ON c.CustomerID = sh.CustomerID
JOIN staff s ON sh.StaffID = s.StaffID
JOIN sales_detail sd ON sh.SalesID = sd.SalesID
WHERE YEAR(TransactionDate) = 2021
AND StaffGender = 'Female'
GROUP BY c.CustomerID, CustomerName
GO

-- 10
CREATE VIEW QuarterlySalesReport AS
SELECT 
	[TotalSales] = CONCAT('Rp. ', FORMAT(SUM(Quantity * GamePrice), '#,0')),
	[AverageSales] = CONCAT('Rp. ', FORMAT(AVG(Quantity * GamePrice), '#,0'))
FROM sales_header sh
JOIN sales_detail sd ON sh.SalesID = sd.SalesID
JOIN game g ON sd.GameID = g.GameID
WHERE DATENAME(QUARTER, TransactionDate) = 1
AND GamePrice > 200000