DM 'log; clear;  odsresult;clear;  output; clear;';
/*Load*/
DATA CW.violence;
LIBNAME CW 'D:\RemoteFiles\CW\Data';
INFILE 'D:\RemoteFiles\CW\Data\violence.dat';
INPUT Incident_number Month Category_of_incident Score_given_to_incident ID_of_perpetrator Sex_of_perpetrator $ Each_attack_of_perpetrator Last_attack_of_perpetrator ID_of_victim Sex_of_victim $ Each_attack_on_victim Last_attack_on_victim Victim_grade $ CRStaff;
/*Qn1*/
DATA W1;
SET CW.violence (KEEP = Month Score_given_to_incident);
PROC SQL;
	CREATE TABLE CW.Q1 AS
	SELECT Month, SUM(Score_given_to_incident) as S
	FROM W1
	GROUP BY Month;
QUIT;
PROC ARIMA;
	IDENTIFY VAR=S MINIC SCAN ESACF;
	ESTIMATE P=0 Q=1 PLOT;
QUIT;
/*Qn2*/
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

/*Part ii Optian (a) verify "the percentage of ��near misses�� decreases" */
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

/*Part ii Optian (a) that of ��assault�� is consistently
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
PROC SQL;
	CREATE TABLE W2_Total AS
	SELECT Month, COUNT(Month) AS C
	FROM W2_1
	GROUP BY Month
	ORDER BY Month;
QUIT;
PROC SQL;
	CREATE TABLE W2_Assault AS
	SELECT Month, COUNT(Month) AS A
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
/*Qn3*/
DATA CW.Q3;
	SET CW.violence (KEEP = Category_of_incident Score_given_to_incident Sex_of_perpetrator);
PROC ANOVA DATA=CW.Q3;
	CLASS Sex_of_perpetrator Category_of_incident;
	MODEL Score_given_to_incident=Sex_of_perpetrator Category_of_incident Sex_of_perpetrator*Category_of_incident;
	MEANS Sex_of_perpetrator Category_of_incident Sex_of_perpetrator*Category_of_incident/DUNCAN;
RUN;
PROC SQL;
	CREATE TABLE CW.Q3 AS
	SELECT Sex_of_perpetrator, Category_of_incident, SUM(Each_attack_of_perpetrator) AS Each_SUM
	FROM CW.violence
	GROUP BY Category_of_incident, Sex_of_perpetrator
	ORDER BY Category_of_incident, Sex_of_perpetrator;
QUIT;
PROC PRINT DATA=CW.Q3;
RUN;
PROC GCHART DATA=CW.Q3;
	VBAR Sex_of_perpetrator/SUMVAR=Score_given_to_incident GROUP=Category_of_incident;
	TITLE 'Score Given to Incident by Sex';
RUN;
/*Qn4*/
DATA CW.Q4;
	SET CW.violence (KEEP=Month Victim_grade);
	WHERE Victim_grade = "SN" OR Victim_grade = "CR";
PROC FREQ DATA=CW.Q4;
	TABLES Month * Victim_grade /OUT=W4_FREQ OUTPERCENT;
RUN;
PROC PRINT DATA=W4_FREQ;
RUN;
DATA W4_FREQ_1;
	SET W4_FREQ (KEEP=Month Victim_grade PCT_ROW);
	PCT_ROW = PCT_ROW / 100;
RUN;
DATA W4_FREQ_0;
INPUT Month Victim_grade $ PCT_ROW;
CARDS;
1 CR 0.00000
2 CR 0.00000
3 CR 0.00000
4 CR 0.00000
5 CR 0.00000
6 CR 0.00000
7 CR 0.00000
8 CR 0.00000
9 CR 0.00000
11 CR 0.00000
16 CR 0.00000
17 SN 0.00000
24 SN 0.00000
28 SN 0.00000
29 SN 0.00000
30 SN 0.00000
;
RUN;
DATA CW.Q4_FREQ;
	SET W4_FREQ_1 W4_FREQ_0;
PROC SORT DATA=CW.Q4_FREQ;
	BY Month Victim_grade;
RUN;
PROC SGPLOT DATA=CW.Q4_FREQ;
	SERIES X = Month Y = PCT_ROW/GROUP=Victim_grade;
	TITLE 'Relative Frequencies of Victim Grade';
	YAXIS LABEL='Relative Frequencies (%)';
RUN;
/*Qn5*/
DATA CW.Q5;
    SET CW.violence (KEEP=ID_of_victim);
    ID = PUT(ID_of_victim, 2.);
    DROP ID_of_victim;
RUN;
PROC FREQ DATA=CW.Q5;
    TABLES ID/OUT=CW.Q5_FREQ;
RUN;
PROC GCHART DATA=CW.Q5;
    PIE ID /
    VALUE=NONE
    PERCENT=ARROW
    SLICE=ARROW
    NOHEADING;
    TITLE 'Frequency of Particular Individuals Attacked';
RUN;
QUIT;
/*Qn6*/
DATA CW.Q6_Severity;
SET CW.violence (KEEP=Category_of_incident Score_given_to_incident Each_attack_of_perpetrator CRStaff);
/*severity of the attacks*/
PROC REG DATA=CW.Q6_Severity;
	MODEL Score_given_to_incident = CRStaff/R CLM;
	OUTPUT OUT=bclassg_Severity p=pred_Severity;
RUN;
PROC GPLOT DATA=bclassg_Severity;
	PLOT Score_given_to_incident*CRStaff pred_Severity*CRStaff/OVERLAY;
	SYMBOL1 V=dot C=red I=none;
	SYMBOL2 V=none C=blue I=spline;
RUN;
/*number*/
DATA CW.Q6_Number;
	SET CW.violence (KEEP=Each_attack_of_perpetrator Last_attack_of_perpetrator CRStaff);
	WHERE Last_attack_of_perpetrator = 1;
PROC REG DATA=CW.Q6_Number;
	MODEL Each_attack_of_perpetrator = CRStaff/R CLM;
	OUTPUT OUT=bclassg_Number p=pred_Number;
RUN;
PROC GPLOT DATA=bclassg_Number;
	PLOT Each_attack_of_perpetrator*CRStaff pred_Number*CRStaff/OVERLAY;
	SYMBOL1 V=dot C=red I=none;
	SYMBOL2 V=none C=blue I=spline;
RUN;
QUIT;
