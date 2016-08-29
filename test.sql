CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE IF NOT EXISTS `test`.`user` (
    `id` INT(8) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(25) NOT NULL,
    `age` INT NOT NULL,
    `isAdmin` BIT NOT NULL,
    `createdDate` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COLLATE = utf8_general_ci;

INSERT INTO user (name, age, isAdmin) VALUES ('Roman', 29, TRUE );
INSERT INTO user (name, age, isAdmin) VALUES ('Rita', 21, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Anna', 28, TRUE );
INSERT INTO user (name, age, isAdmin) VALUES ('Kolya', 21, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Kate', 17, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Sasha', 23, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Nina', 24, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Mark', 19, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Eric', 29, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Jon', 28, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Rico', 31, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Elly', 32, FALSE );
INSERT INTO user (name, age, isAdmin) VALUES ('Amigo', 25, TRUE );
