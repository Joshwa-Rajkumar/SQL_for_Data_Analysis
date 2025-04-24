use restaurant_db;

-- 1. Menu Items
SELECT * FROM menu_items;

-- 2. No. of Items
SELECT COUNT(*) AS "Total Items" FROM menu_items;

-- 3. Most Expensive Items
SELECT item_name AS "Most Expensive Item", price FROM menu_items
WHERE price = (SELECT max(price) FROM menu_items);

-- 4. Categories of Item and their Numbers
SELECT category, COUNT(item_name) AS "No. of Items" FROM menu_items
GROUP BY category;

-- 5. Most Expensive Items in each Category
SELECT category, item_name AS "Most Expensive Items" , price
FROM menu_items
WHERE price IN (
    SELECT MAX(price)
    FROM menu_items AS mi2
    WHERE mi2.category = menu_items.category
)
ORDER BY category;

-- 6. Average price in each Category
SELECT category, AVG(price) AS "Average Price"
FROM menu_items
GROUP BY category;