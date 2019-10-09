DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;
use bamazon;

CREATE TABLE products (
	item_id INTEGER auto_increment NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    department_name VARCHAR(255) NOT NULL,
    price INTEGER NOT NULL,
    stock_quantity INTEGER not null,
    PRIMARY KEY(item_id)
);

INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Rice", "Food",1.5, 100);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Watch", "Attire",50, 10);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Suit", "Attire",150, 14);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Chips","Food",3, 50);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Paper Towel", "Kitchen",2.5, 150);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Pans", "Kitchen",10, 30);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Soup", "Food",2, 75);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Pillow", "Household",7.5, 12);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Couch", "Household",350, 3);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Pine-Sol", "Household",4, 40);
INSERT INTO products (product_name, department_name,
price, stock_quantity)
VALUES ("Oil, Car", "Misc",40, 30);