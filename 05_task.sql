USE pet_db;

SELECT Order1.Mark FROM Order1
	WHERE 'student' IN (SELECT Employee.Spec FROM Employee WHERE Order1.Employee_ID = Employee.Employee_ID) AND Order1.Is_Done = 1;

SELECT Person.Last_Name FROM Employee, Person
	WHERE Employee.Employee_ID NOT IN (SELECT Order1.Employee_ID FROM Order1) AND Person.Person_ID = Employee.Person_ID;

SELECT serv.Name, ord.Time_Order, p1.Last_Name, pts.Nick, p2.Last_Name FROM Service as serv, Order1 as ord, Person as p1, Pet as pts, Person as p2,
Employee as empl, Owner as own WHERE 
	own.Owner_ID = ord.Owner_ID AND
	own.Owner_ID = pts.Owner_ID AND
	own.Person_ID = p2.Person_ID AND
	empl.Person_ID = p1.Person_ID AND
	ord.Pet_ID = pts.Pet_ID AND
	ord.Employee_ID = empl.Employee_ID AND
	ord.Service_ID = serv.Service_ID;

SELECT * FROM (
	SELECT Order1.Comments FROM Order1 
	UNION
	SELECT Pet.Description FROM Pet 
	UNION 
	SELECT Owner.Description FROM Owner) as comts
		WHERE comts.Comments IS NOT NULL AND comts.Comments <> '';

SELECT DISTINCT Person.First_Name, Person.Last_Name FROM Person, Order1, Employee
	WHERE Person.Person_ID = Employee.Person_ID AND
	Employee.Employee_ID = Order1.Employee_ID AND
		  EXISTS (SELECT Order1.Mark FROM Order1 WHERE Order1.Mark = 5);