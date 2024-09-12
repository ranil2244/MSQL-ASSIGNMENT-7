
 CREATE DATABASE COUNTRY_FIELD;
 
 USE COUNTRY_FIELD;
 
 CREATE TABLE COUNTRY
 (COUNTRY_ID INT PRIMARY KEY ,
 COUNTRY_NAME VARCHAR(30) ,
 POPULATION  DECIMAL(30), 
 AREA VARCHAR (30)
 );
 
 SELECT * FROM COUNTRY;
 INSERT INTO COUNTRY (COUNTRY_ID,COUNTRY_NAME,POPULATION,AREA) VALUES
 
 (1 ,'India' ,500000 , 2973190),
 (2 ,'China' ,400000 , 9388211),
 (3 ,'USA',450000 , 9147420),
 (4 ,'UK' ,350000 , 770880),
 (5 ,'Nigeria' ,250000 , 910770),
 (6 ,'Brazil' ,250000 , 8358140),
 (7 ,'Canada' ,3550000 , 16376870),
 (8 ,'Australia' ,450900 ,1000000),
 (9 ,'Mexico' ,239000 , 1943950),
 (10 ,'Philippines' ,270000 , 298170); 
 
 SELECT * FROM COUNTRY;
 
 
 CREATE TABLE PERSONS (PERSON_ID INT PRIMARY KEY NOT NULL,
 F_NAME VARCHAR (30)
 ,L_NAME VARCHAR(30)
 ,POPULATION DECIMAL(30)
 ,RATING DECIMAL(3,1)
 ,COUNTRY_ID DECIMAL (30)
 , COUNTRY_NAME VARCHAR(30)
 );
 SELECT * FROM PERSONS;
 
 INSERT INTO PERSONS (PERSON_ID,F_NAME,L_NAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME) VALUES
 
 (30,'Linto' ,'Jhon' , 500000 ,2.0 , 1 ,'India'),
 (29, 'Mirchel' ,'Khan' ,400000 ,1.0 , 2 ,null),
 (28, 'Mubarak' ,'Sidhik',450000 ,1.6 , 3 ,'UK'),
(27, 'Siraj' ,'Sahid' ,350000 ,2.7 , 4 , 'USA'),
(26, 'Rhul' ,'Menon' , 250000 ,1.6 , 5 ,'Nigeria'),
(25, 'Namitha' ,'Premodh' ,250000 ,6.5 ,6 ,'Brazil'),
(24, 'Vidhu'  ,'Predhavan' ,355000 ,4.6 , 7 ,null),
(23, 'Nikhil' , 'Sanker' , 450900 ,3.9 , 8 ,'Canada'),
(22, 'Virat' ,'Kholi' , 230900 ,1.4 ,  9 ,null),
(21, 'Rohit' ,'Sharma' ,270000 ,5.9 , 10 , 'Philippines');
select * from COUNTRY;
select * from PERSONS;


#(1). Add a new column called DOB in Persons table with data type as Date.
alter table PERSONS add DOB date;
update PERSONS set DOB = '1985-06-15' where PERSON_ID = 21;
update PERSONS set DOB = '1990-12-05' where PERSON_ID = 22;
update PERSONS set DOB = '1989-06-25' where PERSON_ID = 23;
update PERSONS set DOB = '1975-09-15' where PERSON_ID = 24;
update PERSONS set DOB = '2000-06-30' where PERSON_ID = 25;
update PERSONS set DOB= '1997-11-25' where PERSON_ID = 26;
update PERSONS set DOB = '1986-06-14' where PERSON_ID = 27;
update PERSONS set DOB = '1995-10-05' where PERSON_ID = 28;
update PERSONS set DOB= '1985-05-19' where PERSON_ID = 29;
update PERSONS set DOB = '1974-08-12' where PERSON_ID = 30;




#(2). Write a user-defined function to calculate age using DOB.

DELIMITER $$
CREATE FUNCTION calculate_age(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE age INT;
SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE()) - 
CASE WHEN MONTH(dob) > MONTH(CURDATE()) OR (MONTH(dob) = MONTH(CURDATE()) AND DAY(dob) > DAY(CURDATE())) 
THEN 1 
ELSE 0 
END;
RETURN age;
END $$

DELIMITER ;

#(3). Write a select query to fetch the Age of all persons using the function that has been created
select F_NAME,calculate_age(dob) as age from PERSONS;

#(4). Find the length of each country name in the Country table
select country_name, char_length(country_name) as name_length from country;


#(5). Extract the first three characters of each country's name in the Country table. 
select COUNTRY_ID, (substring(COUNTRY_NAME,-3)) from COUNTRY;

 #(6). Convert all country names to uppercase and lowercase in the Country table.
select COUNTRY_NAME , lower(COUNTRY_NAME) as lower_case from COUNTRY;
select COUNTRY_NAME , upper(COUNTRY_NAME) as upper_case from COUNTRY;
