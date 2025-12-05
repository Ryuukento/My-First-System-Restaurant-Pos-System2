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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT 'noimage.jpg',
  `status` enum('available','unavailable') DEFAULT 'available',
  `category` varchar(50) DEFAULT NULL,
  `sugar_levels` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Crispy Pata','Crispy deep-fried pork leg served with soy-vinegar dip',799.00,'crispy_pata.jpg','available','Main Courses',NULL),(2,'Beef Kare-Kare','Beef shank and vegetables in peanut sauce',850.00,'beef_karekare.jpg','available','Main Courses',''),(3,'Seafood Paella','Spanish rice dish with shrimp, mussels, and squid',950.00,'seafood_paella.jpg','available','Main Courses',NULL),(4,'Chicken Cordon Bleu','Chicken breast stuffed with ham and cheese',380.00,'chicken_cordonbleu.jpg','available','Main Courses',NULL),(5,'Pasta Carbonara','Creamy pasta with bacon and parmesan cheese',250.00,'pasta_carbonara.jpg','available','Main Courses',''),(6,'Grilled Tuna Belly','Fresh tuna belly grilled to perfection',420.00,'grilled_tuna.jpg','available','Main Courses',NULL),(7,'Roast Chicken ','Roasted chicken infused with rosemary herbs',360.00,'roast_chicken.jpg','available','Main Courses',NULL),(8,'Pork Sisig','Sizzling chopped pork face with egg and chili',299.00,'pork_sisig.jpg','available','Main Courses',NULL),(9,'Caesar Salad Bites','Mini romaine lettuce with caesar dressing',180.00,'caesar_bites.jpg','available','Appetizers',''),(10,'Calamares Fritos','squid rings that are battered deep-fried until golden crispy.',220.00,'calamares.jpg','available','Appetizers',''),(11,'Shrimp Gambas','shrimp sautéed in olive oil with lots of garlic and chili peppers.',250.00,'shrimp_gambas.jpg','available','Appetizers',NULL),(12,'Tuna Tartare','Fresh tuna cubes in citrus dressing',270.00,'tuna_tartare.jpg','available','Appetizers',NULL),(13,'Vegetable Spring Rolls','Crispy spring rolls with sweet chili sauce',150.00,'spring_rolls.jpg','available','Appetizers',NULL),(14,'Prosciutto-Wrapped Melon','Sweet melon wrapped in prosciutto ham',200.00,'prosciutto_melon.jpg','available','Appetizers',NULL),(15,'Baked Oysters with Cheese','Fresh oysters baked with garlic and cheese',300.00,'baked_oysters.jpg','available','Appetizers',''),(16,'Chicharon Bulaklak Crispy','Deep fried ruffled pork fat served with vinegar dip',250.00,'chicharon_bulaklak.jpg','available','Appetizers',NULL),(17,'Matcha Cheesecake','Creamy cheesecake infused with matcha',220.00,'matcha_cheesecake.jpg','available','Dessert',NULL),(18,'Chocolate Lava Cake','Warm cake with molten chocolate center',180.00,'lava_cake.jpg','available','Dessert',NULL),(19,'Chocolate Mousse','Layers of dark, milk and white chocolate mousse',200.00,'choco_mousse.jpg','available','Dessert',NULL),(20,'Leche Flan','Traditional Filipino caramel custard dessert',120.00,'leche_flan.jpg','available','Dessert',NULL),(21,'Halo-Halo Special','Mixed fruits, beans, and crushed ice dessert',150.00,'halo_halo.jpg','available','Dessert',NULL),(22,'Caramel White Mocha','Sweet, creamy, and caramel-kissed over ice.',250.00,'Caramel White Mocha.jpg','available','Dessert',NULL),(23,'Matcha Tiramisu','Tiramisu with matcha flavor twist',230.00,'matcha_tiramisu.jpg','available','Dessert',NULL),(24,'Tiramisu','creamy layers of mascarpone and coffee-soaked ladyfingers.',270.00,'Tiramisu.jpg','available','Dessert',NULL),(25,'Pineapple Juice','Fresh pineapple juice',90.00,'pineapple_juice.jpg','available','Beverages',NULL),(26,'Watermelon Shake','Fresh watermelon blended',100.00,'watermelon_shake.jpg','available','Beverages',NULL),(27,'Iced Coffee Latte','Chilled coffee with milk and ice',110.00,'iced_coffee.jpg','available','Beverages',''),(28,'Hot Chocolate','Creamy chocolate coffe',80.00,'hot_chocolate.jpg','available','Beverages',NULL),(29,'Lemonade','Freshly squeezed lemon juice with syrup',90.00,'lemonade.jpg','available','Beverages',''),(30,'Tang Lemon Iced Tea','Powdered/ready blend iced tea, budget size.',75.00,'Tang Lemon Iced Tea.jpg','available','Beverages',NULL),(31,'Milk Tea with Pearls','Classic milk tea with tapioca pearls',120.00,'milk_tea.jpg','available','Beverages',NULL),(32,'Dragon Fruit Shake','Bright pink dragon fruit blended drink',150.00,'dragonfruit_shake.jpg','available','Beverages',''),(35,'Iced Cola','Taste the coldness of the fresh and sweet Iced Cola',35.00,'iced_cola.jfif','available','Beverages',''),(36,'sd','0',231.00,'asd','available','Desserts','');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03  8:15:28
