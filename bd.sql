DROP DATABASE IF EXISTS shoes_shop_repository;

CREATE SCHEMA `shoes_shop_repository` ;

CREATE TABLE `shoes_shop_repository`.`user_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`role_id`));

INSERT INTO `shoes_shop_repository`.`user_role` (`name`)
VALUES
('admin'),
('manager'),
('user');

CREATE TABLE `shoes_shop_repository`.`gender` (
  `gender_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`gender_id`));

INSERT INTO `shoes_shop_repository`.`gender` (`name`)
VALUES
('male'),
('female'),
('other');


CREATE TABLE `shoes_shop_repository`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_role` INT(11) NOT NULL,
  `fk_gender` INT(11) NOT NULL,
  `firstname` VARCHAR(60) NOT NULL,
  `surname` VARCHAR(60) NOT NULL,
  `fathername` VARCHAR(60) NOT NULL DEFAULT ' ',
  `email` VARCHAR(60) NOT NULL,
  `username` VARCHAR(60) NOT NULL UNIQUE,
  `telephone` VARCHAR(60) NOT NULL,
  `birthdate` DATE NOT NULL,
  `user_password` VARCHAR(60) NOT NULL,
  `subscribe` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user1_idx` (`fk_role` ASC) VISIBLE,
  INDEX `fk_user3_idx` (`fk_gender` ASC) VISIBLE,
  CONSTRAINT `fk_users1_idx`
    FOREIGN KEY (`fk_role`)
    REFERENCES `shoes_shop_repository`.`user_role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users3_idx`
    FOREIGN KEY (`fk_gender`)
    REFERENCES `shoes_shop_repository`.`gender` (`gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
  INSERT INTO `shoes_shop_repository`.`user` (`firstname`,`surname`,`fathername`,`email`,`username`,`fk_role`,`telephone`,`user_password`,`subscribe`,
  `fk_gender`, `birthdate`)
  VALUES ('Bohdan','Kasumov','Ruslanovich','pronumber19@gmail.com','bohdan322',1,'+380988642965','12345678',true,1, '2000-03-18'),
  ('Anton','Ivanov',default,'toha322@gmail.com','toha228',2,'+380987662245','12345678',true,1,'1975-03-18'),
  ('Ivan','Ivanov','Ivanovich','ivan@gmail.com','vanya',3,'+380958342925','qwerty123',false,1, '2002-03-18'),
   ('Anna','Romanova','Ivanovna','anya32123@gmail.com','anya32123',2,'+380987662525','12345678',true,2,'1983-04-18'),
    ('Firstname','Surname','Fathername','robot123@gmail.com','someUser',2,'+380987662245','12345678',true,3,'2005-01-15');
  
  CREATE TABLE `shoes_shop_repository`.`manufacturer` (
  `manufacturer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(60) NOT NULL,
  `firstname` VARCHAR(60) NOT NULL,
  `fathername` VARCHAR(60) NOT NULL DEFAULT ' ',
  `surname` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `telephone` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`manufacturer_id`));
  
