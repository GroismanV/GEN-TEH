-- Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT ProductName, Price
FROM Products 
    JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
ORDER BY Price DESC
LIMIT 1;

-- Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN  Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE CategoryName = "Beverages" AND Country = "USA"
ORDER BY Price DESC
LIMIT 2;

-- Вывести список стран, которые поставляют морепродукты

-- Не работает. Как поправить, я не знаю 

-- SELECT Country
-- FROM Suppliers
-- JOIN Products ON Suppliers.SupplierID = Products.SupplierID
-- JOIN Categories ON Suppliers.CategoryID = Categories.CategoryID
-- WHERE CategoryName.Categories = "Seafood";
