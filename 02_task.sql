USE pet_db;

SELECT * FROM Pet WHERE Nick = 'Partizan';
SELECT Nick, Breed, Age FROM Pet ORDER BY Age;
SELECT Nick, Description FROM Pet WHERE Description is NOT NULL AND NOT Description = ''; 
SELECT AVG(Age) FROM Pet WHERE Breed = 'poodle';
SELECT COUNT(DISTINCT Owner_ID) FROM Pet;
--����� �������� �������� �� 1 �� 7 ���.
SELECT * FROM Pet WHERE Age BETWEEN 1 AND 7;
--����� ��������, ��� ������� ���������� � ����� �
SELECT * FROM Pet WHERE Nick LIKE 'A%';
--����� ��������, � ������� ID ���� ����� 3
SELECT * FROM Pet WHERE Pet_Type_ID IN (3);