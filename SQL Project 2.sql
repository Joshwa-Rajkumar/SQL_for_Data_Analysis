-- 1. View Order Details
SElECT * FROM order_details;

-- 2. Date Range of the table
SELECT 
	MIN(order_date) AS "START DATE", 
	MAX(order_date) AS "END DATE"
FROM order_details;

-- 3. Total Items sold
SELECT COUNT(*) AS "ITEMS SOLD"
FROM order_details;

-- 4. Total Orders made
SELECT COUNT(DISTINCT order_id) AS "ORDERS MADE"
FROM order_details;

-- 5. Big Order
SELECT 
	order_id AS "ORDER ID WITH MAXIMUM ITEMS",
	COUNT(item_id) AS "NO. OF ITEMS"
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) = (
    SELECT MAX(item_count)
    FROM (
        SELECT COUNT(item_id) AS item_count
        FROM order_details
        GROUP BY order_id
    ) AS subquery
);
