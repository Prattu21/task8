## task8
## 🎯 Objective
To learn how to modularize SQL logic using *Stored Procedures* and *Functions*.

## 🧩 Topics Covered
- CREATE PROCEDURE  
- CREATE FUNCTION  
- IN / OUT parameters  
- Conditional logic using IF statements  
- Using RETURN in functions  

## 💻 Sample Queries
```sql
DELIMITER //

CREATE PROCEDURE check_customer_orders(IN cust_id INT)
BEGIN
    DECLARE order_count INT;

    SELECT COUNT(*) INTO order_count
    FROM orders
    WHERE customer_id = cust_id;

    IF order_count > 0 THEN
        SELECT CONCAT('Customer ID ', cust_id, ' has ', order_count, ' order(s).') AS message;
    ELSE
        SELECT CONCAT('Customer ID ', cust_id, ' has no orders.') AS message;
    END IF;
END //

DELIMITER ;
