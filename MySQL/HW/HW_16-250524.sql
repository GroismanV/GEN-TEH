-- Создание базы данных
CREATE DATABASE payment_system;
-- Переход к базе данных
USE payment_system;
-- Создание таблицы друзей
CREATE TABLE friends (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    transaction_amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    CHECK (transaction_amount > 0),
    CHECK (currency IN ('USD', 'EUR', 'RUB'))
);
-- Добавление записей в таблицу
INSERT INTO friends (name, transaction_amount, currency)
VALUES ('Alice', 100.00, 'USD'),
    ('Bob', 150.50, 'EUR'),
    ('Charlie', 200.75, 'USD'),
    ('Diana', 50.25, 'RUB'),
    ('Eve', 300.00, 'EUR');
-- Запрос для получения суммы всех транзакций по каждой валюте
SELECT currency,
    SUM(transaction_amount) AS total_amount
FROM friends
GROUP BY currency
ORDER BY currency;