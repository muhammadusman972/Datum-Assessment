WITH "CustomersWhoBoughtBoth" AS (
    SELECT customer_id
    FROM "public"."CustomerPurchases"
    WHERE product_id IN ('A', 'B') AND payment_status = 'Paid'
    GROUP BY customer_id
    HAVING COUNT(DISTINCT product_id) = 2
),
"TotalPaidCustomers" AS (
    SELECT COUNT(DISTINCT customer_id) AS total_customers
    FROM "public"."CustomerPurchases"
    WHERE payment_status = 'Paid'
)
SELECT 
    (SELECT COUNT(DISTINCT customer_id) FROM "CustomersWhoBoughtBoth") * 100.0 / (SELECT total_customers FROM "TotalPaidCustomers") AS percentage_of_customers;
