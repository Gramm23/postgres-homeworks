-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, доставленные в страны France, Germany, Spain (таблица orders, колонка ship_country)
SELECT * FROM ORDERS
WHERE SHIP_COUNTRY IN ('France', 'Germany', 'Spain')

-- 2. уникальные страны и города, куда отправлялись заказы, отсортировать по странам и городам (таблица orders, колонки ship_country, ship_city)
SELECT DISTINCT ship_country, ship_city
FROM ORDERS
ORDER BY ship_country

-- 3. сколько дней в среднем уходит на доставку товара в Германию (таблица orders, колонки order_date, shipped_date, ship_country)
SELECT DISTINCT  AVG(SHIPPED_DATE-ORDER_DATE) AS numeric
FROM ORDERS
WHERE SHIP_COUNTRY = 'Germany'

-- 4. минимальную и максимальную цену среди продуктов, не снятых с продажи (таблица products, колонки unit_price, discontinued не равно 1)
SELECT MIN(unit_price) AS min, MAX(unit_price) AS max
FROM PRODUCTS
WHERE DISCONTINUED <> 1

-- 5. минимальную и максимальную цену среди продуктов, не снятых с продажи и которых имеется не меньше 20 (таблица products, колонки unit_price, units_in_stock, discontinued не равно 1)
SELECT MIN(unit_price) AS min, MAX(unit_price) AS max
FROM PRODUCTS
WHERE DISCONTINUED <> 1 AND units_in_stock >= 20