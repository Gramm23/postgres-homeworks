-- SQL-команды для создания таблиц
CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	title varchar(100) NOT NULL,
	birth_date DATE NOT NULL ,
	notes text
);

CREATE TABLE customers
(
	customer_id varchar(100) UNIQUE,
	company_name varchar(100) NOT NULL,
	contact_name varchar(100) NOT NULL
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer varchar(100) REFERENCES customers(customer_id) NOT NULL,
	employee int REFERENCES employees(employee_id) NOT NULL,
	order_date DATE NOT NULL,
	ship_city varchar(100)
);