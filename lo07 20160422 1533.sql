--
-- Script was generated by Devart dbForge Studio for MySQL, Version 6.3.341.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 22/04/2016 15:33:01
-- Server version: 5.6.17
-- Client version: 4.1
--


-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set default database
--
USE lo07;

--
-- Definition for table categorie
--
DROP TABLE IF EXISTS categorie;
CREATE TABLE categorie (
  catgID INT(11) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (catgID)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table organisation
--
DROP TABLE IF EXISTS organisation;
CREATE TABLE organisation (
  orgID INT(11) NOT NULL AUTO_INCREMENT,
  nomOrg VARCHAR(255) DEFAULT NULL,
  adresse VARCHAR(255) DEFAULT NULL,
  telephone VARCHAR(255) DEFAULT NULL,
  site VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (orgID)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table statut
--
DROP TABLE IF EXISTS statut;
CREATE TABLE statut (
  statutID INT(11) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (statutID)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table equipe
--
DROP TABLE IF EXISTS equipe;
CREATE TABLE equipe (
  equipeID INT(11) NOT NULL AUTO_INCREMENT,
  nomE VARCHAR(255) DEFAULT NULL,
  orgID INT(11) DEFAULT NULL,
  PRIMARY KEY (equipeID),
  CONSTRAINT FK_equipe_organisation_orgID FOREIGN KEY (orgID)
    REFERENCES organisation(orgID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table publication
--
DROP TABLE IF EXISTS publication;
CREATE TABLE publication (
  pubID INT(11) NOT NULL AUTO_INCREMENT,
  titre VARCHAR(255) DEFAULT NULL,
  reference VARCHAR(255) DEFAULT NULL,
  date DATE DEFAULT NULL,
  catgID INT(11) DEFAULT NULL,
  statutID INT(11) DEFAULT NULL,
  PRIMARY KEY (pubID),
  CONSTRAINT FK_publication_categorie_catgID FOREIGN KEY (catgID)
    REFERENCES categorie(catgID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_publication_statut_statutID FOREIGN KEY (statutID)
    REFERENCES statut(statutID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table chercheur
--
DROP TABLE IF EXISTS chercheur;
CREATE TABLE chercheur (
  chercheurID INT(11) NOT NULL AUTO_INCREMENT,
  login VARCHAR(255) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  nom VARCHAR(255) DEFAULT NULL,
  prenom VARCHAR(255) DEFAULT NULL,
  mail VARCHAR(255) DEFAULT NULL,
  equipeID INT(11) DEFAULT NULL,
  PRIMARY KEY (chercheurID),
  CONSTRAINT FK_chercheur_equipe_equipeID FOREIGN KEY (equipeID)
    REFERENCES equipe(equipeID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table conference
--
DROP TABLE IF EXISTS conference;
CREATE TABLE conference (
  pubID INT(11) DEFAULT NULL,
  lieu VARCHAR(255) DEFAULT NULL,
  CONSTRAINT FK_conference_publication_pubID FOREIGN KEY (pubID)
    REFERENCES publication(pubID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table auteur
--
DROP TABLE IF EXISTS auteur;
CREATE TABLE auteur (
  chercheurID INT(11) DEFAULT NULL,
  pubID INT(11) DEFAULT NULL,
  CONSTRAINT FK_auteur_chercheur_chercheurID FOREIGN KEY (chercheurID)
    REFERENCES chercheur(chercheurID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_auteur_publication_pubID FOREIGN KEY (pubID)
    REFERENCES publication(pubID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 
-- Dumping data for table categorie
--

-- Table lo07.categorie does not contain any data (it is empty)

-- 
-- Dumping data for table organisation
--

-- Table lo07.organisation does not contain any data (it is empty)

-- 
-- Dumping data for table statut
--

-- Table lo07.statut does not contain any data (it is empty)

-- 
-- Dumping data for table equipe
--

-- Table lo07.equipe does not contain any data (it is empty)

-- 
-- Dumping data for table publication
--

-- Table lo07.publication does not contain any data (it is empty)

-- 
-- Dumping data for table chercheur
--

-- Table lo07.chercheur does not contain any data (it is empty)

-- 
-- Dumping data for table conference
--

-- Table lo07.conference does not contain any data (it is empty)

-- 
-- Dumping data for table auteur
--

-- Table lo07.auteur does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;