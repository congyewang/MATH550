DATA CW.Q6_Severity;
SET CW.violence (KEEP=Category_of_incident Score_given_to_incident Each_attack_of_perpetrator CRStaff);
/*severity of the attacks*/
PROC REG DATA=CW.Q6_Severity;
MODEL Score_given_to_incident = CRStaff/R CLM;
OUTPUT OUT=bclassg_Severity p=pred_Severity;
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
PROC GPLOT DATA=bclassg_Number;
PLOT Each_attack_of_perpetrator*CRStaff pred_Number*CRStaff/OVERLAY;
SYMBOL1 V=dot C=red I=none;
SYMBOL2 V=none C=blue I=spline;
RUN;
