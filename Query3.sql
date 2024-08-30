WITH "CustomersWhoBoughtA" AS (
    SELECT DISTINCT customer_id
    FROM "CustomerPurchases"
    WHERE product_id = 'A'
),
"OtherProductsBought" AS (
    SELECT cp.product_id, COUNT(*) AS purchase_count
    FROM "CustomerPurchases" cp
    JOIN "CustomersWhoBoughtA" cba ON cp.customer_id = cba.customer_id
    WHERE cp.product_id != 'A'
    GROUP BY cp.product_id
)
SELECT 
    product_id, purchase_count
FROM 
    "OtherProductsBought"
ORDER BY 
    purchase_count DESC
LIMIT 5;

