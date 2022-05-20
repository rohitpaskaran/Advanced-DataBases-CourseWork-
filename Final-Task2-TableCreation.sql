  --creating tables for task 2, child_info
CREATE TABLE childIndex (
   UNIQUEID nvarchar(50) primary key,
   SCHOOLID nvarchar(50),
   STUDENTID nvarchar(50),
   PROVINCE nvarchar(50),
   DISTRICTCODE nvarchar(50),
   LOCALITY nvarchar(50),
   GENDER nvarchar(50),
   AGE nvarchar(50),
   ETHNICITY nvarchar(50),
 );
  

 --insering data
INSERT INTO childIndex 
SELECT UNIQUEID ,SCHOOLID ,STUDENTID,
CASE PROVINCE
WHEN 1 THEN 'Ben Tre'
WHEN 2 THEN 'Da Nang'
WHEN 3 THEN 'Hung Yen'
WHEN 4 THEN 'Lao Cai'
WHEN 5 THEN 'Phu Yen'
ELSE 'Unknown'
END,
CASE DISTRICTCODE
WHEN 1 THEN 'PY1'
WHEN 2 THEN 'PY2'
WHEN 3 THEN	'LPY3'
WHEN 4 THEN 'PY4'
WHEN 5 THEN 'BT1'
WHEN 6 THEN 'BT2'
WHEN 7 THEN 'LC1'
WHEN 8 THEN 'LC2'
WHEN 9 THEN 'LC3'
WHEN 10	THEN 'HY1'
WHEN 11	THEN 'HY2'
WHEN 12 THEN 'DN1'
WHEN 13	THEN 'DN2'
WHEN 14 THEN 'DN3'
ELSE 'Unknown'
END,
CASE LOCALITY
WHEN 1 THEN 'Rural'
WHEN 2 THEN 'Urban'
ELSE 'Unknown'
END,
CASE GENDER 
WHEN 1 THEN 'male'
WHEN 2 THEN 'female'
ELSE 'Unknown'
END,AGE ,
CASE ETHNICITY
WHEN 1 THEN 'Kinh'
WHEN 2 THEN 'H''Mong'
WHEN 3 THEN 'Cham-HRoi'
WHEN 4 THEN 'Ede'
WHEN 5 THEN 'Ba Na'
WHEN 6 THEN 'Nung'
WHEN 7 THEN 'Tay'
WHEN 8 THEN 'Dao'
WHEN 9 THEN 'Giay'
WHEN 10 THEN 'Other'
WHEN 88 THEN 'NA'
ELSE 'Unknown'
END
FROM [task2].[dbo].[vietnam_wave_1];


--creating table studyAccess
 CREATE TABLE  studyAccess(
   UNIQUEID nvarchar(50) primary key,
   Desk nvarchar(50),
   Chair nvarchar(50),
   Computer nvarchar(50),
   Internet nvarchar(50),
   MathsTextbook nvarchar(50),
   EnglishTextbook nvarchar(50),
 );

 --inserting data
 INSERT INTO studyAccess
SELECT UNIQUEID, 
CASE STHVDESK
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE STHVCHR
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE STHVCOMP
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE STHVINTR
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE STITMOW1 
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE STITMOW2 
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END
FROM [task2].[dbo].[vietnam_wave_1];

SELECT * FROM studyAccess
 
--creating table schoolAccess
CREATE TABLE schoolAccess(
	UNIQUEID nvarchar(50) primary key,
	SCHOOLID nvarchar(50),
    Chalk_or_BoardMarker nvarchar(50),
	Blackboard_or_whiteboard nvarchar(50),
	IT nvarchar(50),
	SchoolType nvarchar(50),
	Highest_Grade  nvarchar(50),
	HTPRDIST nvarchar(50),
	SchoolingAvailability  nvarchar(50),
);

