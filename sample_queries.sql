-- Sample Real-Time SQL Queries for Bank Transaction Management

-- 1. Find all customers whose name contains 'कुमार' (partial match search in Hindi)
SELECT * FROM customers
WHERE customer_name LIKE '%कुमार%';

-- 2. Show transactions in the last 30 days
SELECT * FROM transactions
WHERE transaction_date >= SYSDATE - 30;

-- 3. Get all accounts with balance greater than 50,000
SELECT account_id, account_type, balance
FROM accounts
WHERE balance > 50000;

-- 4. Find customers who have never made any transaction
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

-- 5. Calculate total deposits for the current month
SELECT SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'DEPOSIT'
AND TO_CHAR(transaction_date, 'MM-YYYY') = TO_CHAR(SYSDATE, 'MM-YYYY');

-- 6. List the last 5 transactions of a specific account (e.g., account_id = 101)
SELECT *
FROM transactions
WHERE account_id = 101
ORDER BY transaction_date DESC
FETCH FIRST 5 ROWS ONLY;

-- 7. Show monthly total withdrawals
SELECT TO_CHAR(transaction_date, 'MM-YYYY') AS month, SUM(amount) AS total_withdrawals
FROM transactions
WHERE transaction_type = 'WITHDRAWAL'
GROUP BY TO_CHAR(transaction_date, 'MM-YYYY')
ORDER BY month DESC;

-- 8. Join customer and account data for a consolidated view
SELECT c.customer_name, a.account_id, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
ORDER BY c.customer_name;
