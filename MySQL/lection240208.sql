-- CASE

-- create database gt220823;
-- use gt220823;
-- select * from phones;
-- set sql_safe_updates = 0;

-- update phones
-- set starting_price = case
-- 						when product_count<5 then 1000
--                         when product_count between 5 and 10 then 1500
--                         else 2000
--                     end;
--                     
-- set sql_safe_updates = 1;


-- Изменение таблиц и столбцов

-- alter table table_name
-- 	add - добавление столбца
-- 	drop column - удаление столбца
-- 	modify - изменение типа данных
-- 	alter column - добаляем значение по умолчанию
-- 	change - изменение имени столбца  

use gt220823;
-- 1. Создать таблицу products
	-- id первичный ключ автоинкремент
	-- title строка 128
	-- quantity от 0 до 10
    -- quality 0 по умолчанию

-- ограничения
-- not null - не может быть null
-- unique - должно быть уникальным 
-- primary key - not null + unique
-- check - проверка условии
-- default - значение по умолчанию

create table products(
	id int primary key auto_increment,
    title varchar(128) not null,
    quantity int check(quantity between 0 and 10),
    quality int default 0
);

insert into products
values ('Apple', 15, 2);    
       
-- Error Code: 1136. Column count doesn't match value count at row 1
-- кол/во столбцов не совподает с кол/во значений

insert into products(title, quantity, quality)
values ('Apple', 15, 2),
		(),
        ();   

-- Error Code: 3819. Check constraint 'products_chk_1' is violated.
-- проверить ограничение, первый check

insert into products(title, quantity, quality)
values ('Apple', 9, 2);  

select * from products;

insert into products(title, quantity)
values ('Banana', 5);  

-- Добавить поле price integer со значением по умолчанию 0
alter table products
add price int default 0;

-- Изменить тип price на numeric(3, 2) 
alter table products
modify column price numeric(3, 2);

-- change старое_имя новое_имя тип_данных(можно изменить)

-- Переименовать поле price на item_price
alter table products
change price item_price int;

-- Удалить поле item_price
alter table products
drop column item_price;


-- Создать таблицу students с полями
-- name строка(128) (не null)
-- lastname строка(128) (не null)
-- avg_mark целое число (от 0 до 5)вкл. концы 
-- gender строка(128) (или “M” или “F”)

create table students(
	name varchar(128) not null,
    lastname varchar(128) not null,
    avg_mark int check(avg_mark between 0 and 5),
    gender varchar(128) check(gender in ('M', 'F'))
);

-- Добавить поле id integer primary key auto_increment
alter table students
add id int primary key auto_increment;

-- Удаление поле id
alter table students
drop column id;

-- Добавить поле id integer primary key auto_increment в начало
alter table students
add id int primary key auto_increment first;

-- Добавить поле age после lastname
alter table students
add age int after lastname;

-- Поменять тип у gender на char(1)
alter table students
modify column gender char(1);

-- Поменять тип у avg_mark на numeric(2, 1)
alter table students
modify column avg_mark numeric(2, 1);

-- alter table ...
-- add ..., 
-- drop ...,
-- modify ...

-- Переименовать поле name на firstname 
alter table students
change name firstname varchar(128);

-- Заполнить таблицу(5 строк)
insert into students(firstname, lastname, age, avg_mark, gender)
values('John', 'Smith', 20, 4.2, 'M'),
		('Bob', 'Brown', 19, 5, 'M'),
        ('Laura', 'Hardy', 17, 4, 'F');

select * from students;

 -- Создать таблицу employees;
-- employee_id целое число первичный ключ автоинкремент;
-- fname строка не null,
-- last_name строка не null,
-- email строка не null,
-- phone строка не null

create table employees(
	employee_id int primary key auto_increment,
	fname varchar(128) not null,
	last_name varchar(128) not null,
	email varchar(128) not null,
	phone varchar(128) not null
);

-- Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2),
alter table employees
add salary numeric(9, 2);

--  Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer
alter table employees
modify column salary int;

-- Переименовать поле fname на first_name
alter table employees
change fname first_name varchar(128);

-- Удалить поле phone
alter table employees
drop column phone;

-- Добавить поле department строка не null 
alter table employees
add department varchar(128) not null;