--populating
INSERT INTO schoolAccess
SELECT UNIQUEID, SCHOOLID,
CASE SCAVLB1
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE SCAVLB2
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE SCAVLB10
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE HTTYPSCH
WHEN 1 THEN 'Government'
WHEN 2 THEN 'Private'
WHEN 3 THEN 'Other'
ELSE 'Unknown'
END,
CASE HTHGHGRD
WHEN 88	THEN 'NA'
WHEN 11	THEN 'Grade 11'
WHEN 10 THEN 'Grade 10'
WHEN 12	THEN 'Grade 12'
ELSE 'Unknown'
END,
CASE HTPRDIST
WHEN 0 THEN 'No'
WHEN 1 THEN 'Yes'
ELSE 'Unknown'
END,
CASE HTSCHAVL
WHEN 0 THEN 'no other upper secondary schools'
WHEN 1 THEN 'one other upper secondary school'
WHEN 2 THEN 'two or more other upper secondary schools'
ELSE 'Unknown'
END
FROM [task2].[dbo].[vietnam_wave_1];

SELECT * FROM schoolAccess;


--creating table SchoolRecord
CREATE TABLE  recordedIssues(
	UniqueID nvarchar (50) primary key,
	SchoolID nvarchar(50),
	PaidWork nvarchar(50),
    FamilyBussiness nvarchar(50),
    Chores nvarchar (50),
    Stddropout nvarchar (50),
    ChildLabour nvarchar (50),
	FailingSchoolInfra nvarchar(50),
	Teacherrecruitment nvarchar(50)
);


--Populating

INSERT INTO recordedIssues
SELECT UniqueID, SCHOOLID,
CASE STRSNMS3 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END ,
CASE STRSNMS4
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE STRSNMS5
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE HTSTDDRP
WHEN 1 THEN 'Never'
WHEN 2 THEN 'Occasionally'
WHEN 3 THEN 'offen'
ELSE 'Unknown'
END,
CASE HTCHDLBR
WHEN 1 THEN 'Never'
WHEN 2 THEN 'Occasionally'
WHEN 3 THEN 'offen'
ELSE 'Unknown'
END,
CASE HTFLSINF
WHEN 1 THEN 'Never'
WHEN 2 THEN 'Occasionally'
WHEN 3 THEN 'offen'
ELSE 'Unknown'
END,
CASE HTTCHRET
WHEN 1 THEN 'Never'
WHEN 2 THEN 'Occasionally'
WHEN 3 THEN 'offen'
ELSE 'Unknown'
END
From [Task2].[dbo].[vietnam_wave_2];

SELECT * FROM recordedIssues;

--creating table FeeConcession

CREATE TABLE feeException(
	UniqueID nvarchar (50) Primary key,
	SchoolID nvarchar(50) ,
	EthinicMinority nvarchar(50),  
    RemoteArea nvarchar(50),       
    Excellence_poverty  nvarchar (50),     
    Disability nvarchar (50),      
    AllStudentsPay nvarchar (50)     
);


--Populating table

INSERT INTO feeException
SELECT UNIQUEID, SCHOOLID,
CASE HTEXM021 
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE HTEXM031
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE HTEXM041
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE HTEXM051
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END,
CASE HTEXM001
WHEN 1 THEN 'Yes'
WHEN 0 THEN 'No'
ELSE 'Unknown'
END
FROM [Task2].[dbo].[vietnam_wave_1];

SELECT * FROM feeException;

--creating table enrollment
CREATE TABLE  childAcceptance(
      UNIQUEID nvarchar (50) Primary key ,
	  SCHOOLID nvarchar(50),  
      GirlsEnrollment nvarchar(50),     
      BoysEnrollment  nvarchar (50),     
      TotalEnrollment nvarchar (50), 
	  UniversityAccess nvarchar (50),
	  VocationalCollegeAccess nvarchar (50)
);


--Populating table

INSERT INTO childAcceptance(UNIQUEID,SCHOOLID, GirlsEnrollment, BoysEnrollment, TotalEnrollment, UniversityAccess, VocationalCollegeAccess)
SELECT w1.UNIQUEID, w1.SCHOOLID, w1.GRLENRL, w1.BOYENRL, w1.TTLENRL, w2.HTPRCUNI, w2.HTPRCVOC
FROM vietnam_wave_1 as w1 
FULL JOIN vietnam_wave_2 as w2
ON w1.UNIQUEID = w2.UNIQUEID;

