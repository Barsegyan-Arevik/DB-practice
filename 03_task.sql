USE pet_db;

SELECT Pet.Nick, Pet_Type.Name FROM Pet, Pet_Type 
	WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
		AND Pet.Nick = 'Partizan';
SELECT Pet.Nick, Pet_Type.Name FROM Pet 
	JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
		WHERE Pet.Nick = 'Partizan';

SELECT Pet.Nick, Pet.Breed, Pet.Age FROM Pet, Pet_Type 
	WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
		AND Pet_Type.Name = 'DOG';
SELECT Pet.Nick, Pet.Breed, Pet.Age FROM Pet 
	JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
		WHERE Pet_Type.Name = 'DOG';

SELECT AVG(convert(decimal, Pet.Age)) FROM Pet, Pet_Type 
	WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Pet_Type.Name = 'CAT';
SELECT AVG(convert(decimal, Pet.Age)) FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
	WHERE Pet_Type.Name = 'CAT';

SELECT Order1.Time_Order, Person.Last_Name FROM Order1, Employee, Person 
	WHERE Order1.Employee_ID = Employee.Employee_ID 
		AND Employee.Person_ID = Person.Person_ID 
		AND Order1.Is_Done = '0';
SELECT Order1.Time_Order, Person.Last_Name FROM Order1 
	JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID 
	JOIN Person ON Employee.Person_ID = Person.Person_ID 
		WHERE Order1.Is_Done = '0';

SELECT Person.First_Name, Person.Last_Name, Person.Phone FROM Pet, Pet_Type, Person, Owner  
	WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
		AND Pet.Owner_ID = Owner.Owner_ID 
		AND Owner.Person_ID = Person.Person_ID 
		AND Pet_Type.Name = 'DOG';
SELECT Person.First_Name, Person.Last_Name, Person.Phone FROM Pet 
	JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
	JOIN Owner ON Pet.Owner_ID = Owner.Owner_ID 
	JOIN Person ON Owner.Person_ID = Person.Person_ID 
		WHERE Pet_Type.Name = 'DOG';

SELECT Pet_Type.Name, Pet.Nick FROM Pet_Type 
	FULL OUTER JOIN  Pet ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;
SELECT Pet_Type.Name, Pet.Nick FROM Pet_Type 
	LEFT OUTER JOIN Pet ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;

--Вывести список кошек, которым сделали прививку от гриппа.
SELECT Pet.Nick, Vaccination.Date_Vaccination , Vaccination_Type.Name FROM Vaccination, Vaccination_Type, Pet, Pet_Type 
	WHERE Vaccination.Vaccination_Type_ID = Vaccination_Type.Vaccination_Type_ID 
		AND Vaccination.Pet_ID = Pet.Pet_ID 
		AND Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
		AND Vaccination_Type.Name = 'Flu' 
		AND Pet_Type.Name = 'CAT';

SELECT Pet.Nick, Vaccination.Date_Vaccination , Vaccination_Type.Name FROM Vaccination
	JOIN Vaccination_Type ON Vaccination.Vaccination_Type_ID = Vaccination_Type.Vaccination_Type_ID
	JOIN Pet ON Vaccination.Pet_ID = Pet.Pet_ID
	JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
		WHERE Vaccination_Type.Name = 'Flu' 
			AND Pet_Type.Name = 'CAT';