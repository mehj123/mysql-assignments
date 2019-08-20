SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS SalesMonth,
    orders.ship_state_province as State,
    CONCAT('$',
            FORMAT(SUM(quantity * products.list_price),
                2)) AS TotalSales
FROM
    orders
        JOIN
    order_details ODT ON orders.id = ODT.order_id
        JOIN
    products ON ODT.product_id = products.id
WHERE
    odt.status_id = 2
GROUP BY SalesMonth,State 
ORDER BY SalesMonth ASC;
