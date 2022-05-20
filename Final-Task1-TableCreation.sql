-- Creation of DataBase Task1 
 CREATE DATABASE Task1

------------------------------- Table Creation ---------------------------------------

----------------------Creating tables child Biograph----------------------

create table childBiography_Ethiopia (
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   deceased nvarchar(50),
   region nvarchar(50),
   typesite nvarchar(50),
   chsex nvarchar(50),
);


create table childBiography_India (
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   deceased nvarchar(50),
   region nvarchar(50),
   typesite nvarchar(50),
   chsex nvarchar(50),
);

create table childBiography_Peru (
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   deceased nvarchar(50),
   region nvarchar(50),
   typesite nvarchar(50),
   chsex nvarchar(50),
);
 

create table childBiography_Vietnam (
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   deceased nvarchar(50),
   region nvarchar(50),
   typesite nvarchar(50),
   chsex nvarchar(50),
);


-----------------------------------INSERTING DATA---------------------------------
INSERT INTO childBiography_Ethiopia
SELECT childid, round, 
CASE deceased 
WHEN 1 THEN 'Yes'
ELSE 'No'
END,
CASE region 
WHEN 1 THEN 'Tigray'
WHEN 2 THEN 'Afar'
WHEN 3 THEN 'Amhara'
WHEN 4 THEN 'Oromiya'
WHEN 5 THEN 'Somali'
WHEN 6 THEN 'Benshangul Gumz'
WHEN 7 THEN 'SNNP'
WHEN 12 THEN 'Gambela'
WHEN 13 THEN 'Harari'
WHEN 14 THEN 'Addis Ababa City Administration'
WHEN 15 THEN 'Dire Dawa City Administration'
ELSE 'Unknown'
END,
CASE typesite 
WHEN 1 THEN 'urban'
WHEN 2 THEN 'rural'
ELSE 'Unknown'
END,
CASE chsex 
WHEN 1 THEN 'male'
WHEN 2 THEN 'female'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[ethiopia_constructed];


INSERT INTO childBiography_India
SELECT childid, round, 
CASE deceased 
WHEN 1 THEN 'Yes'
ELSE 'No'
END,
CASE region 
WHEN 24	THEN 'Others'
WHEN 23	THEN 'Telangana'
WHEN 77	THEN  'Unknown'
WHEN 22	THEN 'Rayalaseema'
WHEN 21	THEN 'Coastal Andhra'
ELSE 'Unknown'
END,
CASE typesite 
WHEN 1 THEN 'urban'
WHEN 2 THEN 'rural'
ELSE 'Unknown'
END,
CASE chsex 
WHEN 1 THEN 'male'
WHEN 2 THEN 'female'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[india_constructed];

SELECT * from childBiography_India;

INSERT INTO childBiography_Peru
SELECT childid, round, 
CASE deceased 
WHEN 1 THEN 'Yes'
ELSE 'No'
END,
CASE region 
WHEN 32	THEN 'Sierra'
WHEN 33 THEN 'Selva'
WHEN 88	THEN 'N/A'
WHEN 31	THEN 'Costa'
ELSE 'Unknown'
END,
CASE typesite 
WHEN 1 THEN 'urban'
WHEN 2 THEN 'rural'
ELSE 'Unknown'
END,
CASE chsex 
WHEN 1 THEN 'male'
WHEN 2 THEN 'female'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[peru_constructed];


INSERT INTO childBiography_Vietnam
SELECT childid, round, 
CASE deceased 
WHEN 1 THEN 'Yes'
ELSE 'No'
END,
CASE region 
WHEN 51	THEN 'Northern Uplands'	
WHEN 52	THEN 'Red River Delta'
WHEN 53 THEN 'Phu Yen'
WHEN 54	THEN 'Da Nang'
WHEN 55 THEN 'Highlands'
WHEN 56 THEN 'South Eastern'
WHEN 57 THEN 'Mekong River Delta'
WHEN 58 THEN 'Other'
ELSE 'Unknown'
END,
CASE typesite 
WHEN 1 THEN 'urban'
WHEN 2 THEN 'rural'
ELSE 'Unknown'
END,
CASE chsex 
WHEN 1 THEN 'male'
WHEN 2 THEN 'female'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[vietnam_constructed];




