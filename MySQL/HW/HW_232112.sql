-- Вывести ко-во товаров с ценой от 10 до 250 EUR
SELECT COUNT(*) AS total_count
FROM Products
WHERE price BETWEEN 10 AND 250;
-- Вывести ко-во поставщиков не из UK и не из China
SELECT COUNT(*) AS total_suppliers
FROM Suppliers
WHERE Country NOT IN ('UK', 'China');
-- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT AVG(Price) AS average_price,
  MAX(Price) AS max_price,
  MIN(Price) AS min_price,
  COUNT(*) AS total_products
FROM Products
WHERE CategoryID IN (3, 5);
-- Вывести общую сумму проданных товаров
SELECT SUM(Products.Price * OrderDetails.Quantity) AS total_sales
FROM OrderDetails
  JOIN Products ON OrderDetails.ProductID = Products.ProductID -- Вывести данные о заказах (номер заказа, имя клиента, страна клиента, фамилия менеджера, название компании перевозчика)
SELECT Orders.OrderID AS order_number,
  Customers.CustomerName AS customer_name,
  Customers.Country AS customer_country,
  Employees.LastName AS manager_last_name,
  Shippers.ShipperName AS shipper_company_name
FROM Orders
  JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
  JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID;
-- Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT SUM(Products.Price * OrderDetails.Quantity) AS total_amount_sent
FROM OrderDetails
  JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
  JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.Country = 'Germany';