CREATE SCHEMA company_sales;

CREATE TABLE departments
(
    department_id  SERIAL PRIMARY KEY,
    depatment_name VARCHAR(120)
);

INSERT INTO departments (depatment_name)
VALUES ('Sales'),
       ('Marketing'),
       ('IT'),
       ('Finance'),
       ('HR');

CREATE TABLE customers
(
    customer_id   SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    department_id INT
);

-- Добавление данных в таблицу customers
INSERT INTO customers (customer_name, department_id)
VALUES ('John', 1),
       ('Alice', 2),
       ('Bob', 3),
       ('Eve', 1),
       ('Charlie', 4),
       ('George', NULL),
       ('Clint', NULL),
       ('Mike', NULL);

--INNER JOIN (default) Возвращает только те строки, для которых есть совпадение
-- в обеих таблицах (по указанным условиям)
SELECT c.customer_name, d.depatment_name
FROM customers c
         INNER JOIN departments d ON c.department_id = d.department_id;

SELECT c.customer_name, d.depatment_name
FROM customers c
         --INNER
         JOIN departments d ON c.department_id = d.department_id;

--LEFT JOIN (default)
--Возвращает все строки из левой таблицы (первой таблицы в JOIN), а также строки из правой таблицы
-- (второй таблицы в JOIN), для которых есть совпадение по условию.
-- Если в правой таблице нет совпадений, будут возвращены справа NULL-значения.
SELECT c.customer_name, d.depatment_name
FROM customers c
         LEFT JOIN departments d ON c.department_id = d.department_id;

-- RIGHT JOIN:
-- Аналогично LEFT JOIN, но возвращает все строки
-- из правой таблицы и только совпадающие строки из левой таблицы слева Null
SELECT c.customer_name, d depatment_name
FROM customers c
         RIGHT JOIN departments d ON c.department_id = d.department_id;