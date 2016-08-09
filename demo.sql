-- Assignment: [demo] Line Items for products
--
-- 1- Select all the products that have orders and their orders
SELECT products.name, COUNT(orders) FROM products
INNER JOIN line_items ON line_items.product_id = products.id
INNER JOIN orders ON orders.id = line_items.order_id

-- 2- Select all the products and their orders
--
-- [Note] the price in the line_items table is price per unit and not total price
SELECT products.name, COUNT(orders) FROM products
INNER JOIN line_items ON line_items.product_id = products.id
INNER JOIN orders ON orders.id = line_items.order_id
GROUP BY products.name
ORDER BY count DESC;

--BETWEEN '2015-07-01' AND '2015-07-31'
--NOW() - INTERVAL 1 MONTH

--SELECT products.name, COUNT(orders) FROM products
--INNER JOIN line_items ON line_items.product_id = products.id
--INNER JOIN orders ON orders.id = line_items.order_id
--GROUP BY products.name
--ORDER BY count DESC;


--orders table has order id
--line items table has assoc between order id and products
SELECT * FROM orders
WHERE completed_on
BETWEEN '2016-01-01' AND '2016-01-31';
--BETWEEN NOW() AND (NOW() - INTERVAL '1 MONTH');
