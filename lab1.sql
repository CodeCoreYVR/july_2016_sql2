--Assignment: [lab] Queries 1
--Write the following SQL Queries:
--1- Find the average line item total price for orders that were completed last month
--2- Select product titles and prices that sold last month and the lowest they were sold at.
--[Note] the price in the line_items table is price per unit and not total price
--SELECT order.id, AVG(price*quantity) FROM line_items
--INNER JOIN orders
--ON orders.id = line_items.order_id
--WHERE completed_on
--BETWEEN '2016-01-01' AND '2016-01-31'
--GROUP BY orders.id

--SELECT AVG(price) AS avg_line_item_price FROM line_items
--INNER JOIN orders ON line_items.order_id = orders.id
--WHERE orders.created_at BETWEEN '2016-01-01' AND '2016-01-31';

--2
--SELECT products.name, products.price, line_items.price AS sold_items FROM products
--INNER JOIN line_items
--ON products.id = line_items.product_id
--INNER JOIN orders
--ON line_items.order_id = orders.id
--WHERE completed_on
--BETWEEN '2016-01-01' AND '2016-01-31'

SELECT products.name, MIN(line_items.price) AS lowest_price, COUNT(*)
FROM line_items
INNER JOIN products ON line_items.product_id = products.id
GROUP BY products.name
ORDER BY lowest_price DESC;