create table  childHealth_Ethiopia (
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   chweight nvarchar(50),
   chheight nvarchar(50),
   bmi nvarchar(50),
   underweight nvarchar(50),
   stunting nvarchar(50),
   thinness nvarchar(50),
   chhealth nvarchar(50),
   );


alter table childHealth_Ethiopia
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Ethiopia


---------------------------------Creating table Child Health and Inserting the Data to it 
----------------------

create table childHealth_India (
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   chweight nvarchar(50),
   chheight nvarchar(50),
   bmi nvarchar(50),
   underweight nvarchar(50),
   stunting nvarchar(50),
   thinness nvarchar(50),
   chhealth nvarchar(50),
   );

alter table childHealth_India
ADD Foreign key(childid,round)
REFERENCES 
childBiography_India

create table childHealth_Peru(
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   chweight nvarchar(50),
   chheight nvarchar(50),
   bmi nvarchar(50),
   underweight nvarchar(50),
   stunting nvarchar(50),
   thinness nvarchar(50),
   chhealth nvarchar(50),
   );

alter table childHealth_Peru
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Peru



create table childHealth_Vietnam(
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   chweight nvarchar(50),
   chheight nvarchar(50),
   bmi nvarchar(50),
   underweight nvarchar(50),
   stunting nvarchar(50),
   thinness nvarchar(50),
   chhealth nvarchar(50),
   );


alter table childHealth_Vietnam
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Vietnam

--inserting data
INSERT INTO childHealth_Ethiopia
SELECT childid, round, chweight, chheight, bmi ,
CASE underweight 
WHEN 0 THEN 'not underweight'
WHEN 1 THEN 'moderately underweight'
WHEN 2 THEN 'severely underweight'
ELSE 'Unknown'
END,
CASE stunting
WHEN 0 THEN 'not stunted'
WHEN 1 THEN 'moderately stunted'
WHEN 2 THEN 'severely stunted'
ELSE 'Unknown'
END,
CASE thinness
WHEN 0 THEN 'not thin'
WHEN 1 THEN 'moderately thin'
WHEN 2 THEN 'severely thin'
ELSE 'Unknown'
END,
CASE chhealth 
WHEN 1 THEN 'very poor'
WHEN 2 THEN 'poor'
WHEN 3 THEN 'average'
WHEN 4 THEN 'good'
WHEN 5 THEN 'very good'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[ethiopia_constructed];

INSERT INTO childHealth_India
SELECT childid, round, chweight, chheight, bmi ,
CASE underweight 
WHEN 0 THEN 'not underweight'
WHEN 1 THEN 'moderately underweight'
WHEN 2 THEN 'severely underweight'
ELSE 'Unknown'
END,
CASE stunting
WHEN 0 THEN 'not stunted'
WHEN 1 THEN 'moderately stunted'
WHEN 2 THEN 'severely stunted'
ELSE 'Unknown'
END,
CASE thinness
WHEN 0 THEN 'not thin'
WHEN 1 THEN 'moderately thin'
WHEN 2 THEN 'severely thin'
ELSE 'Unknown'
END,
CASE chhealth 
WHEN 1 THEN 'very poor'
WHEN 2 THEN 'poor'
WHEN 3 THEN 'average'
WHEN 4 THEN 'good'
WHEN 5 THEN 'very good'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[india_constructed];

