USE pet_db;
SELECT Pet.Age, count(*) FROM Pet GROUP BY Pet.Age;

SELECT count(*) as count, Pet_Type.Name, Pet.Age FROM Pet, Pet_Type 
	WHERE Pet_Type.Pet_Type_ID = Pet.Pet_Type_ID GROUP BY Pet_Type.Name, 
	Pet.Age ORDER BY Pet_Type.Name, Pet.Age;

SELECT Pet_Type.Name, AVG(convert(decimal, Pet.Age)) as  avg_age FROM Pet, Pet_Type 
WHERE  Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
GROUP BY Pet_Type.Name HAVING AVG(convert(decimal, Pet.Age)) < 6;

SELECT count(*) AS count_of_order, Person.Last_Name FROM Employee, Order1, 
	Person WHERE Order1.Employee_ID = Employee.Employee_ID 
	AND Person.Person_ID = Employee.Person_ID AND Order1.Is_Done = 1 GROUP BY 
	Person.Person_ID, Person.Last_Name
	HAVING count(*) > 5;

--¬ывести Ќики животных в верхнем регистре
SELECT UPPER(Pet.Nick) as Upper_Nick FROM Pet;

--¬ывести данные о прививках, которые были сделаны больше 10 дней назад.
SELECT Vaccination.* FROM Vaccination WHERE DATEDIFF(DAY, Vaccination.Date_Vaccination, GETDATE())>10;