INSERT INTO `shoes_shop_repository`.`manufacturer` (`company`,`firstname`,`surname`,`fathername`,`email`,`address`,`telephone`)
  VALUES ('Speedwagon fund','Joseph','Jostar','Ivanov','jojo@gmail.com','Pushkin st 13th','+380 42 56 67 731'),
  ('Great company','Brian','Jostar',default,'manufacturemail1@gmail.com','Pushkin st 13th','+380 42 56 67 731'),
  ('Best manufacture','Joseph','Io',default,'manufacturemail2@gmail.com','Pushkin st 14th','+380 25 56 65 731'),
  ('Just shoes','Joseph','JoJo',default,'manufacturemail3@gmail.com','Pushkin st 15th','+380 31 32 62 731'),
  ('Comfo boots','Bohdan','Onyel',default,'manufacturemail14@gmail.com','Pushkin st 16th','+380 42 56 61 731'),
  ('Art of War','Sun','Tzu','fathername','ArtOfWar@gmail.com','Tchalovo st 26th','+380 15 65 79 821');
  
  CREATE TABLE `shoes_shop_repository`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`category_id`));
  
  INSERT INTO `shoes_shop_repository`.`category` (`name`)
  VALUES ('Male shoes'),
  ('Female shoes'),
  ('Male sneakers'),
  ('Female sneakers'),
  ('Male gumshoes'),
  ('Female gumshoes'),
  ('Clogs'),
  ('Ballet shoes');
  
  CREATE TABLE `shoes_shop_repository`.`season` (
  `season_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`season_id`));
  
   INSERT INTO `shoes_shop_repository`.`season` (`name`)
  VALUES ('summer'),
  ('autumn'),
  ('winter'),
  ('spring');
  
  CREATE TABLE `shoes_shop_repository`.`material` (
  `material_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`material_id`));
  
   INSERT INTO `shoes_shop_repository`.`material` (`name`)
  VALUES ('Кожа'),
  ('Текстиль'),
  ('Резина');
  
  CREATE TABLE `shoes_shop_repository`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_category` INT(11) NOT NULL,
  `fk_manufacturer` INT(11) NOT NULL,
  `fk_material` INT(11) NOT NULL,
  `fk_season` INT(11) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `price` FLOAT(9,2) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product1_idx` (`fk_category` ASC) VISIBLE,
  INDEX `fk_product2_idx` (`fk_manufacturer` ASC) VISIBLE,
  INDEX `fk_product3_idx` (`fk_material` ASC) VISIBLE,
  INDEX `fk_product4_idx` (`fk_season` ASC) VISIBLE,
  CONSTRAINT `fk_product1_idx`
    FOREIGN KEY (`fk_category`)
    REFERENCES `shoes_shop_repository`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product2_idx`
    FOREIGN KEY (`fk_manufacturer`)
    REFERENCES `shoes_shop_repository`.`manufacturer` (`manufacturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product3_idx`
    FOREIGN KEY (`fk_material`)
    REFERENCES `shoes_shop_repository`.`material` (`material_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product4_idx`
    FOREIGN KEY (`fk_season`)
    REFERENCES `shoes_shop_repository`.`season` (`season_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `shoes_shop_repository`.`product` (`name`,`fk_category`,`fk_manufacturer`,`fk_material`,`fk_season`,`price`,`description`)
  VALUES ('Welfare332361151','1','2','1','2','1499','some text'),
  
  ('Welfare332371211','1','5','1','2','1299','some text'),
  
  ('Marco Tozzi','2','2','1','2','1829','some text'),
  
  ('Welfare 0030-702 74 RED FLOTER','2','1','1','2','2215','some text'),
  
  ('KayakStorm B1570B ','3','1','1','2','2300','some text'),
  
  ('Welfare 340711221/BLK/41 ','3','5','1','2','2250','some text'),
  
  ('Welfare 340731211/D.BLUE/41 ','3','2','1','2','2400','some text'),
  
  ('Welfare 340751211/BLK/41','3','1','1','2','2400','some text'),

  
  ('Marco Tozzi 2/2-23728/24 412 DUNE METALLIC','4','5','1','2','2350','some text'),
  ('Marco Tozzi 2/2-23740/34 132 WHITE/NEON YEL','4','2','1','2','1699','some text'),
  ('Marco Tozzi 2/2-23792/34 521 ROSE','4','1','1','2','1499','some text'),
  
  ('Welfare 2097 Grey/W ','4','3','1','2','2750','some text'),
  
  
  ('Welfare 332801211/BLK/41 ','5','1','1','2','1639','some text'),
  ('Welfare 340681211/WHITE/40 ','5','4','1','2','1429','some text'),
  ('Welfare 340691251/L.BRN/40 ','5','5','1','2','1439','some text'),
  ('Welfare 340761211/BLK/41  ','5','2','1','2','2350','some text'),
  ('Welfare 340761411/BLK/41','5','1','1','2','2300','some text'),
  ('Welfare 423751211/BLK/40 ','5','3','1','2','1599','some text'),
  
  ('Marco Tozzi 2/2-23702/34 128 WHITE/NAVY M.','6','6','1','2','1500','some text'),
  ('Welfare 332511411/BLUE/40 ','6','1','1','2','1499','some text'),
  
  ('Marco Tozzi 2-2-27112-26 100 WHITE','7','6','1','2','2150','some text'),
  ('Marco Tozzi 2-2-27112-26 521 ROSE  ','7','3','1','2','2120','some text'),
  
  ('Tamaris 1-1-27104-26 677 CANDY ','7','2','1','2','2230','some text'),
  ('Tamaris 1-1-27116-26 100 WHITE  ','7','1','1','2','2080','some text'),
  ('Tamaris 1-1-27145-26 001 BLACK ','7','1','1','2','2240','some text'),
  
  ('Caprice 9-9-22150-26 022 BLACK NAPPA ','8','6','1','2','2253','some text'),
  ('Caprice 9-9-22151-25 014 BLACK CROCO   ','8','2','1','2','1980','some text'),
  ('Caprice 9-9-22151-25 022 BLACK NAPPA ','8','6','1','2','2000','some text');
  
  CREATE TABLE `shoes_shop_repository`.`color` (
  `color_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`color_id`));
  
INSERT INTO `shoes_shop_repository`.`color` (`name`)
  VALUES ('black'),
  ('white'),
  ('brown'),
  ('red'),
  ('blue');
  
    CREATE TABLE `shoes_shop_repository`.`size` (
  `size_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`size_id`));
  
  INSERT INTO `shoes_shop_repository`.`size` (`name`)
  VALUES ('32'),
  ('33'),
  ('34'),
  ('35'),
  ('36'),
  ('37'),
  ('38'),
  ('39'),
  ('40'),
  ('41'),
  ('42');
  
  CREATE TABLE `shoes_shop_repository`.`product_size_color`(
  `product_size_color_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_product` INT(11) NOT NULL,
  `fk_size` INT(11) NOT NULL,
  `fk_color` INT(11) NOT NULL,
  `count` INT(11) NOT NULL,
  `additional_info` TEXT NOT NULL,
  PRIMARY KEY (`product_size_color_id`),
  INDEX `fk_product_size_color1_idx` (`fk_product` ASC) VISIBLE,
  INDEX `fk_product_size_color2_idx` (`fk_size` ASC) VISIBLE,
  INDEX `fk_product_size_color3_idx` (`fk_color` ASC) VISIBLE,
  CONSTRAINT `fk_product_size_color1_idx`
    FOREIGN KEY (`fk_product`)
    REFERENCES `shoes_shop_repository`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_size_color2_idx`
    FOREIGN KEY (`fk_size`)
    REFERENCES `shoes_shop_repository`.`size` (`size_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_size_color3_idx`
    FOREIGN KEY (`fk_color`)
    REFERENCES `shoes_shop_repository`.`color` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
 INSERT INTO `shoes_shop_repository`.`product_size_color` (`fk_product`,`fk_size`,`fk_color`,`count`,`additional_info`)
  VALUES ('1','2','3','30','some info'),
  ('1','3','4','35','some info'),
  ('1','2','3','130','some info'),
  ('2','2','3','41','some info'),
  ('3','2','3','28','some info'),
  ('4','2','3','27','some info'),
  ('5','2','3','130','some info'),
  ('6','2','3','41','some info'),
  ('7','2','3','28','some info'),
  ('8','2','3','27','some info'),
  ('9','2','3','130','some info'),
  ('10','2','3','41','some info'),
  ('11','2','3','28','some info'),
  ('12','2','3','27','some info'),
  ('13','2','3','130','some info'),
  ('14','2','3','41','some info'),
  ('15','2','3','28','some info'),
  ('16','2','3','27','some info'),
  ('17','2','3','130','some info'),
  ('18','2','3','41','some info'),
  ('19','2','3','28','some info'),
  ('20','2','3','27','some info'),
  ('21','2','3','130','some info'),
  ('22','2','3','41','some info'),
  ('23','2','3','28','some info'),
  ('24','2','3','27','some info'),
  ('25','2','3','130','some info'),
  ('26','2','3','41','some info'),
  ('27','2','3','28','some info'),
  ('28','2','3','27','some info');
    
    CREATE TABLE `shoes_shop_repository`.`status_order` (
  `status_order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`status_order_id`));
  
  INSERT INTO `shoes_shop_repository`.`status_order`
  (`message`)
  VALUES
  ('in process'),
  ('done'),
  ('canceled');
  
     CREATE TABLE `shoes_shop_repository`.`delivery_type` (
  `delivery_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(60) NOT NULL,
  `price` FLOAT(9,2) NOT NULL,
  PRIMARY KEY (`delivery_type_id`));
  
  INSERT INTO `shoes_shop_repository`.`delivery_type`
  (`type`,`price`)
  VALUES
  ('without delivery', 0),
  ('ukrposta', 60),
  ('raketa', 30);
  
  CREATE TABLE `shoes_shop_repository`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_status` INT(11) NOT NULL,
  `fk_user` INT(11) NOT NULL,
  `payment` VARCHAR(60) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `order_fk1_idx` (`fk_user` ASC) VISIBLE,
  INDEX `order_fk2_idx` (`fk_status` ASC) VISIBLE,
  CONSTRAINT `order_fk1`
    FOREIGN KEY (`fk_user`)
    REFERENCES `shoes_shop_repository`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `order_fk2`
  FOREIGN KEY (`fk_status`)
  REFERENCES `shoes_shop_repository`.`status_order` (`status_order_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
  
   INSERT INTO `shoes_shop_repository`.`order`
  (`fk_status`,`payment`,`date`,`fk_user`)
  VALUES
  (1,'123312548','2023-03-18',1),
  (1,'213312316','2023-03-10',3),
  (2,'123123123','2023-03-15',1),
  (2,'123123123','2023-03-15',4),
  (2,'123123123','2023-03-15',4),
  (2,'123123123','2023-03-15',5),
  (1,'123123123','2023-03-25',2);
  
  CREATE TABLE `shoes_shop_repository`.`delivery` (
  `fk_order` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_type` INT(11) NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `delivery_date` DATE,
  `delivery_time` DATETIME,
  `contact` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`fk_order`),
  INDEX `delivery_fk1_idx` (`fk_order` ASC) VISIBLE,
  INDEX `delivery_fk2_idx` (`fk_type` ASC) VISIBLE,
  CONSTRAINT `delivery_fk1_idx`
    FOREIGN KEY (`fk_order`)
    REFERENCES `shoes_shop_repository`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `delivery_fk2_idx`
    FOREIGN KEY (`fk_type`)
    REFERENCES `shoes_shop_repository`.`delivery_type` (`delivery_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
  INSERT INTO `shoes_shop_repository`.`delivery`
  (`fk_order`,`address`,`delivery_date`,`delivery_time`,`fk_type`,`contact`)
  VALUES
  (1,'none','2020-03-22','2020-03-22', 1,'manager-1'),
  (2,'pr Mudovskii 14','2020-03-19','2020-03-19', 2,'manager-1'),
  (3,'st Bohdana Khmelnitskogo 28','2020-03-19','2020-03-19',2,'manager-2'),
  (4,'st Dzubi 12','2020-04-25','2020-04-25',2,'manager-1'),
  (5,'st Dzubi 12','2023-04-25','2020-04-25',2,'manager-1'),
  (6,'st Dzubi 12','2023-04-25','2020-04-25',2,'manager-1'),
  (7,'st Dzubi 12','2023-04-25','2020-04-25',2,'manager-1');

CREATE TABLE `shoes_shop_repository`.`order_product` (
  `fk_order` INT(11) NOT NULL,
  `fk_product_size_color` INT(11) NOT NULL,
  `count` INT(11) NOT NULL,
  PRIMARY KEY (`fk_order`, `fk_product_size_color`),
  INDEX `order_product_fk1_idx` (`fk_order` ASC) VISIBLE,
  INDEX `order_product_fk2_idx` (`fk_product_size_color` ASC) VISIBLE,
  CONSTRAINT `order_product_fk1`
    FOREIGN KEY (`fk_order`)
    REFERENCES `shoes_shop_repository`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `order_product_fk2`
    FOREIGN KEY (`fk_product_size_color`)
    REFERENCES `shoes_shop_repository`.`product_size_color` (`product_size_color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    INSERT INTO `shoes_shop_repository`.`order_product`
  (`fk_order`,`fk_product_size_color`,`count`)
  VALUES
  ('1','1',3),
  ('1','3',2),
  ('2','1',3),
  ('3','5',2),
  ('4','6',1),
  ('4','29',2),
  ('5','30',3),
  ('5','9',1),
  ('6','16',2),
  ('6','2',1),
  ('7','15',2);
  
  
  CREATE TABLE `shoes_shop_repository`.`history` (
  `history_id` INT(11) NOT NULL,
  `fk_user` INT(11) NOT NULL,
  `fk_product_size_color` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`history_id`),
  INDEX `history_fk1_idx` (`fk_user` ASC) VISIBLE,
  INDEX `history_fk2_idx` (`fk_product_size_color` ASC) VISIBLE,
	INDEX `history_fk3_idx` (`history_id` ASC) VISIBLE,
  CONSTRAINT `history_fk1`
    FOREIGN KEY (`fk_user`)
    REFERENCES `shoes_shop_repository`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `history_fk2`
    FOREIGN KEY (`fk_product_size_color`)
    REFERENCES `shoes_shop_repository`.`product_size_color` (`product_size_color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
  INSERT INTO `shoes_shop_repository`.`history`
  (`history_id`,`fk_user`,`fk_product_size_color`,`date`)
  VALUES
  (1,1,30,'2023-03-01'),
  (2,1,30,'2023-03-16'),
  (3,2,26,'2023-03-19'),
  (4,2,3,'2023-03-19'),
  (5,3,15,'2023-03-19'),
  (6,4,4,'2023-03-21'),
  (7,5,7,'2023-04-06'),
  (8,3,16,'2023-04-07'),
  (9,4,17,'2023-04-08'),
  (10,5,18,'2023-04-08'),
  (11,2,12,'2023-04-19'),
  (12,3,9,'2023-04-21'),
  (13,3,30,'2023-04-22'),
  (14,2,1,'2023-05-19'),
  (15,1,5,'2023-05-25');
  
    CREATE TABLE `shoes_shop_repository`.`offer` (
  `offer_id` INT(11) NOT NULL,
  `fk_product` INT(11) NOT NULL,
	`condition1` VARCHAR(60) NOT NULL,
  `discount1` INT(11) NOT NULL,
  `condition2` VARCHAR(60) NOT NULL,
  `discount2` INT(11) NOT NULL,
  `condition3` VARCHAR(60) NOT NULL,
  `discount3` INT(11) NOT NULL,
  `count` INT(11) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`offer_id`),
  INDEX `offer_fk1_idx` (`fk_product` ASC) VISIBLE,
	INDEX `offer_fk2_idx` (`offer_id` ASC) VISIBLE,
  CONSTRAINT `offer_fk1`
    FOREIGN KEY (`fk_product`)
    REFERENCES `shoes_shop_repository`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
    INSERT INTO `shoes_shop_repository`.`offer`
  (`offer_id`,`fk_product`,`condition1`,`discount1`,`condition2`,`discount2`,`condition3`,`discount3`,
  `count`,`start_date`,`end_date`,`description`)
  VALUES
  (1,2,'count > 2',5,'order sum > 2500',7,'order sum >4000',10,15,'2023-05-22','2023-06-22','Шановний клієнт! Вашій увазі пропонується товар! Якщо Вас зацікавило повідомлення зайдіть на посилання: [Link]'),
  (2,5,'order sum > 2000',10,'order sum > 2300',12,'count product in order > 3',15,20,'2023-05-15','2023-06-28','Шановний клієнт! Вашій увазі пропонується товар! Якщо Вас зацікавило повідомлення зайдіть на посилання: [Link]'),
  (3,3,'none',5,'order sum > 2500',7,'count product in order > 4',8,15,'2023-05-02','2023-06-21','Шановний клієнт! Вашій увазі пропонується товар! Якщо Вас зацікавило повідомлення зайдіть на посилання: [Link]'),
  (4,28,'none',7,'order sum > 2300',10,'count > 2',15,25,'2023-05-05','2023-06-20','Шановний клієнт! Вашій увазі пропонується товар! Якщо Вас зацікавило повідомлення зайдіть на посилання: [Link]');
  
  
  CREATE TABLE `shoes_shop_repository`.`offer_user` (
  `fk_offer` INT(11) NOT NULL,
  `fk_user` INT(11) NOT NULL,
  `status` INT(11) NOT NULL,
  PRIMARY KEY (`fk_offer`, `fk_user`),
  INDEX `offer_user_fk1_idx` (`fk_user` ASC) VISIBLE,
  INDEX `offe_userr_fk2_idx` (`fk_offer` ASC) VISIBLE,
  CONSTRAINT `offer_user_fk1`
    FOREIGN KEY (`fk_user`)
    REFERENCES `shoes_shop_repository`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `offer_user_fk2`
    FOREIGN KEY (`fk_offer`)
    REFERENCES `shoes_shop_repository`.`offer` (`offer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
       INSERT INTO `shoes_shop_repository`.`offer_user`
  (`fk_offer`,`fk_user`,`status`)
  VALUES
    (1,3,0),
    (1,1,0),
    (1,2,0),
    (3,2,0);
    
    use shoes_shop_repository;
    
    create or replace view user_order as 
select u.user_id, u.firstname, u.surname, u.fathername, g.name as gender, TIMESTAMPDIFF(YEAR, u.birthdate, CURDATE()) AS age,
sum(p.price*op.count) as total_order_sum, o.date as last_order_date,
(select temp1.cat_name
from (select u1.user_id,u1.firstname, c1.name as cat_name, count(c1.category_id) as count_cat
from shoes_shop_repository.user u1 join shoes_shop_repository.order o1 
on u1.user_id=o1.fk_user
join order_product op1 on op1.fk_order=o1.order_id
join product_size_color psc1 on op1.fk_product_size_color=psc1.product_size_color_id
join product p1 on p1.product_id=psc1.fk_product
join gender g1 on g1.gender_id=u1.fk_gender
join category c1 on c1.category_id=p1.fk_category
group by u1.user_id, c1.category_id
order by 4 desc) as temp1
where temp1.user_id= u.user_id
group by temp1.user_id
order by count_cat desc) as favorite_category,
(select temp2.average_price
from (select u2.user_id,u2.firstname, avg(p2.price) as average_price
from shoes_shop_repository.user u2 join shoes_shop_repository.order o2 
on u2.user_id=o2.fk_user
join order_product op2 on op2.fk_order=o2.order_id
join product_size_color psc2 on op2.fk_product_size_color=psc2.product_size_color_id
join product p2 on p2.product_id=psc2.fk_product
group by u2.user_id) as temp2
where temp2.user_id= u.user_id
group by temp2.user_id) as average_ordered_price
from shoes_shop_repository.user u join shoes_shop_repository.order o 
on u.user_id=o.fk_user
join order_product op on op.fk_order=o.order_id
join product_size_color psc on op.fk_product_size_color=psc.product_size_color_id
join product p on p.product_id=psc.fk_product
join gender g on g.gender_id=u.fk_gender
group by u.user_id
order by o.date desc;


create or replace view user_history as 
select u.user_id, u.firstname, u.surname, u.fathername, g.name as gender, TIMESTAMPDIFF(YEAR, u.birthdate, CURDATE()) AS age,
h.date as last_review_date,
(select temp1.cat_name
from (select u1.user_id,u1.firstname, c1.name as cat_name, count(c1.category_id) as count_cat
from shoes_shop_repository.user u1 join shoes_shop_repository.history h1 
on u1.user_id=h1.fk_user
join product_size_color psc1 on h1.fk_product_size_color=psc1.product_size_color_id
join product p1 on p1.product_id=psc1.fk_product
join gender g1 on g1.gender_id=u1.fk_gender
join category c1 on c1.category_id=p1.fk_category
group by u1.user_id, c1.category_id
order by 4 desc) as temp1
where temp1.user_id= u.user_id
group by temp1.user_id
order by count_cat desc) as favorite_review_category,
(select temp2.average_price
from (select u2.user_id,u2.firstname, avg(p2.price) as average_price
from shoes_shop_repository.user u2 join shoes_shop_repository.history h2 
on u2.user_id=h2.fk_user
join product_size_color psc2 on h2.fk_product_size_color=psc2.product_size_color_id
join product p2 on p2.product_id=psc2.fk_product
group by u2.user_id) as temp2
where temp2.user_id= u.user_id
group by temp2.user_id) as average_review_price
from shoes_shop_repository.user u join shoes_shop_repository.history h 
on u.user_id=h.fk_user
join product_size_color psc on h.fk_product_size_color=psc.product_size_color_id
join product p on p.product_id=psc.fk_product
join gender g on g.gender_id=u.fk_gender
group by u.user_id
order by h.date desc;
    
--   DROP TRIGGER IF EXISTS `store`.`update_product_count`;
--   
--   DELIMITER $$
--   
--   CREATE TRIGGER `store`.`update_product_count` AFTER INSERT ON `store`.`order_product` FOR EACH ROW BEGIN
-- 	UPDATE products p SET p.count=p.count-NEW.count
--     WHERE p.product_id=NEW.product_id;
-- END$$ 



-- DELIMITER ;

  
  
  