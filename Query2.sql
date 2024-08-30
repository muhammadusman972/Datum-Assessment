WITH "SalesOnPromotionDays" AS (
    SELECT s.sale_id, s.amount
    FROM "Sales" s
    JOIN "Promotions" p ON s.promotion_id = p.promotion_id
    WHERE s.sale_date = p.start_date OR s.sale_date = p.end_date
),
"SalesData" AS (
    SELECT SUM(amount) AS "sales_on_promotion_days"
    FROM "SalesOnPromotionDays"
),
"TotalSales" AS (
    SELECT SUM(amount) AS "total_sales"
    FROM "Sales"
)
SELECT 
    (sd.sales_on_promotion_days * 100.0) / ts.total_sales AS "percentage_of_sales"
FROM 
    "SalesData" sd,
    "TotalSales" ts;
