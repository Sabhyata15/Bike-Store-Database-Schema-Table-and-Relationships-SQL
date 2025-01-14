-- Relationship queries

-- 1. Rerieve all orders with customers details
SELECT 
    orders.order_id,
    orders.order_date,
    customers.first_name,
    customers.last_name,
    customers.email
FROM
    orders
        INNER JOIN
    customers ON orders.cust_id = customers.cust_id;
    
-- 2. List all products grouped by their category with category names
SELECT 
    categories.category_name,
    products.product_name,
    products.list_price
FROM
    products
        INNER JOIN
    categories ON products.category_id = categories.category_id
ORDER BY categories.category_name;

-- 3. Show staff members and the stores they work at
SELECT 
    staffs.first_name,
    staffs.last_name,
    stores.store_name,
    stores.city
FROM
    staffs
        INNER JOIN
    stores ON staffs.store_id = stores.store_id;

-- 4. Display the number of products available in each store
SELECT 
    stores.store_name, products.product_name, stocks.quantity
FROM
    stocks
        INNER JOIN
    stores ON stocks.store_id = stores.store_id
        INNER JOIN
    products ON stocks.product_id = products.product_id
ORDER BY stores.store_name , products.product_name;
    
-- 5. Get the total sales (quantity and revenue) by brand
SELECT 
    brands.brand_name,
    SUM(order_items.quantity) AS total_quantity_sold,
    SUM(order_items.quantity * order_items.list_price) AS total_revenue
FROM
    order_items
        INNER JOIN
    products ON order_items.product_id = products.product_id
        INNER JOIN
    brands ON products.brand_id = brands.brand_id
GROUP BY brands.brand_name
ORDER BY total_revenue DESC;
    
-- 6. Find customers who have spent the most money
SELECT 
    customers.first_name,
    customers.last_name,
    customers.email,
    SUM(order_items.quantity * order_items.list_price) AS total_spent
FROM
    order_items
        INNER JOIN
    orders ON order_items.order_id = orders.order_id
        INNER JOIN
    customers ON orders.cust_id = customers.cust_id
GROUP BY customers.cust_id , customers.first_name , customers.last_name , customers.email
ORDER BY total_spent DESC
LIMIT 10;

-- 7. Total Sales by Year
SELECT 
    YEAR(orders.order_date) AS sales_year,
    SUM(order_items.quantity * order_items.list_price) AS total_sales
FROM 
    orders
INNER JOIN 
    order_items ON orders.order_id = order_items.order_id
GROUP BY 
    YEAR(orders.order_date)
ORDER BY 
    sales_year;