INSERT INTO childHealth_Peru
SELECT childid, round, chweight, chheight, bmi ,
CASE underweight 
WHEN 0 THEN 'not underweight'
WHEN 1 THEN 'moderately underweight'
WHEN 2 THEN 'severely underweight'
ELSE 'Unknown'
END,
CASE stunting
WHEN 0 THEN 'not stunted'
WHEN 1 THEN 'moderately stunted'
WHEN 2 THEN 'severely stunted'
ELSE 'Unknown'
END,
CASE thinness
WHEN 0 THEN 'not thin'
WHEN 1 THEN 'moderately thin'
WHEN 2 THEN 'severely thin'
ELSE 'Unknown'
END,
CASE chhealth 
WHEN 1 THEN 'very poor'
WHEN 2 THEN 'poor'
WHEN 3 THEN 'average'
WHEN 4 THEN 'good'
WHEN 5 THEN 'very good'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[peru_constructed];

INSERT INTO childHealth_Vietnam
SELECT childid, round, chweight, chheight, bmi ,
CASE underweight 
WHEN 0 THEN 'not underweight'
WHEN 1 THEN 'moderately underweight'
WHEN 2 THEN 'severely underweight'
ELSE 'Unknown'
END,
CASE stunting
WHEN 0 THEN 'not stunted'
WHEN 1 THEN 'moderately stunted'
WHEN 2 THEN 'severely stunted'
ELSE 'Unknown'
END,
CASE thinness
WHEN 0 THEN 'not thin'
WHEN 1 THEN 'moderately thin'
WHEN 2 THEN 'severely thin'
ELSE 'Unknown'
END,
CASE chhealth 
WHEN 1 THEN 'very poor'
WHEN 2 THEN 'poor'
WHEN 3 THEN 'average'
WHEN 4 THEN 'good'
WHEN 5 THEN 'very good'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[vietnam_constructed];



---------------------------------Creating table Economic Status table and Inserting the Data to it 
----------------------
CREATE TABLE EconomicStatus_Ethiopia(
   childid nvarchar(50),
   round nvarchar (50),
   primary key(childid,round),
   foodsec nvarchar(50),
   InputPriceIncrease nvarchar (50),
   OutPriceDecrease nvarchar (50),
   JobLoss nvarchar(50),
   IncreseFoodPrice nvarchar(50),
   DecreaseFoodAvailability nvarchar(50)
   );
   
alter table EconomicStatus_Ethiopia
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Ethiopia

CREATE TABLE EconomicStatus_India(
   childid nvarchar(50),
   round nvarchar (50),
   primary key(childid,round),
   foodsec nvarchar(50),
   InputPriceIncrease nvarchar (50),
   OutPriceDecrease nvarchar (50),
   JobLoss nvarchar(50),
   IncreseFoodPrice nvarchar(50),
   DecreaseFoodAvailability nvarchar(50)
   );

   
alter table EconomicStatus_India
ADD Foreign key(childid,round)
REFERENCES 
childBiography_India

CREATE TABLE EconomicStatus_Peru(
   childid nvarchar(50),
   round nvarchar (50),
   primary key(childid,round),
   foodsec nvarchar(50),
   InputPriceIncrease nvarchar (50),
   OutPriceDecrease nvarchar (50),
   JobLoss nvarchar(50),
   DecreaseFoodAvailability nvarchar(50)
   );
 

   
alter table EconomicStatus_Peru
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Peru

CREATE TABLE EconomicStatus_Vietnam(
   childid nvarchar(50),
   round nvarchar (50),
   primary key(childid,round),
   foodsec nvarchar(50),
   InputPriceIncrease nvarchar (50),
   OutPriceDecrease nvarchar (50),
   JobLoss nvarchar(50),
   IncreseFoodPrice nvarchar(50),
   DecreaseFoodAvailability nvarchar(50)
   );


alter table EconomicStatus_Vietnam
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Vietnam


--inserting data
INSERT INTO EconomicStatus_Ethiopia
SELECT childid, round,
CASE foodsec
WHEN 1 THEN 'always eat enough'
WHEN 2 THEN 'eat enough but not always what liked'
WHEN 3 THEN 'sometimes do not eat enough'
WHEN 4 THEN 'frequently do not eat enough'
ELSE 'Unknown'
END,
CASE shecon1 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END ,
CASE shecon2
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shecon5
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon13
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon14
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END
From [Task1].[dbo].[ethiopia_constructed];


