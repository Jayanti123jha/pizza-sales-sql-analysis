-- Q.1.Retrieve the total number of orders placed.

-- SELECT * FROM orders
SELECT count(order_id) as total_order_placed FROM orders;

