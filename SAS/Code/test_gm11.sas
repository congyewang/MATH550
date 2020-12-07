DATA W1;
SET CW.violence (KEEP = Month Score_given_to_incident);
/*i = 1;*/
PROC SQL;
	CREATE TABLE t1 AS
	SELECT Month AS t, SUM(Score_given_to_incident) as xt
	FROM W1
	GROUP BY Month;
QUIT;
DATA a1;
SET t1;
yt+xt;/*生成一阶纍加序列*/
index = 1;
zt = -(yt+lag(yt));
proc print;
run;
Proc IML;
use a1;
read all var{zt index} into B where(zt^=.);
read all var{xt} into yn where(zt^=.);
ahat=inv(B`*B)*B`*yn;
ahatt=ahat`;
na={a u};
create a2 from ahatt [colname=na];
append from ahatt;
data a3;
set a2;
index=1;
data a4;
set a1;
if _n_ = 1;
xt0=xt;
keep xt0 index;
data a5;
merge a1 a3 a4;
by index;
if _n_ =1 then xp=xt;
else do
yt1=(xt0-u/a)*exp(-a*(t-1))+u/a;
yt0=(xt0-u/a)*exp(-a*(t-2))+u/a;
xp=yt1-yt0;
end;
error=xp-xt;
rerror= error/xt*100;
drop yt index zt yt1 yt0 xt0;
proc print data=a5;
run;