INSERT INTO EconomicStatus_India
SELECT childid, round,
CASE foodsec
WHEN 1 THEN 'always eat enough'
WHEN 2 THEN 'eat enough but not always what liked'
WHEN 3 THEN 'sometimes do not eat enough'
WHEN 4 THEN 'frequently do not eat enough'
ELSE 'Unknown'
END,
CASE shecon1 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END ,
CASE shecon2
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shecon5
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon13
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon14
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[india_constructed];

INSERT INTO EconomicStatus_Peru
SELECT childid, round,
CASE foodsec
WHEN 1 THEN 'always eat enough'
WHEN 2 THEN 'eat enough but not always what liked'
WHEN 3 THEN 'sometimes do not eat enough'
WHEN 4 THEN 'frequently do not eat enough'
ELSE 'Unknown'
END,
CASE shecon1 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END ,
CASE shecon2
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shecon5
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon14
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[peru_constructed];

INSERT INTO EconomicStatus_Vietnam
SELECT childid, round,
CASE foodsec
WHEN 1 THEN 'always eat enough'
WHEN 2 THEN 'eat enough but not always what liked'
WHEN 3 THEN 'sometimes do not eat enough'
WHEN 4 THEN 'frequently do not eat enough'
ELSE 'Unknown'
END,
CASE shecon1 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END ,
CASE shecon2
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shecon5
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon13
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE shecon14
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[vietnam_constructed];




---------------------------------Creating table Tragedy and Inserting the Data to it 
----------------------
CREATE TABLE Tragedy_Ethiopia(
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   CropsPest nvarchar(50),
   CropFailure nvarchar (50),
   NaturalDisaster nvarchar (50),
   Migrartion nvarchar (50)
);


alter table Tragedy_Ethiopia
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Ethiopia



CREATE TABLE Tragedy_India(
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   CropsPest nvarchar(50),
   CropFailure nvarchar (50),
   NaturalDisaster nvarchar (50),
   Migrartion nvarchar (50)
);

alter table Tragedy_India
ADD Foreign key(childid,round)
REFERENCES 
childBiography_India


CREATE TABLE Tragedy_Peru(
   childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   CropsPest nvarchar(50),
   CropFailure nvarchar (50),
   NaturalDisaster nvarchar (50),
   Migrartion nvarchar (50)
);

alter table Tragedy_Peru
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Peru

CREATE TABLE Tragedy_Vietnam(
  childid nvarchar(50),
   round nvarchar(50),
   primary key(childid,round),
   CropsPest nvarchar(50),
   CropFailure nvarchar (50),
   NaturalDisaster nvarchar (50),
   Migrartion nvarchar (50)
);

alter table Tragedy_Vietnam
ADD Foreign key(childid,round)
REFERENCES 
childBiography_Vietnam

--inserting data
INSERT INTO Tragedy_Ethiopia
SELECT childid,round,
CASE shenv5 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv6
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv9
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shfam14
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[ethiopia_constructed];

INSERT INTO Tragedy_India
SELECT childid,round,
CASE shenv5 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv6
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv9
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shfam14
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[india_constructed];

INSERT INTO Tragedy_Peru
SELECT childid,round,
CASE shenv5 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv6
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv9
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shfam14
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[peru_constructed];

INSERT INTO Tragedy_Vietnam
SELECT childid,round,
CASE shenv5 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv6
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shenv9
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE shfam14
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END
FROM [Task1].[dbo].[vietnam_constructed];



/****************************************************REPORTS*****************************************************************/

/** Query 1 **/ 

/*** Total Number of Childrens Died in India and Ethiopia ****/ 

