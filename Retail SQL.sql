-- 1 .Create a database named RetailMartDB.
CREATE DATABASE RetailMartDB;

-- 2. Create a table customers with: customer_id, full_name, phone, email, city, created_at.

CREATE TABLE customers(
  customer_id INT ,
  full_name VARCHAR(30),
  phone INT,
  email VARCHAR(40),
  city VARCHAR(20),
  created_at DATE
  );
  
-- 3. Create a table products with: product_id, product_name, category, brand, unit_price, stock_qty.

CREATE TABLE products(
     product_id INT,
     product_name VARCHAR(20),
     category VARCHAR(30),
     brand VARCHAR(30),
     unit_price DECIMAL ,
     stoct_qty INT
);

-- 4. Create a table orders with: order_id, customer_id, order_date, order_status, channel, city.

CREATE TABLE orders(
     order_id INT,
     customer_id INT ,
     order_date DATE,
     order_status VARCHAR(30),
     channels VARCHAR(30),
     city VARCHAR(20)
     
     
);

-- 5. Create a table order_items with: order_item_id, order_id, product_id, quantity, unit_price, discount_pct.

CREATE TABLE order_items(
     order_item_id INT,
     order_id INT,
     product_id INT,
     quantity VARCHAR(30),
     unit_price DECIMAL,
     discount_pct DECIMAL
);

-- 6. Add a new column gender to the customers table.
ALTER TABLE customers ADD gender VARCHAR(10);

-- 7. Rename the column phone in customers to mobile_no.
ALTER TABLE customers RENAME COLUMN phone TO mobile_no;

-- 8. Change the datatype of email in customers to allow longer email values.
ALTER TABLE customers MODIFY email VARCHAR(150);

-- 9. Remove the column stock_qty from the products table.
ALTER TABLE products DROP COLUMN stoct_qty;

-- 10. Rename the table orders to customer_orders.
RENAME TABLE customers TO customers_orders;

-- 11. Delete the table order_items.
DROP TABLE order_items;

-- 12. Delete the database RetailMartDB.
DROP DATABASE retailmartdb;

-- 13. Insert 10 sample rows into customers (use different cities and created dates).
INSERT INTO customers(customer_id,full_name,mobile_no,email,city,created_at,gender) VALUES
(101,'Amit Sharma','9876543210','amit@gmail.com','Pune','2025-12-01','Male'),
(102,'Neha Patil','9123456780','neha@gmail.com','Mumbai','2026-01-05','Female'),
(103,'Ravi Verma','9988776655','ravi@gmail.com','Delhi','2026-01-10','Male'),
(104,'Sneha Joshi','9012345678','sneha@gmail.com','Pune','2026-01-12','Female'),
(105,'Kiran Rao','9090909090','kiran@gmail.com','Bangalore','2026-01-15','Male'),
(106,'Anjali Shah','9871234560','anjali@gmail.com','Ahmedabad','2026-01-18','Female'),
(107,'Vikas Gupta','9988112233','vikas@gmail.com','Delhi','2026-01-20','Male'),
(108,'Pooja Mehta','9000011111','pooja@gmail.com','Mumbai','2026-01-22','Female'),
(109,'Rahul Singh','9111222333','rahul@gmail.com','Pune','2026-01-25','Male'),
(110,'Meera Nair','9222333444','meera@gmail.com','Chennai','2026-01-28','Female');

-- 14. Insert 12 sample rows into products (use at least 4 categories and 3 brands).
INSERT INTO products(product_id,product_name,category,brand,unit_price) VALUES
(1,'iPhone 14','Electronics','Apple',70000),
(2,'Galaxy S23','Electronics','Samsung',65000),
(3,'Redmi Note 12','Electronics','Xiaomi',18000),
(4,'Dell Laptop','Computers','Dell',55000),
(5,'HP Laptop','Computers','HP',52000),
(6,'Boat Headphones','Accessories','Boat',2500),
(7,'Sony Headphones','Accessories','Sony',4500),
(8,'Office Chair','Furniture','Ikea',6000),
(9,'Dining Table','Furniture','Ikea',15000),
(10,'Mixer Grinder','Home Appliances','Philips',3500),
(11,'Air Fryer','Home Appliances','Philips',9000),
(12,'Smart Watch','Accessories','Noise',3000);

