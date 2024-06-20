-- уровень сложности: 1. Создать таблицу students(1)
--     firstname varchar not null
--     lastname varchar not null

--     age integer
--     subject varchar not null
--     mark numeric(2, 1) от 0 до 5

students1create table students1 (
firstname varchar(128) not null,
lastname varchar(128) not null,
age int,
subject varchar(128) not null,
mark numeric(2, 1) check (mark >= 0 and mark <= 5)
);

--     Добавить поле id уникальное значение, не null, автозаполнение в начало таблицы 
alter table students1
add id int primary key auto_increment first;

--     Изменить тип mark на integer
alter table students1
modify column mark integer;subject
--     Удалить поле age
alter table students1
drop column age;

--     Добавить поле class integer от 1 до 10, вставить после lastname
alter table students1
add class int check (class >=1 and class <=10) after lastname;

--     Заполнить таблицу строками (10 шт)
insert into students1(firstname,lastname,class,subject,mark)
values ('Vasia', "Vasiliev", 1, 'matemat', 5),
		('Petia', "Petrov", 2, 'matemat', 4),
        ('Zina', "Zinovieva", 8, 'algebra', 3),
        ('Fedia', "Fiodorov", 5, 'himia', 3.5),
        ('Ivan', "Ivanov", 10, 'penie', 5),
        ('Zoia', "Zoikina", 6, 'fizika', 2),
        ('Vlad', "Groisman", 10, 'IT', 5),
        ('Sidor', "Sidorov", 9, 'fiskultura', 4.7),
        ('Sveta', "Svetlakova", 2, 'matemat', 3.8),
        ('Olia', "Olovianaia", 7, 'english', 5);


--     Удалить из таблицы студентов, у которых оценка 0

delete from students1
WHERE mark = 0;


--     Найти всех студентов, у которых оценка выше 3
SELECT 
    *
FROM
    students1
WHERE
    mark > 3;

--     Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
SELECT 
    *
FROM
    students1
WHERE
    class = 1 AND mark < 3;

-- Удалить из таблицы этих студентов
DELETE FROM students1 
WHERE
    class = 1 AND mark < 3;


-- Найти всех студентов, у которых длина имени больше 4 
SELECT 
    *
FROM
    students1
WHERE
    LENGTH(firstname) > 4;

-- Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 символов.
select*
from students1
where lastname like "a___%";


-- Удалить таблицу.
drop table students1;

