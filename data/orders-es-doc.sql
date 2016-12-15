
SELECT 
    substr(orderNo,9) as id,
    c.channelName AS `channel`,
    CustomerName as customer,
    Email1 AS email,
    Phone1 AS phone,
    p.promoCode as promotion
FROM
    orders
        LEFT JOIN
    channelmaster AS c ON orders.channelId = c.channelId
        LEFT JOIN
    promotionmaster p ON orders.promotionId = p.promotionId
WHERE
    convert_tz(orders.UPDDate, '+05:30', '+00:00') >= :sql_last_value;
