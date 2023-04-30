USE pet_db;

SELECT * FROM Pet WHERE Nick = 'Partizan';
SELECT Nick, Breed, Age FROM Pet ORDER BY Age;
SELECT Nick, Description FROM Pet WHERE Description is NOT NULL AND NOT Description = ''; 
SELECT AVG(Age) FROM Pet WHERE Breed = 'poodle';
SELECT COUNT(DISTINCT Owner_ID) FROM Pet;
--Найти питомцев возраста от 1 до 7 лет.
SELECT * FROM Pet WHERE Age BETWEEN 1 AND 7;
--Найти питомцев, Ник которых начинается с буквы А
SELECT * FROM Pet WHERE Nick LIKE 'A%';
--Найти питомцев, у которых ID вида равно 3
SELECT * FROM Pet WHERE Pet_Type_ID IN (3);