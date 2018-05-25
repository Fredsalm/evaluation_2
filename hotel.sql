CREATE DATABASE Hotel CHARACTER SET 'utf8';
USE `Hotel`;

CREATE TABLE  `Bathroom_Type`(

	`id_Bathroom_Type` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`Type_bathroom` VARCHAR(55),

	PRIMARY KEY (`id_Bathroom_Type`)

	)ENGINE=INNODB;

CREATE TABLE `Bed_Type`(

	`id_Bed_Type` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`Type_Bed` VARCHAR(55),

	PRIMARY KEY (`id_Bed_Type`)

)ENGINE=INNODB;

CREATE TABLE `Customer` (

	`id_Customer` INT UNSIGNED NOT NULL AUTO_INCREMENT,

	`Name` VARCHAR (55) NOT NULL,

	`Firsname` VARCHAR (55) NOT NULL,

	`Phone` VARCHAR (55) NOT NULL,

	`E_mail` VARCHAR (55) NOT NULL,

	`Adress` TEXT NOT NULL,

	`Password` VARCHAR (55) NOT NULL,

	PRIMARY KEY (`id_Customer`)
) ENGINE=INNODB;

CREATE TABLE `Category` (

	`id_Category` INT UNSIGNED NOT NULL AUTO_INCREMENT,

	`Name` VARCHAR (55) NOT NULL,

	PRIMARY KEY (`id_Category`)
) ENGINE=INNODB;

CREATE TABLE `Bedroom` (

    `id_Bedroom` INT UNSIGNED NOT NULL AUTO_INCREMENT,

    `Name` VARCHAR(55) NOT NULL,

    `Area` VARCHAR(55) NOT NULL,

    `Category` TINYINT(1) NOT NULL,

    `Floor` INT NULL,

    `View` VARCHAR(55) NOT NULL,

    `Accessibility` TINYINT(1) NOT NULL,

    `Bed` INT UNSIGNED NOT NULL,
	   CONSTRAINT fk_Bed_Type
       FOREIGN KEY (Bed)
       REFERENCES Bed_Type(id_Bed_Type),

    `Bathroom` INT UNSIGNED NOT NULL,
    	CONSTRAINT fk_Bathromm_Type
        FOREIGN KEY (Bathroom)
        REFERENCES Bathroom_Type(id_Bathroom_Type),

    `Price` INT NOT NULL,

    `Service_Status` TINYINT(1) NOT NULL,


    PRIMARY KEY (`id_Bedroom`)

) ENGINE=INNODB;


CREATE TABLE `Services` (

	 `id_Service` INT UNSIGNED NOT NULL AUTO_INCREMENT,

	 `Name` VARCHAR (55) NOT NULL,

	 `Description` TEXT NOT NULL,

	 `Price` INT NOT NULL,

	 `Category` INT UNSIGNED NOT NULL,
	   CONSTRAINT fk_Category
       FOREIGN KEY (Category)
       REFERENCES Category(id_Category),

	 PRIMARY KEY (`id_Service`)

) ENGINE=INNODB;



CREATE TABLE `Services_take` (

	`id_Service_take` INT UNSIGNED NOT NULL AUTO_INCREMENT,

	`Services_Take` INT UNSIGNED NOT NULL,
	   CONSTRAINT fk_Services_Take
       FOREIGN KEY (Services_Take)
       REFERENCES Services(id_Service),

    `id_Customer_Services_Take` INT UNSIGNED NOT NULL,
	   CONSTRAINT fk_Customer_Services_Take
       FOREIGN KEY (id_Customer_Services_Take)
       REFERENCES Customer(id_Customer),

	PRIMARY KEY (`id_Service_take`)
)ENGINE=INNODB;

CREATE TABLE `Users` (

	`id_User` INT UNSIGNED NOT NULL AUTO_INCREMENT,

	`Name` VARCHAR(55) NOT NULL,

	`Password` VARCHAR (55) NOT NULL,

	PRIMARY KEY (`id_User`)
)ENGINE=INNODB;

