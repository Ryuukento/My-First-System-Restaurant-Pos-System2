-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_restaurant
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'hotel_restaurant'
--

--
-- Dumping routines for database 'hotel_restaurant'
--
/*!50003 DROP FUNCTION IF EXISTS `get_total_ingredient_quantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_ingredient_quantity`(
    p_ingredient_name VARCHAR(100)
) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);
    
    SELECT COALESCE(SUM(current_quantity), 0)
    INTO v_total
    FROM current_ingredients_stock
    WHERE ingredient_name = p_ingredient_name;
    
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deduct_ingredient_smart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deduct_ingredient_smart`(
    IN p_ingredient_name VARCHAR(100),
    IN p_quantity_needed DECIMAL(10,2),
    IN p_order_id INT
)
BEGIN
    DECLARE v_ingredient_id INT;
    DECLARE v_current_qty DECIMAL(10,2);
    DECLARE v_remaining_needed DECIMAL(10,2);
    DECLARE v_deduct_amount DECIMAL(10,2);
    DECLARE done INT DEFAULT 0;
    
    -- Cursor to get all stocks with this ingredient name, ordered by ID (FIFO)
    DECLARE ingredient_cursor CURSOR FOR
        SELECT id, current_quantity
        FROM current_ingredients_stock
        WHERE ingredient_name = p_ingredient_name
        AND current_quantity > 0
        ORDER BY id ASC;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    SET v_remaining_needed = p_quantity_needed;
    
    OPEN ingredient_cursor;
    
    read_loop: LOOP
        FETCH ingredient_cursor INTO v_ingredient_id, v_current_qty;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- If this stock has enough to cover remaining need
        IF v_current_qty >= v_remaining_needed THEN
            SET v_deduct_amount = v_remaining_needed;
            
            UPDATE current_ingredients_stock
            SET current_quantity = current_quantity - v_deduct_amount
            WHERE id = v_ingredient_id;
            
            INSERT INTO ingredient_usage_log (ingredient_id, order_id, quantity_used, notes)
            VALUES (v_ingredient_id, p_order_id, v_deduct_amount, 
                    CONCAT('Used for order #', p_order_id));
            
            SET v_remaining_needed = 0;
            LEAVE read_loop;
            
        ELSE
            -- Use all of this stock and continue to next batch
            SET v_deduct_amount = v_current_qty;
            
            UPDATE current_ingredients_stock
            SET current_quantity = 0
            WHERE id = v_ingredient_id;
            
            INSERT INTO ingredient_usage_log (ingredient_id, order_id, quantity_used, notes)
            VALUES (v_ingredient_id, p_order_id, v_deduct_amount, 
                    CONCAT('Batch depleted, switched to next'));
            
            SET v_remaining_needed = v_remaining_needed - v_deduct_amount;
        END IF;
        
    END LOOP;
    
    CLOSE ingredient_cursor;
    
    IF v_remaining_needed > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock across all batches';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03  8:15:30
