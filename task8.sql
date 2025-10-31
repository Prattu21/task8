DELIMITER //

CREATE FUNCTION get_total_amount(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(amount) INTO total
    FROM orders
    WHERE customer_id = cust_id;

    IF total IS NULL THEN
        SET total = 0;
    END IF;

    RETURN total;
END //

DELIMITER ;

SELECT get_total_amount(1) AS Total_For_Alice;

-------------------------------------------------------------------------------------------------------------------------------------------------
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

CALL check_customer_orders(1);