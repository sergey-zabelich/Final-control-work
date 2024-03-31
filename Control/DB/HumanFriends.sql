-- Удаляем базу данных, если она существует
DROP DATABASE IF EXISTS `Human Friends`;
-- Создаем базу данных
CREATE DATABASE IF NOT EXISTS `Human Friends`;
-- Используем только что созданную базу данных
USE `Human Friends`;
-- Удаляем таблицу Category, если она существует
DROP TABLE IF EXISTS Category;
-- Создаем таблицу Category
CREATE TABLE IF NOT EXISTS Category (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    name VARCHAR(50)
);
-- Вставляем данные в таблицу Category
INSERT INTO Category(name)
VALUES
	('Pets'),
    ('Pack Animals');
-- Выводим содержимое таблицы Category
SELECT * FROM `Human Friends`.Category;
-- Удаляем таблицу Types, если она существует
DROP TABLE IF EXISTS Types;
-- Создаем таблицу Types
CREATE TABLE IF NOT EXISTS Types(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(50), category_id INT,
    CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES Category(id)
);
-- Вставляем данные в таблицу Types
INSERT INTO Types(name, category_id)
VALUES
	('Собака', 1),
    ('Кошка', 1),
    ('Хомяк', 1),
    ('Лошадь', 2),
    ('Верблюд', 2),
    ('Осёл', 2);
-- Выводим содержимое таблицы Types
SELECT * FROM `Human Friends`.Types;
-- Создаём таблицу Animals и делаем связь с таблицей Types
DROP TABLE IF EXISTS Animals;
CREATE TABLE IF NOT EXISTS Animals(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(50), type_id INT, birthday DATE,
    CONSTRAINT fk_type FOREIGN KEY(type_id) REFERENCES Types(id)
);
INSERT INTO Animals(name, type_id, birthday)
VALUES
	('Гриша', 1, '2020-01-01'),
    ('Дима', 2, '2019-05-15'),
    ('Денис', 3, '2021-03-10'),
    ('Варвара', 1, '2018-12-10'),
    ('Анастасия', 2, '2020-02-20'),
    ('Светлана', 3, '2021-08-01'),
    ('Володя', 1, '2019-11-11'),
    ('Виктор', 2, '2020-06-30'),
    ('Алексей', 3, '2022-01-01'),
    ('Сергей', 4, '2022-02-02'),
    ('Мария', 5, '2022-03-03'),
    ('Анна', 6, '2022-04-04'),
    ('Иван', 4, '2022-05-05'),
    ('Елена', 5, '2022-06-06'),
    ('Николай', 6, '2022-07-07'),
    ('Татьяна', 5, '2022-08-08');
-- Выводим содержимое таблицы Animals
SELECT * FROM `Human Friends`.Animals;
-- Создаём таблицу Commands и делаем связь с таблицей Animals
DROP TABLE IF EXISTS Commands;
CREATE TABLE IF NOT EXISTS Commands(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(50), animal_id INT,
    CONSTRAINT fk_animal FOREIGN KEY(animal_id) REFERENCES Animals(id)
);
INSERT INTO Commands(name, animal_id)
VALUES
("Барьер", 1), ("Место", 1),("Крутись", 1),
("Домой", 2), ("Принеси", 2), 
("Брось", 3), ("Вверх", 3),
("Сидеть", 4), ("Лапу", 4), 
("Сидеть", 5), ("Принеси", 5), 
("Домой", 6), ("Место", 6), 
("Сидеть", 7), ("Прыжок", 7),("Вверх", 7),
("Прыжок", 8), ("Брось", 8),("Барьер", 8),
("Барьер", 9), ("Вверх", 9),("Прыжок", 9),
("Крутись", 10), ("Сидеть", 10),
("Сидеть", 11), ("Гулять", 11),
("Рысь", 12), ("Галоп", 12),
("Гулять", 13), ("Сидеть", 13),
("Гулять", 14), ("Пинать", 14),
("Рысь", 15), ("Галоп", 15),
("Гулять", 16), ("Беги", 16);
-- Выводим все значения таблицы Commands
SELECT * FROM `Human Friends`.Commands;
-- Создаём таблицу которая обьединяет таблицы Category, Types, Animals и выбирает возраст дивотных от 1 до 3 лет
CREATE VIEW PackAnimalsWithCommands AS
SELECT
	a.id,
    a.name,
    a.birthday,
    t.name AS animal_type,
    c.name AS category,
    GROUP_CONCAT(cm.name ORDER BY cm.name ASC SEPARATOR ', ') AS concatenated_commands
From Animals AS a
LEFT JOIN Types AS t ON t.id = a.type_id
JOIN Category AS c ON t.category_id = c.id
LEFT JOIN Commands AS cm ON cm.animal_id = a.id
WHERE c.name = 'Pack Animals' AND (t.name = 'Лошадь' OR t.name = 'Осёл')
GROUP BY a.id, a.name, a.birthday, t.name, c.name;
-- Выведем только лошадей и ослов
SELECT * FROM `Human Friends`.packanimalswithcommands
