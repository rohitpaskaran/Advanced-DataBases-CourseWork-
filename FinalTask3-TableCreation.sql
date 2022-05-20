---------------------------Task 3 CRIME DATA-----------------------------------------------------


--Creating a Crime Table

 CREATE TABLE CRIMES(
    [ID] [int] IDENTITY(1,1) PRIMARY KEY,
    [Crime ID] [nvarchar](255) NULL,
    [Month] [nvarchar](255) NULL,
    [Reported by] [nvarchar](255) NULL,
    [Falls within] [nvarchar](255) NULL,
    [Longitude] [float] NULL,
    [Latitude] [float] NULL,
    [Location] [nvarchar](255) NULL,
    [LSOA code] [nvarchar](255) NULL,
    [LSOA name] [nvarchar](255) NULL,
    [Crime type] [nvarchar](255) NULL,
    [Last outcome category] [nvarchar](255) NULL,
    [Context] [nvarchar](255) NULL,
    [Geolocation] [geography] NULL);



--Inserting the values into the CrimeTable  from the Other DataTables using UnionAll

SELECT * INTO [CRIMES]
FROM [dbo].[2017/01] UNION ALL
SELECT * FROM [dbo].['2017-02-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-03-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-04-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-05-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-06-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-07-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-08-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-09-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-10-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-11-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2017-12-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-01-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-02-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-03-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-04-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-05-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-06-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-07-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-08-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-09-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-10-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-11-greater-manchester-stre$'] UNION ALL
SELECT * FROM [dbo].['2018-12-greater-manchester-stre$'];


--Adding a PrimaryKey id

ALTER TABLE [dbo].[CRIMES]
ADD ID INT IDENTITY;
ALTER TABLE [dbo].[CRIMES]
ADD CONSTRAINT PK_Id PRIMARY KEY NONCLUSTERED (ID);
GO

--Adding GeoLocation  

ALTER TABLE [CRIMES]
ADD [GeoLocation] GEOGRAPHY

--Updating Geolocation column with the value of latitude and Longitude and casting it into  Decimal Values

UPDATE [dbo].[CRIMES]
SET [GeoLocation] = geography::Point(Latitude, Longitude, 4326)
WHERE [Longitude] IS NOT NULL
AND [Latitude] IS NOT NULL
AND CAST(Latitude AS decimal(10, 6)) BETWEEN -90 AND 90
AND CAST(Longitude AS decimal(10, 6)) BETWEEN -90 AND 90



----------------------QGIS  Maping----------------------

/-- Creating Views for Vehicle crime--/

CREATE View  Vehiclecrime_by_GeoLocation
WITH SCHEMABINDING
AS
SELECT [Crime ID],[GeoLocation],[Crime type],[Month],[Latitude],[Longitude],[Location],[ID]
FROM [dbo].[CRIMES]
WHERE [Crime type]= 'Vehicle crime' 



/-- Creating Views for Anti Social Behaviour in Salford --

CREATE View Antisocialbehaviour_in_Salford
WITH SCHEMABINDING
AS
SELECT [Crime ID],[GeoLocation],[Crime type],[Month],[Latitude],[Longitude],[Location],[ID]
FROM [dbo].[CRIMES]
WHERE [Crime type]= 'Anti-social behaviour' AND [LSOA name] like 'Salford%'


--Checking the Created Views 

select * from Vehiclecrime_by_GeoLocation
select * from Antisocialbehaviour_in_Salford


--Creading and Index from ID for maping in QGIS

CREATE UNIQUE CLUSTERED INDEX idx_id ON [Vehiclecrime_by_GeoLocation](ID)
GO
CREATE UNIQUE CLUSTERED INDEX idx_id ON [Antisocialbehaviour_in_Salford](ID)
GO


----------------------QGIS  Maping END----------------------



/--------- LSOAs wise crime report with local population data in Greater Manchester  ---------/

-----------Preparing the Data ------------------------------

/-------- Inner Joining the two tables ------------/

SELECT * INTO joining_tables
from  CRIMES
INNER JOIN LSOA$ ON CRIMES.[LSOA code]=LSOA$.[Area Codes];

-------- Inner Joining the two tables with population count ------------

SELECT S.*, K.[All Ages] AS POPULATIONCOUNT
INTO joining_tables
FROM [CRIMES] S
INNER JOIN [LSOA$] K
ON S.[LSOA code] = K.[Area Codes]

----Checking the newly joined table

SELECT * FROM joining_tables




---------------------------------------Query1-------------------------------------

-----------------Counting the Crime Types By Location and population of top 100-----------------------------------------------

