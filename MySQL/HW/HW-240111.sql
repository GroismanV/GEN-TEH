-- уровень сложности: ## В рамках БД "онлайн-магазин" напишите след/запросы:
-- Найти мин / стоимость товаров для каждой категории.
SELECT Categories.CategoryName,
    MIN(Products.Price) AS MinPrice
FROM Products
    JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName;

-- Вывести названия категорий,в которых более 10 товаров
SELECT CategoryName
FROM Categories
    JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
HAVING COUNT(Products.ProductID) > 10;

    --  Вывести три самых дешевых заказа

    SELECT OrderID, CustomerID, OrderDate
FROM Orders
    JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderID, CustomerID, OrderDate
ORDER BY MIN(Product.Price)
   
    --  Вывести имена и фамилии (и ко - во заказов) менеджеров, у которых ко - во заказов менее 15
    SELECT Employees.FirstName,
    Employees.LastName
FROM Employees
    LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
HAVING COUNT(Orders.OrderID) < 15;

    --  Вывести ТОП -1 стран по ко - ву клиентов
    SELECT Country,
    COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY Country
ORDER BY CustomerCount DESC
LIMIT 1;