SELECT * FROM childAcceptance;





/*** Creating the reports ****/


/**************************** Query 1 ************************************************************/ 

/****************** Comparision of Private and Government School  **********************/

Create  OR ALTER VIEW govenmentSchool as 
Select p.[SchoolType] ,g.[PROVINCE]
from childIndex as g,schoolAccess as p
where g.UNIQUEID = p.UNIQUEID 


Create  OR ALTER VIEW Governmentschoolcount_location as 
select count( SchoolType) as counts ,[SchoolType],PROVINCE from govenmentSchool group by PROVINCE,[SchoolType] 

select * from Governmentschoolcount_location order by counts desc


/****************************************** Query 2 **************************************/

/******************** Locality wise females count************************************/

Create  OR ALTER VIEW countoffemales_Locality as 
Select LOCALITY , count(UNIQUEID) as Counts  from childIndex where GENDER = 'female' Group by LOCALITY
 

select * from countoffemales_Locality	



/**********************************Query 3 ********************************v**/
/**** Count of Schools that dont have access to IT by School Type ******/

Create  OR ALTER VIEW SchoolNecessary as
select [IT],[SCHOOLID],[SchoolType] from [schoolAccess] 
where [IT] = 'No' or [Blackboard_or_whiteboard] = 'No' or [Chalk_or_BoardMarker]='No' ;

Create  OR ALTER VIEW SchoolNecessary_Grouped as
Select  COUNT(DISTINCT SCHOOLID) as count ,SchoolType from SchoolNecessary group by SchoolType

select * from  SchoolNecessary_Grouped


-----------------------Query 4-----------------------------------
----------------Getting Count of Government and private school ---------------------------


Create View SchoolTypeCount 
As
Select(Select count(SchoolType)  from schoolAccess WHERE SchoolType='Government') as GovernmentSchoolCount,    
(Select count(SchoolType)from schoolAccess WHERE SchoolType='Private') as PrivateSchoolCount 

select * FROM SchoolTypeCount


------------------------------Query  5---------------------------------------------------------------------
------------------------Getting the count of Books Aviliablity for Students.-------

Create  OR ALTER VIEW bookaccess as
select p.[MathsTextbook],s.[LOCALITY],
count(p.[UNIQUEID]) as counts  from  [studyAccess] as p, [childIndex] as s
where [MathsTextbook] = 'No'
and s.[UNIQUEID] = p.[UNIQUEID]
group by [LOCALITY],[MathsTextbook]

Create  OR ALTER VIEW MathbookaccessByLocality as
select counts,LOCALITY from bookaccess

SELECT * FROM MathbookaccessByLocality


------------------------------Query 6-----------------------------------------
----------------------------childrens  not gone to school becuase of work  based on Ethinicty -----------------------------


Create  OR ALTER VIEW PaidWorkChildren as 
select count([PaidWork]) as PaidWorkChildrens_Count,y.[ETHNICITY]  from [childIndex]  as y ,[recordedIssues] as s  
where [PaidWork]= 'yes'	and y.[UNIQUEID] = s.[UNIQUEID]
group by [ETHNICITY]


select * from PaidWorkChildren



--------------------Query 7----------------------------------

--------------Stored Procedure for FeeException---------------------------------------------------
CREATE OR ALTER PROCEDURE FeeExcpetions @EthinicMinority nvarchar(30), @RemoteArea nvarchar(10)
AS
SELECT COUNT(O.[UNIQUEID]) as Counts,L.[PROVINCE] FROM [feeException] AS O  ,[childIndex] as L WHERE 
O.EthinicMinority = @EthinicMinority AND O.RemoteArea  = @RemoteArea AND O.[UNIQUEID] = L.[UNIQUEID]
group by [PROVINCE]

EXEC FeeExcpetions @EthinicMinority = 'Yes', @RemoteArea = 'Yes';