-- 15. Insert 15 sample rows into customer_orders (mix order status and channels).
INSERT INTO customers_orders (order_id,customer_id,order_date,order_status,channels,city) VALUES
(1,101,'2026-01-01','DELIVERED','ONLINE','Pune'),
(2,102,'2026-01-02','SHIPPED','STORE','Mumbai'),
(3,103,'2026-01-03','CANCELLED','ONLINE','Delhi'),
(4,104,'2026-01-05','DELIVERED','ONLINE','Pune'),
(5,105,'2026-01-07','DELIVERED','STORE','Bangalore'),
(6,106,'2026-01-10','PENDING','ONLINE','Ahmedabad'),
(7,107,'2026-01-12','DELIVERED','ONLINE','Delhi'),
(8,108,'2026-01-14','SHIPPED','STORE','Mumbai'),
(9,109,'2026-01-16','DELIVERED','ONLINE','Pune'),
(10,110,'2026-01-18','DELIVERED','STORE','Chennai'),
(1,111,'2026-01-20','DELIVERED','ONLINE','Pune'),
(2,112,'2026-01-22','CANCELLED','ONLINE','Mumbai'),
(3,113,'2026-01-24','DELIVERED','STORE','Delhi'),
(4,114,'2026-01-26','PENDING','ONLINE','Pune'),
(5,115,'2026-01-28','DELIVERED','STORE','Bangalore');

-- 16. Insert 40 sample rows into order_items (ensure quantities and prices look realistic).
INSERT INTO order_items(order_id,product_id,quantity,unit_price,discount_pct) VALUES
(1,1,1,70000,5),
(1,6,2,2500,10),
(2,2,1,65000,5),
(2,7,1,4500,0),
(3,3,2,18000,8),
(3,10,1,3500,0),
(4,4,1,55000,7),
(4,6,1,2500,5),
(5,5,1,52000,5),
(5,8,2,6000,10),
(6,9,1,15000,5),
(6,11,1,9000,0),
(7,1,1,70000,10),
(7,12,1,3000,0),
(8,2,1,65000,5),
(8,7,2,4500,5),
(9,3,1,18000,0),
(9,6,3,2500,5),
(10,10,1,3500,0),
(10,11,1,9000,5),
(11,4,1,55000,5),
(11,12,2,3000,10),
(12,5,1,52000,5),
(12,8,1,6000,0),
(13,1,1,70000,8),
(13,9,1,15000,5),
(14,2,1,65000,5),
(14,6,1,2500,0),
(15,3,2,18000,10),
(15,7,1,4500,5),
(1,11,1,9000,0),
(2,12,1,3000,5),
(3,8,1,6000,0),
(4,9,1,15000,5),
(5,10,1,3500,0),
(6,11,2,9000,5),
(7,12,1,3000,0),
(8,1,1,70000,5),
(9,2,1,65000,5),
(10,3,1,18000,0);

-- 17. Update the city of a specific customer using customer_id.
UPDATE customers 
SET customer_id= 101
WHERE city="Manglore";

-- 18. Increase unit_price by 8% for all products in a chosen category.
UPDATE products
SET unit_price=unit_price *8
WHERE products='Electronics';

-- 19. Reduce stock_qty by 5 for a specific product using product_id.
UPDATE products
SET stock_qty = stock_qty - 5
WHERE product_id = 3;

-- 20. Delete all orders having order_status as CANCELLED.
DELETE FROM orders WHERE order_status='CANCELLED';

-- 21. Delete a customer record using customer_id.
DELETE FROM customers WHERE customer_id=109;

-- 22. Display all customers from the city Pune.
SELECT * FROM customers WHERE city='Pune';

-- 23. Display all products where unit_price is greater than 2000.
SELECT * FROM products WHERE unit_price >2000;

-- 24. Display all orders placed using the ONLINE channel.
SELECT * FROM orders WHERE channels='ONLINE';

-- 25. Display all orders placed between 2026-01-01 and 2026-01-31.
SELECT * FROM orders WHERE order_date BETWEEN 2026-01-01 and 2026-01-31;

-- 26. Display all products with unit price between 500 and 1500.
SELECT * FROM products WHERE unit_price BETWEEN 500 and 1500;

-- 27. Display all order items where quantity is between 2 and 6.
SELECT * FROM order_items WHERE quantity BETWEEN 2 AND 6;

-- 28. Display the unique list of cities from customers.
SELECT DISTINCT city FROM customers;

-- 29. Display the unique list of categories from products.
SELECT DISTINCT category FROM products;

-- 30. Show all products sorted by unit_price from highest to lowest.
SELECT * 
FROM products
ORDER BY unit_price DESC;

-- 31. Show all customers sorted by created_at from newest to oldest.
SELECT * 
FROM customers 
ORDER BY created_at DESC;

-- 32. Show all orders sorted by order_date (oldest first) and then by order_status.

SELECT * 
FROM orders
ORDER BY order_date ASC ,order_status ASC;

