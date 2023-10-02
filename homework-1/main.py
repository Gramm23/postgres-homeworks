import psycopg2
import csv


def execute_database_query(sql_statement):
    """
    Эта функция устанавливает соединение с базой данных PostgreSQL,
    выполняет указанный SQL-запрос и закрывает соединение.
    """
    conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="qwerty23")
    try:
        with conn:
            with conn.cursor() as cur:
                cur.execute(sql_statement)
    finally:
        conn.close()


def populate_table_from_csv(name_table, csv_file):
    """
    Заполнение таблиц данными из CSV файлов.
    """
    with open(csv_file, "r", newline="", encoding="utf-8") as file:
        rows = csv.reader(file)
        next(rows)
        for row in rows:
            cleaned_values = [value.replace("'", " ") for value in row]
            values = "', '".join(map(str, cleaned_values))
            sql_insert_statement = f"INSERT INTO {name_table} VALUES ('{values}');"
            execute_database_query(sql_insert_statement)


if __name__ == "__main__":
    # Заполнение таблиц данными
    populate_table_from_csv("employees", "north_data/employees_data.csv")
    populate_table_from_csv("customers", "north_data/customers_data.csv")
    populate_table_from_csv("orders", "north_data/orders_data.csv")
