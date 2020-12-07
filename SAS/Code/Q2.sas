DM 'log; clear;  odsresult;clear;  output; clear;';
DATA W2;
SET CW.violence (KEEP = Month Category_of_incident);
PROC SQL;
	CREATE TABLE CW.Q2 AS
	SELECT Month, Category_of_incident, COUNT(Month) AS C
	FROM W2
	GROUP BY Month, Category_of_incident
	ORDER BY Month, Category_of_incident;
QUIT;
PROC SQL;
	CREATE TABLE CW.Q2_1 AS
	SELECT Month, Category_of_incident, C, SUM(C) AS Month_C, C / SUM(C) AS Category_RATE
	FROM CW.Q2
	GROUP BY Month
	ORDER BY Month, Category_of_incident;
QUIT;
DATA CW.Q2_0;
INPUT Month Category_of_incident C Month_C Category_RATE;
CARDS;
1 2 0 0 0.0
2 3 0 0 0.0
2 4 0 0 0.0
3 1 0 0 0.0
3 4 0 0 0.0
4 1 0 0 0.0
4 4 0 0 0.0
7 4 0 0 0.0
8 4 0 0 0.0
9 1 0 0 0.0
9 3 0 0 0.0
9 4 0 0 0.0
10 4 0 0 0.0
11 2 0 0 0.0
11 4 0 0 0.0
12 4 0 0 0.0
14 4 0 0 0.0
15 3 0 0 0.0
15 4 0 0 0.0
16 3 0 0 0.0
16 4 0 0 0.0
17 3 0 0 0.0
17 4 0 0 0.0
21 3 0 0 0.0
21 4 0 0 0.0
22 4 0 0 0.0
23 1 0 0 0.0
23 4 0 0 0.0
24 2 0 0 0.0
24 3 0 0 0.0
24 4 0 0 0.0
25 3 0 0 0.0
25 4 0 0 0.0
26 3 0 0 0.0
26 4 0 0 0.0
27 3 0 0 0.0
28 2 0 0 0.0
28 4 0 0 0.0
29 2 0 0 0.0
29 4 0 0 0.0
30 3 0 0 0.0
30 4 0 0 0.0
;
RUN;

/*Part ii Optian (a) verify "the percentage of ¡®near misses¡¯ decreases" */
DATA CW.Q2_2;
SET CW.Q2_0 CW.Q2_1;
RUN;
PROC SORT DATA=CW.Q2_2;
BY MONTH Category_of_incident;
RUN;
PROC SGPLOT DATA=CW.Q2_2;
	SERIES X = Month Y = Category_RATE / GROUP = Category_of_incident;
	TITLE 'The Percentage of Attacks in Each Category';
RUN;
DATA CW.Q2_2_near_miss;
SET CW.Q2_2 (KEEP = Month Category_of_incident Category_RATE);
WHERE  Category_of_incident = 1;
RUN;
PROC SGPLOT DATA=CW.Q2_2_near_miss;
	SERIES X = Month Y = Category_RATE;
	TITLE 'The Percentage of Near Miss';
RUN;

/*Part ii Optian (a) that of ¡®assault¡¯ is consistently
proportional to the number of attacks each month*/
DATA CW.Q2_2_assault;
SET CW.Q2_2 (KEEP = Month Category_of_incident Category_RATE);
WHERE  Category_of_incident = 2;
RUN;
PROC SGPLOT DATA=CW.Q2_2_assault;
	SERIES X = Month Y = Category_RATE;
	TITLE 'The Percentage of Assault';
RUN;
DATA W2_1;
SET CW.violence (KEEP = Month Category_of_incident);
i = 1;
PROC SQL;
	CREATE TABLE W2_Total AS
	SELECT Month, COUNT(i) AS C
	FROM W2_1
	GROUP BY Month
	ORDER BY Month;
QUIT;
PROC SQL;
	CREATE TABLE W2_Assault AS
	SELECT Month, COUNT(i) AS A
	FROM W2_1
	WHERE Category_of_incident = 2
	GROUP BY Month
	ORDER BY Month;
QUIT;
DATA Q2_Merged;
MERGE W2_Total W2_Assault;
BY Month;
RETAIN Assault;
IF A = . THEN Assault = 0;
ELSE Assault = A;
PROC CORR DATA=Q2_Merged ;
VAR C Assault;
RUN;

/*Part ii Optian (b)*/
DATA CW.Q2_3;
SET CW.Q2_1;
WHERE Month > 15;
OPTIONS PS = 30 LS = 66;
PROC GCHART DATA=CW.Q2_3 LPI=5;
PIE Category_of_incident;
TITLE 'Rate of Threatening';
RUN;
