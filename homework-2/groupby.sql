-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)
SELECT DISTINCT ship_city, ship_country
FROM ORDERS
WHERE SHIP_CITY LIKE '%burg'

-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.
SELECT ORDER_ID
	 , CUSTOMER_ID
	 , CAST(FREIGHT AS DECIMAL(10, 2)) AS FREIGHT
	 , SHIP_COUNTRY
FROM ORDERS
WHERE SHIP_COUNTRY LIKE 'P%'
ORDER BY FREIGHT  DESC LIMIT 10

-- 3. фамилию, имя и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)
SELECT FIRST_NAME
	   , LAST_NAME
	   , HOME_PHONE
FROM employees
WHERE REGION IS NULL

-- 4. количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране
SELECT COUNTRY, COUNT(*) AS count
FROM suppliers
GROUP BY COUNTRY
ORDER BY count DESC

-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)
SELECT SHIP_COUNTRY
     , CAST(SUM(FREIGHT) AS DECIMAL(10, 2)) AS FREIGHT
FROM ORDERS
WHERE SHIP_REGION IS NOT NULL
GROUP BY SHIP_COUNTRY
HAVING SUM(FREIGHT) > 2750;

-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
INTERSECT
SELECT country FROM EMPLOYEES

-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
EXCEPT
SELECT country FROM EMPLOYEES