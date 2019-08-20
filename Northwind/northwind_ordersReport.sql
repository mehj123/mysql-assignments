SELECT 
    customers.first_name AS FirstName,
    customers.last_name AS LastName,
    date_format(order_date,'%M %D %Y') AS OrderDate,
    orders.ship_address as Street,
    orders.ship_city as City,   
    orders.ship_state_province as State,
    orders.ship_zip_postal_code as PostalCode,
	orders.ship_country_region as Country,
    shippers.company AS ShippingCompanyName,
    products.product_code AS ProductCode,
    products.product_name AS ProductName,
    format(products.list_price,2) AS ListPrice,
    format(order_details.quantity,0) AS Quantity,
    format(products.list_price * order_details.quantity ,2) AS TotalCost
FROM
    customers
         JOIN
    orders ON customers.id = orders.customer_id
         JOIN
    shippers ON orders.shipper_id = shippers.id
         JOIN
    order_details ON order_details.order_id = orders.id
         JOIN
    products ON order_details.product_id = products.id;
    