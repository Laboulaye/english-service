CREATE TABLE english.users(
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL ,
    password VARCHAR(45) NOT NULL ,
    PRIMARY KEY (id),
    UNIQUE INDEX email_UNIQUE (email ASC ) VISIBLE);

INSERT INTO english.users(email, password) VALUES ('abc@abc.ru', '1');
INSERT INTO english.users(email, password) VALUES ('def@abc.ru', '1');

CREATE TABLE `english`.`roles` (
                                   `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                                   `name` VARCHAR(45) NOT NULL,
                                   PRIMARY KEY (`id`),
                                   UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
CREATE TABLE `english`.`users_roles` (
                                         `user_id` BIGINT(20) NOT NULL,
                                         `role_id` BIGINT(20) NOT NULL,
                                         INDEX `fk_user_idx` (`user_id` ASC) VISIBLE,
                                         INDEX `fk_roles_idx` (`role_id` ASC) VISIBLE,
                                         CONSTRAINT `fk_users`
                                             FOREIGN KEY (`user_id`)
                                                 REFERENCES `english`.`users` (`id`)
                                                 ON DELETE NO ACTION
                                                 ON UPDATE NO ACTION,
                                         CONSTRAINT `fk_roles`
                                             FOREIGN KEY (`role_id`)
                                                 REFERENCES `english`.`roles` (`id`)
                                                 ON DELETE NO ACTION
                                                 ON UPDATE NO ACTION);

INSERT INTO `english`.`roles` (`name`) VALUES ('USER');
INSERT INTO `english`.`roles` (`name`) VALUES ('MANAGER');
INSERT INTO `english`.`roles` (`name`) VALUES ('ADMIN');

INSERT INTO `english`.`users_roles` (`user_id`, `role_id`) VALUES ('1', '1');
INSERT INTO `english`.`users_roles` (`user_id`, `role_id`) VALUES ('2', '1');

CREATE TABLE `english`.`en_words` (
                                      `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                                      `meaning` VARCHAR(45) NOT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE INDEX `meaning_UNIQUE` (`meaning` ASC) VISIBLE);

CREATE TABLE `english`.`ru_words` (
                                      `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                                      `meaning` VARCHAR(45) NOT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE INDEX `meaning_UNIQUE` (`meaning` ASC) VISIBLE);


CREATE TABLE `english`.`cards` (
                                   `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                                   `en_word_id` BIGINT(20) NOT NULL,
                                   `ru_word_id` BIGINT(20) NOT NULL,
                                   `rating` BIGINT(20) NULL,
                                   PRIMARY KEY (`id`),
                                   INDEX `fk_en_word_idx` (`en_word_id` ASC) VISIBLE,
                                   INDEX `fk_ru_word_idx` (`ru_word_id` ASC) VISIBLE,
                                   CONSTRAINT `fk_en_word`
                                       FOREIGN KEY (`en_word_id`)
                                           REFERENCES `english`.`en_words` (`id`)
                                           ON DELETE NO ACTION
                                           ON UPDATE NO ACTION,
                                   CONSTRAINT `fk_ru_word`
                                       FOREIGN KEY (`ru_word_id`)
                                           REFERENCES `english`.`ru_words` (`id`)
                                           ON DELETE NO ACTION
                                           ON UPDATE NO ACTION);

INSERT INTO `english`.`en_words` (`meaning`) VALUES ('Hello');
INSERT INTO `english`.`ru_words` (`meaning`) VALUES ('Привет');
INSERT INTO `english`.`cards` (en_word_id, ru_word_id, rating) VALUES ('1', '1', '1');

INSERT INTO `english`.`en_words` (`meaning`) VALUES ('Mia');
INSERT INTO `english`.`ru_words` (`meaning`) VALUES ('Миа');
INSERT INTO `english`.`cards` (en_word_id, ru_word_id, rating) VALUES ('2', '2', '2');