-- 33. Show total number of orders per city.
SELECT city, COUNT(*)
FROM customer_orders
GROUP BY city;

-- 34. Show total number of customers per city.
SELECT city ,COUNT(*)
FROM customers
GROUP BY city;

-- 35. Show average product price per category.
SELECT category,AVG(unit_price)
FROM products 
GROUP BY category;

-- 36. Show total revenue per order based on quantity * unit_price * (1 - discount_pct/100).

-- 37. Show total revenue per category.

-- 38. Show total quantity sold per product.

-- 39. Show cities where the total number of orders is more than 5.

-- 40. Show categories where average unit price is greater than 2500.


-- 1. Display all customers whose city is not between Delhi and Pune(use alphabetical logic on city).
SELECT city
FROM customers
WHERE city NOT BETWEEN 'Delhi' AND 'Pune';

 -- 2. Display all orders whose order_date is not between 2026-01-05 and 2026-01-20-- .
SELECT order_date
FROM orders 
WHERE order_date NOT BETWEEN 2026-01-05 AND 2026-01-20;

-- 3. Display all products whose unit_price is not between 500 and 2000.

SELECT unit_price
FROM products
WHERE unit_price NOT BETWEEN 500 AND 2000;

-- 4. Display all customers whose customer_id is in (101, 104, 108, 110).

SELECT customer_id
FROM customers 
WHERE customer_id IN (101,104,108,110);

-- 5. Display all products whose category is in ('Electronics','Fitness','Stationery').

SELECT category
FROM products 
WHERE category IN ('Electronics','Fitness','Stationery');

-- 6. Display all orders whose order_status is in ('PLACED','DELIVERED').

SELECT order_status
FROM orders 
WHERE order_status IN ('PLACED','DELIVERED');

-- 7. Display all customers whose city is not in ('Pune','Mumbai').

SELECT city
FROM customers 
WHERE city NOT IN ('Pune','Mumbai');

-- 8. Display all products whose brand is not in ('Sony','Nike','Boat').

SELECT brand
FROM products 
WHERE brand NOT IN ('Sony','Nike','Boat');

-- 9. Display all orders whose channel is not in ('ONLINE').

SELECT channels
FROM orders 
WHERE channels NOT IN ('ONLINE');

-- 10. Insert 5 new customers where email is NULL for at least 2 customers.
INSERT INTO customers(customer_id,full_name,phone,email,city,created_at) VALUES
(101,'Anjali Pujari',9836483927,'anjali@gmail.com','Pune','2026-01-05'),
(102,'Shubhangi Arote',7385524040,NULL,'Delhi','2025-03-20'),
(103,'Riya Sharma',9890940034,'riya@gmail.com','Banglore','2023-10-23'),
(104,'Ananya More',9730174767,NULL,'Pune','2025-04-22'),
(105,'Sunanda Shetty',8208708722,'sunanda@gmail.com','Delhi','2022-03-20');


-- 11. Display all customers where email is null.

SELECT email 
FROM customers
WHERE email IS NULL;

-- 12. Display all customers where email is not null.

SELECT email
FROM customers 
WHERE email IS NOT NULL;

-- 13. Insert 6 new products where brand is NULL for at least 2 products.
INSERT INTO  products(product_id,product_name,category,brand,unit_price) VALUES
(1,'iPhone 14','Electronics','Apple',70000),
(2,'Galaxy S23','Electronics','Samsung',65000),
(3,'Redmi Note 12','Electronics','Xiaomi',18000),
(4,'Dell Laptop','Computers','Dell',55000),
(5,'HP Laptop','Computers','HP',52000),
(6,'Boat Headphones','Accessories','Boat',2500);

-- 14. Display all products where brand is null.

SELECT brand 
FROM products
WHERE brand IS NULL;

-- 15. Display all products where brand is not null.

SELECT brand
FROM products
WHERE brand IS NOT NULL ;

-- 16. Display the first 5 customers based on created_at (oldest first).

SELECT created_at 
FROM customers
LIMIT 5;

-- 17. Display the next 5 customers after skipping the first 5 customers based on created_at (oldest first).

SELECT created_at
FROM customers
LIMIT 5 
OFFSET 5; 

-- 18. Display the top 3 most expensive products.

SELECT product_name
FROM products
LIMIT 3;

-- 19. Display 5 products starting from the 6th most expensive product.

SELECT product_name
FROM products
LIMIT 5
OFFSET 6;

-- 20. Display 7 orders starting from the 4th most recent order (latest orders first).

SELECT *
FROM customers_orders 
ORDER BY order_date DESC
LIMIT 7
OFFSET 4;

