-- Q.7.Determine the distribution of orders by hour of the day


SELECT
	EXTRACT(
		HOUR
		FROM
			TIME
	) AS HOURS,
	COUNT(ORDER_ID) AS TOTAL_ORDERS
FROM
	ORDERS
GROUP BY
	HOURS
ORDER BY
	HOURS DESC;