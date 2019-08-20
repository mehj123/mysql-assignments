SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS SalesMonth, prd.product_code as code, concat('$',format(sum(odt.quantity * prd.list_price),2)) AS Sales,
    concat('$',format(sum(odt.quantity * prd.standard_cost),2)) AS Cost,
    concat('$',format(sum((prd.list_price - prd.standard_cost) * quantity), 2)) AS profit
FROM
    orders AS ord,
    order_details AS odt,
    products AS prd
WHERE
    ord.id = odt.order_id
        AND odt.product_id = prd.id
        group by SalesMonth,code;
