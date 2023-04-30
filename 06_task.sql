USE pet_db;

SELECT * FROM Person;
INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address)
	SELECT MAX(Person_ID) + 1, 'Mezentseva', 'Alisa', '253-71-60', 'Sadovaya, 31' FROM Person;

SELECT Employee.Spec, Order1.Comments FROM Employee, Order1 WHERE Employee.Employee_ID = Order1.Employee_ID;

UPDATE Order1 SET Comments = Comments + 's' WHERE Order1.Employee_ID IN
	(SELECT Employee.Employee_ID FROM Employee WHERE Employee.Spec = 'student');

CREATE TABLE Document_ (
	Person_ID		INTEGER		 NOT NULL,
	Document_Type	VARCHAR(50)  NOT NULL,
    Number			INTEGER      NOT NULL,

	CONSTRAINT FK_Document_
	FOREIGN KEY (Person_ID)
	REFERENCES Person(Person_ID)
	ON DELETE CASCADE
);

INSERT INTO Document_(Person_ID, Number, Document_Type) VALUES (11, 47246975, 'passport');
INSERT INTO Document_ (Person_ID, Number, Document_Type) VALUES (11, 2164, 'registration');
INSERT INTO Document_ (Person_ID, Number, Document_Type) VALUES (11, 098506, 'ITN');

SELECT * FROM Document_;

DELETE FROM Person WHERE Last_Name = 'Mezentseva';