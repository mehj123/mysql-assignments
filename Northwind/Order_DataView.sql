CREATE OR REPLACE VIEW ORDER_DATA AS
    SELECT 
        employees.first_name AS 'Employee First Name',
        employees.last_name AS 'Employee Last Name',
        customers.first_name AS 'Customer First Name',
        customers.last_name AS 'Customer LAst Name',
        shippers.company,
        products.product_code,
        products.product_name,
        orders_status.status_name AS 'Order Status',
        order_details_status.status_name AS 'Order Details Status',
        orders_tax_status.tax_status_name AS 'Tax Status Name'
    FROM
        orders,
        employees,
        customers,
        shippers,
        products,
        orders_status,
        order_details,
        order_details_status,
        orders_tax_status
    WHERE
        orders.status_id = orders_status.id
            AND orders.id = order_details.order_id
            AND order_details.status_id = order_details_status.id
            AND orders.employee_id = employees.id
            AND orders.customer_id = customers.id
            AND orders.shipper_id = shippers.id
            AND order_details.product_id = products.id
            AND ifnull(orders.tax_status_id,1) = orders_tax_status.id;