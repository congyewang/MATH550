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
