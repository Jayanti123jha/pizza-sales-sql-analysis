-- Q.13. Determine the top 3 most ordered pizza types based 
-- on revenue for each pizza category.

with pizza_revenue as
(
select  pizza_types.category , pizza_types.name , sum(order_details.quantity * pizzas.price) as revenue 
from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by  pizza_types.category , pizza_types.name 
),

ranked_pizzas AS (
    SELECT
        category,
        name,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS rank_no
    FROM pizza_revenue
)

SELECT
    category,
    name,
    revenue
FROM ranked_pizzas
WHERE rank_no <= 3
ORDER BY category, revenue DESC;