CREATE TABLE `Booking` (

	`id_Booking` INT UNSIGNED NOT NULL AUTO_INCREMENT,

	`date_arrival` DATE NOT NULL,

	`date_departure` DATE NOT NULL,

	`Total_price` INT NOT NULL,

	`Status` VARCHAR(55) NOT NULL,

	`Customer` INT UNSIGNED NOT NULL,
	   CONSTRAINT fk_Customer
       FOREIGN KEY (Customer)
       REFERENCES Customer(id_Customer),

    `Bedroom` INT UNSIGNED NOT NULL,
	   CONSTRAINT fk_Bedroom
       FOREIGN KEY (Bedroom)
       REFERENCES Bedroom(id_Bedroom),

	`Customer_Services` INT UNSIGNED NOT NULL,
		CONSTRAINT fk_Customer_Services_Taken
	    FOREIGN KEY (Customer_Services)
	    REFERENCES Services_take(id_Customer_Services_Take),

	PRIMARY KEY (`id_Booking`)
) ENGINE=INNODB;


INSERT INTO `Users` ( `Name`, `Password`)

	VALUES
		('mr gérant','root'),
		('madame gérant','riquiqui'),
		('riri','picsous'),
		('fifi','loulou');


INSERT INTO `Category` (`Name`)

	VALUES
		('Matériel'),
		('Bien-être'),
		('Repas'),
		('Spécial');

INSERT INTO `Services` (`Name`,`Description`,`Price`,`Category`)

	VALUES
		('Massage','"Lorem ipsum do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea co',75,2),
		('Repas gastro','"Lorem ipsum do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea co',120,3),
		('Karting','"Lorem ipsum do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea co',25,1),
		('Escort girl','"Lorem ipsum do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea co',300,4);


INSERT INTO `Customer` (`Name`,`Firsname`,`Phone`,`E_mail`,`Adress`,`Password`)

	VALUES
		('Bringer','Joris','0677777777','Brienger@gmail.com','56 Avenue du Général Briger','jesuisungrosraleur'),
		('Caron','Antoine','0688888888','Caron@gmail.com','2 Av de je suis perché','jesuistétus'),
		('Salm','Frédéric','0699999999','Salm@gmail.com','36 rue de blanche neige','jesuismoi'),
		('Flo','Jananet','0600000000','Flo@gmail.com','22 avenue du chasseur','jesuisunkiki');


INSERT INTO `Bed_Type` (`Type_Bed`)

	VALUES
		('Lit simple'),
		('Lit double'),
		('Queen size'),
		('King size');

INSERT INTO `Bathroom_Type` (`Type_bathroom`)

	VALUES
		('Douche'),
		('baignoire'),
		('Douche et baignoire');
		
INSERT INTO `Services_take`(`Services_Take`,`id_Customer_Services_Take`)

	VALUES
		(1,1),
		(2,1),
		(2,2),
		(3,2),
		(2,1),
		(3,3);

INSERT INTO `Bedroom` (`Name`,`Area`,`Category`,`Floor`,`View`,`Accessibility`,`Bed`,`Bathroom`,`Price`,`Service_Status`)

	VALUES
		('Paris','55M',1,1,'Parking','0',1,1,45,0),
		('Londre','65M',2,4,'Mer','1',3,3,150,1),
		('Bankok','100M',2,4,'Mer','1',4,3,200,1);
		
INSERT INTO `Booking` (`date_arrival`,`date_departure`,`Total_price`,`Status`,`Customer`,`Bedroom`,`Customer_Services`)

	VALUES
		('2018-01-02','2018-03-02','300','En cours',1,2,1),
		('2018-02-02','2018-05-02','150','payer',2,1,2),
		('2018-01-02','2018-07-02','600','payer',3,3,3);

