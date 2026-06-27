-- Q.9. Group the orders by date and calculate the average 
-- number of pizzas ordered per day.


WITH
	DAILY_ORDER AS (
		SELECT
			ORDERS.DATE,
			SUM(ORDER_DETAILS.QUANTITY) AS AVERAGE_NO_OF_PIZZAS
		FROM
			ORDERS
			JOIN ORDER_DETAILS ON ORDERS.ORDER_ID = ORDER_DETAILS.ORDER_ID
			-- join orders on order_detail.order_id = orders.order_id
		GROUP BY
			ORDERS.DATE
		ORDER BY
			ORDERS.DATE
	)
SELECT
	ROUND(AVG(AVERAGE_NO_OF_PIZZAS), 0)
FROM
	DAILY_ORDER;