SELECT (SELECT Count(DISTINCT Childid)  from childBiography_India
        WHERE  deceased = 'yes') AS count_India,
       (SELECT Count(DISTINCT Childid) from childBiography_Ethiopia
        WHERE  deceased = 'yes')   AS count_Ethiopia


/** Query 2 **/ 

/*** Total Number of childrens who got affectet by underweight issue in Ehiopia 
based on region  ****/ 

/**** Creating an View ***/

CREATE VIEW  underweight_issue AS
SELECT c.childid, c.underweight,d.[region]
FROM childHealth_Ethiopia as c, childBiography_Ethiopia as d
WHERE c.childid = d.childid

create or alter view basedonRegion as 
Select Count(Distinct Childid) as counts  ,[region] from underweight_issue 
where underweight = 'severely underweight' 
group by [region]

select * from basedonRegion

     

/** Query 3 **/ 

/*** Overall count of  childrens ,Got involved in stunting  issue in
India  and Peru  ****/ 


CREATE or alter VIEW  stunting_issue AS
SELECT count(c.childid) as counts, c.stunting,d.chsex
FROM childHealth_India as c, childBiography_India as d
where c.childid = d.childid AND stunting = 'severely stunted'
group by stunting,chsex


select * from stunting_issue  


/*********************************** Query 4 ******************************************************/ 

/*** Family Migrated In Peru ****/ 

SELECT y.region, COUNT(DISTINCT y.childid) as [Count]
FROM (SELECT c.childid, c.region, d.Migrartion
      FROM childBiography_Peru as c
	  FULL JOIN Tragedy_Peru as d
	  ON c.childid = d.childid) y
WHERE y.Migrartion = 'yes' 
GROUP BY y.region;


/** Query 5 **/ 

/*** Crop Failure affected the Family in  Vietnam Food Aviliablity ****/ 

SELECT d.foodsec, COUNT(DISTINCT d.childid) as [Count]
FROM (SELECT c.childid,c.CropFailure,d.foodsec
      FROM [Tragedy_Vietnam] as c
	  FULL JOIN EconomicStatus_Vietnam as d
	  ON c.childid = d.childid) d
	  where CropFailure = 'Yes'
GROUP BY d.foodsec ORDER BY Count;



/************************************************************ Query 6 **********************************************/ 

/******************************** Getting the BMI of the childrens in Vietnam who's health 
is Good **************************************/


--creating  Function to convert the float value to integer for finding the child health is poor 

create function dbo.kio(@opm float)
returns INT 
AS
BEGIN
RETURN @opm
END

Select childid , dbo.kio(bmi) as BMI,round, 
chhealth from childHealth_Vietnam where chhealth = 'poor'


/************************************************Query 7 **********************************************/ 
------Creating  an Stored Procedure--------------------
-------Less Food Aviliablity in India based on region  because of Natural Disaster-------------
CREATE or alter PROCEDURE lackOfFood_India
AS
BEGIN
SELECT e.region, COUNT(DISTINCT e.childid) AS [count]
FROM (SELECT c.childid, c.region, d.foodsec,f.NaturalDisaster,d.[DecreaseFoodAvailability]
	FROM childBiography_India AS c 
	INNER JOIN EconomicStatus_India AS d ON c.childid =d.childid
	INNER JOIN Tragedy_India AS F ON
	F.childid = d.childid)  e
WHERE [DecreaseFoodAvailability] = 'Yes'
AND NaturalDisaster = 'Yes'
GROUP BY e.region
END;

exec  lackOfFood_India






/** Query 8 **/
 
/**********Count of Childrens in  peru who was affected with stunting because of Foodsec 
 ****/

 Create or alter view FoodsThiness1
 as Select s.[childid],s.[foodsec] , y.[stunting] 
 from  [childHealth_Peru] as y , [EconomicStatus_Peru] as s
 where s.childid =y.childid and 
 [stunting] = 'severely stunted'


create or alter view FoodThiness2
as select count([stunting]) as counts ,[foodsec] from FoodsThiness1
group by [foodsec]

select * from FoodThiness2




