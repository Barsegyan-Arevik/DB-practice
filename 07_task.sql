CREATE VIEW dogs_ (nick, breed, age, owner_last_name, owner_first_name) AS
	SELECT Pet.Nick, Pet.Breed, Pet.Age, Person.Last_Name, Person.First_Name
		FROM Pet, Owner, Person
		WHERE Pet.Owner_ID = Owner.Owner_ID AND
			  Owner.Person_ID = Person.Person_ID;

GO

CREATE VIEW emp_rating (last_name, first_name, number_orders, avg_mark) AS
	SELECT Person.Last_Name, Person.First_Name, COUNT(*), AVG(convert(decimal, Order1.Mark))
		FROM Order1, Employee, Person
		WHERE Order1.Employee_ID = Employee.Employee_ID AND
			  Employee.Person_ID = Person.Person_ID AND
			  Order1.Is_Done='1'
		GROUP BY Person.Person_ID, Person.Last_Name, Person.First_Name;

GO

CREATE VIEW client (Last_Name, First_Name, Phone, Address) AS
	SELECT Person.Last_Name, Person.First_Name, Person.Phone, Person.Address
		FROM Owner, Person
		WHERE Owner.Person_ID = Person.Person_ID;

GO

SELECT nick, owner_last_name FROM dogs_
	WHERE breed = 'poodle';

SELECT * FROM emp_rating ORDER BY avg_mark DESC;

UPDATE client SET Address = '?' WHERE Address IS NULL OR Address = '';