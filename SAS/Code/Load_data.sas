DATA CW.violence;
LIBNAME CW 'D:\RemoteFiles\CW\Data';
INFILE 'D:\RemoteFiles\CW\Data\violence.dat';
INPUT Incident_number Month Category_of_incident Score_given_to_incident ID_of_perpetrator Sex_of_perpetrator $ Each_attack_of_perpetrator Last_attack_of_perpetrator ID_of_victim Sex_of_victim $ Each_attack_on_victim Last_attack_on_victim Victim_grade $ CRStaff;
PROC PRINT DATA=CW.violence;
RUN;
