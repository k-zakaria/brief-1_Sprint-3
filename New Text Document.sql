-- pour créer une base de données
CREATE DATABASE IF NOT EXISTS organisateurs;

-- pour créer les tableaux de typs innodb
CREATE TABLE organisateurs(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    adresse INT,
    numTel INT    
)ENGINE = INNODB;

CREATE TABLE sponsors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
	siteWeb VARCHAR(255),
	pays VARCHAR(255)
)ENGINE = INNODB;

CREATE TABLE evenements(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
	dateDebut DATE,
	dateFin DATE,
	id_spons INT,
    FOREIGN KEY (id_spons) REFERENCES sponsors(id)
)ENGINE = INNODB; 

CREATE TABLE participants(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
	cni VARCHAR(255),
	id_billet INT,
    FOREIGN KEY (id_billet) REFERENCES billets(id)
)ENGINE = INNODB; 

CREATE TABLE billets(
	id INT PRIMARY KEY AUTO_INCREMENT,
    num VARCHAR(255),
	prix FLOAT,
	id_eve INT,
	id_retour INT,
    FOREIGN KEY (id_eve) REFERENCES evenements(id),
    FOREIGN KEY (id_retour) REFERENCES retours(id)
)ENGINE = INNODB; 

CREATE TABLE retours(
	id INT PRIMARY KEY AUTO_INCREMENT,
    sumPrix FLOAT,
	id_eve INT,
    FOREIGN KEY (id_eve) REFERENCES evenements(id)
)ENGINE = INNODB; 

CREATE TABLE lieux(
	id INT PRIMARY KEY AUTO_INCREMENT,
	pays VARCHAR(255),
	ville VARCHAR(255),
	adresse VARCHAR(255),
	id_eve INT,
    FOREIGN KEY (id_eve) REFERENCES evenements(id)
)ENGINE = INNODB; 

CREATE TABLE benificie(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_eve INT,
	id_org INT,
    FOREIGN KEY (id_org) REFERENCES organisateurs(id),
    FOREIGN KEY (id_eve) REFERENCES evenements(id)
)ENGINE = INNODB; 

-- pour Insérer dans tableau evenements
INSERT INTO sponsors VALUES(50, 'soirée', '2023-12-31', '2023-12-31', NULL);

-- pour Insérer dans tableau sponsors
INSERT INTO sponsors VALUES(NULL, 'Bank Al-Maghrib', 'https://www.bkam.ma', 'Maroc');
INSERT INTO sponsors VALUES(NULL, 'CDG Caisse de dépôt et de gestion', 'https://www.cdg.ma/fr', 'Maroc');
INSERT INTO sponsors VALUES(NULL, 'Coca-Cola', 'https://www.coca-cola.com/ma/fr', 'Maroc');

-- pour Insérer dans tableau participants
INSERT INTO participants VALUES(NULL, 'Smail', 'JT2344', 1);
INSERT INTO participants VALUES(NULL, 'souad', 'JT1287', 1);
INSERT INTO participants VALUES(NULL, 'ahmad', 'jc12887', 1);
INSERT INTO participants VALUES(NULL, 'ahmad', 'JT124855', 1);
INSERT INTO participants VALUES(NULL, 'ahmad', 'JT12822', 1);
INSERT INTO participants VALUES(NULL, 'ahmad', 'JT12887', 1);
INSERT INTO participants VALUES(NULL, 'brahim', 'JT123845', 1);
INSERT INTO participants VALUES(NULL, 'khadija', 'JT16389', 1);
INSERT INTO participants VALUES(NULL, 'fatiha', 'sh7668', 1);
INSERT INTO participants VALUES(NULL, 'soumiya', 'sh2342', 1);

-- pour Insérer dans tableau billets
INSERT INTO billets VALUES(NULL, '2024', '300', 50, NULL);

-- pour Insérer dans tableau lieux
INSERT INTO lieux VALUES(NULL, 'Maroc', 'Agadir', 'Agadir Bay', 50);

-- pour Delete dans tableau sponsors
DELETE FROM `sponsors` WHERE `name` = 'ahmad';
DELETE FROM `sponsors` WHERE `id` >= '10';

-- pour Update dans tableau sponsors
UPDATE participants SET name = 'youssouf', cni = 'JC0987' WHERE id = 6;
UPDATE lieux SET pays = 'Maroc',  ville = 'Raba', adresse = 'center' WHERE id = 1;
UPDATE participants SET id_billet = NULL;
-- pour Read un tableau sponsors 
SELECT * FROM sponsors