CREATE OR ALTER VIEW CountofCrime_AllLocation
AS
SELECT [LSOA name],[Location],[Crime type],[POPULATIONCOUNT] as Population ,COUNT([Crime type]) AS Count_of_Crime
FROM [dbo].[joining_tables]
GROUP BY [Crime type],[LSOA name],[Location],[POPULATIONCOUNT]

Create view Count_of_Top100 as 
select  TOP(100)* from CountofCrime_AllLocation ORDER BY Count_of_Crime desc

select * from Count_of_Top100



------------------------------------- Query 2 -------------------------------------

----------------------- Getting the Count of   Bicycle Crime  Reported in Trafford----------------

CREATE OR ALTER VIEW Bicycle_Crime_Trafford
AS
SELECT [LSOA name],[Crime type],[POPULATIONCOUNT] as Population ,COUNT([Crime type]) AS Counts
FROM [dbo].[joining_tables]
where [LSOA name]  like 'Trafford%' AND  [Crime type] = 'Bicycle theft'
GROUP BY [Crime type],[LSOA name],[POPULATIONCOUNT]



CREATE OR ALTER VIEW BicycleTheftTrafford
as  select [LSOA name],Counts from Bicycle_Crime_Trafford 

select * from  BicycleTheftTrafford order by Counts desc 

-----------------------------------------------Query 3-------------------------------------------------

---------------------------------Getting the Count of Population in Each LSOA Location------------------------

Create  OR ALTER VIEW PopulationCountByLSOA as 
Select  [POPULATIONCOUNT]  as Population ,[LSOA name]   as counts from joining_tables
group by [POPULATIONCOUNT],[LSOA name]


Create  OR ALTER VIEW top5PopulatedLocations as 
Select top(5) * from PopulationCountByLSOA

select * from top5PopulatedLocations order by counts desc

-------------------------------------------------Query 4-----------------------------------------------

----------------------------------------------------Failed Cases By LSOA Location---------------------------------------------
CREATE OR ALTER VIEW FailedCases_ByLsoaLocation
AS
SELECT [Last outcome category],[POPULATIONCOUNT]  as Population,[LSOA name],[Crime type]
FROM [dbo].[joining_tables]
where [Last outcome category] is not null AND  [Last outcome category] = 'Unable to prosecute suspect'
GROUP BY [Last outcome category],[POPULATIONCOUNT],[LSOA name],[Crime type]


CREATE OR ALTER VIEW FailedCasesCountTop10
AS
Select TOP (10) * FROM FailedCases_ByLsoaLocation

select * from FailedCasesCountTop10


--------------------------------------------------Query 5--------------------------------------------------
------------------------Crime Happened in the year 2017 in Bolton TOP 10----------------------------------------

Create  OR ALTER VIEW BoltonCrimesList2017
AS
SELECT [Month],[LSOA name],[Crime type],[POPULATIONCOUNT]  as Population
FROM [dbo].[joining_tables]
where   [Month] like '%2017%'
AND [LSOA name] like 'Bolton%'
GROUP BY [Month],[LSOA name],[Crime type],[POPULATIONCOUNT]

Select * from BoltonCrimesList2017

Create  OR ALTER VIEW BoltonTop10LSOACrimeCount
as 
select Count([Crime type]) as Counts,[LSOA name]  from
BoltonCrimesList2017
GROUP BY [LSOA name]

select TOP(10) * from BoltonTop10LSOACrimeCount  order by Counts desc 




--------------------------------------------------------Query 6------------------------------------------------ 

--------------------------Comparing the  crime count of  2017 and 2018 in Bolton,salford,Manchester----------

Create  OR ALTER VIEW Total_Number_of_theft_2017
AS
SELECT [Month],[LSOA name],[Crime type]
FROM [dbo].[joining_tables]
where   [Month] like '%2017%' and [LSOA name] like 'Bolton%'or [LSOA name] like 'Manchester%' 
or [LSOA name] like'salford%'
GROUP BY [Month],[LSOA name],[Crime type]

Create  OR ALTER VIEW Total_Number_of_theft_2018
AS
SELECT [Month],[LSOA name],[Crime type] 
FROM [dbo].[joining_tables]
where   [Month] like '%2018%' and [LSOA name] like 'Bolton%'or [LSOA name] like 'Manchester%' 
or [LSOA name] like'salford%'
GROUP BY [Month],[LSOA name],[Crime type]


Create  OR ALTER VIEW ComparingTwoYears as 
Select(Select count([Crime type]) as CrimeRate2017 from Total_Number_of_theft_2017)as Crime_Rate_in_2017,
(Select count([Crime type]) as CrimeRate2018 from Total_Number_of_theft_2018) as Crime_Rate_in_2018


Select * from Comparingtwoyears

-------------------------------------------------------------------------------------------------------------------------

