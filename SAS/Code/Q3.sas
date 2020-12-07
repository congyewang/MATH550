PROC PRINT DATA=CW.violence;
RUN;
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
