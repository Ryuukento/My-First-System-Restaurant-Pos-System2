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
-- Table structure for table `current_ingredients_stock`
--

DROP TABLE IF EXISTS `current_ingredients_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_ingredients_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) NOT NULL,
  `unit` varchar(50) NOT NULL COMMENT 'kg, liter, pieces, etc',
  `current_quantity` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_quantity` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Minimum stock level before reorder',
  `cost_per_unit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Cost per unit for calculating expenses',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_ingredients_stock`
--

LOCK TABLES `current_ingredients_stock` WRITE;
/*!40000 ALTER TABLE `current_ingredients_stock` DISABLE KEYS */;
INSERT INTO `current_ingredients_stock` VALUES (1,'Rice','kg',50.00,10.00,45.00,'2025-12-02 11:52:03'),(2,'Chicken Breast','kg',20.00,5.00,180.00,'2025-12-02 11:52:03'),(3,'Beef Shank','kg',15.00,5.00,320.00,'2025-12-02 11:52:03'),(4,'Pork Leg','kg',10.00,3.00,250.00,'2025-12-02 11:52:03'),(5,'Shrimp','kg',8.00,2.00,450.00,'2025-12-02 11:52:03'),(6,'Squid','kg',5.00,2.00,280.00,'2025-12-02 11:52:03'),(7,'Tuna','kg',7.00,2.00,380.00,'2025-12-02 11:52:03'),(8,'Mussels','kg',4.00,1.00,220.00,'2025-12-02 11:52:03'),(9,'Flour','kg',25.00,5.00,35.00,'2025-12-02 11:52:03'),(10,'Sugar','kg',30.00,5.00,55.00,'2025-12-02 11:52:03'),(11,'Salt','kg',10.00,2.00,15.00,'2025-12-02 11:52:03'),(12,'Oil','liter',15.00,3.00,120.00,'2025-12-02 11:52:03'),(13,'Milk','liter',10.00,2.00,85.00,'2025-12-02 11:52:03'),(14,'Eggs','pieces',100.00,20.00,8.00,'2025-12-02 11:52:03'),(15,'Cheese','kg',5.00,1.00,380.00,'2025-12-02 11:52:03'),(16,'Bacon','kg',78.00,1.00,420.00,'2025-12-02 12:01:30'),(17,'Ham','kg',4.00,1.00,350.00,'2025-12-02 11:52:03'),(18,'Lettuce','kg',3.00,1.00,65.00,'2025-12-02 11:52:03'),(19,'Tomatoes','kg',5.00,1.00,75.00,'2025-12-02 11:52:03'),(20,'Onions','kg',8.00,2.00,45.00,'2025-12-02 11:52:03'),(21,'Garlic','kg',3.00,0.50,95.00,'2025-12-02 11:52:03'),(22,'Peanut Sauce','liter',2.00,0.50,150.00,'2025-12-02 11:52:03'),(23,'Soy Sauce','liter',8.00,0.50,65.00,'2025-12-02 11:58:56'),(24,'Vinegar','liter',4.00,1.00,35.00,'2025-12-02 11:52:03'),(25,'Chocolate','kg',5.00,1.00,280.00,'2025-12-02 11:52:03'),(26,'Matcha Powder','kg',2.00,0.50,850.00,'2025-12-02 11:52:03'),(27,'Coffee Beans','kg',5.00,1.00,420.00,'2025-12-02 11:52:03'),(28,'Cream','liter',6.00,1.00,180.00,'2025-12-02 11:52:03'),(29,'Pineapple','pieces',20.00,5.00,45.00,'2025-12-02 11:52:03'),(30,'Watermelon','pieces',10.00,3.00,85.00,'2025-12-02 11:52:03'),(31,'Lemon','pieces',30.00,10.00,12.00,'2025-12-02 11:52:03'),(32,'Dragon Fruit','pieces',15.00,5.00,95.00,'2025-12-02 11:52:03'),(33,'Tapioca Pearls','kg',3.00,0.50,120.00,'2025-12-02 11:52:03'),(34,'Cola Syrup','liter',3.00,1.00,85.00,'2025-12-02 11:52:03'),(35,'Ice','kg',100.00,10.00,5.00,'2025-12-02 11:52:03'),(37,'Shampoo','liter',1.00,0.00,120.00,'2025-12-02 12:22:13');
/*!40000 ALTER TABLE `current_ingredients_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03  8:15:29
