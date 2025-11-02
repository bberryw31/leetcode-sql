# Write your MySQL query statement below
SELECT COALESCE(us.product_id, p.product_id) AS product_id, COALESCE(ROUND(SUM(p.price * us.units) / SUM(us.units), 2), 0) AS average_price
FROM UnitsSold us
RIGHT JOIN Prices p 
ON (us.product_id = p.product_id AND us.purchase_date >= start_date AND us.purchase_date <= end_date)
GROUP BY product_id
