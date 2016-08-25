﻿* Encoding: UTF-8.

* using employe  data.sav.
* tests of customstylefunctions.sigspread.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=educ gender DISPLAY=DEFAULT
  /TABLE educ [C][COUNT F40.0, COLPCT.COUNT PCT40.1] BY gender [C]
  /SLABELS POSITION=ROW
  /CATEGORIES VARIABLES=educ gender ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
    MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

SPSSINC MODIFY TABLES subtype="customtable"
SELECT="<<ALL>>" 
DIMENSION= COLUMNS LEVEL = -1  SIGLEVELS=BOTH 
PROCESS = PRECEDING 
/STYLES  APPLYTO=DATACELLS 
CUSTOMFUNCTION="customstylefunctions.spreadsig".



* Custom Tables.
CTABLES
  /VLABELS VARIABLES=educ minority DISPLAY=DEFAULT
  /TABLE educ [COLPCT.COUNT PCT40.1] BY minority
  /CATEGORIES VARIABLES=educ minority ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=minority educ jobcat DISPLAY=DEFAULT
  /TABLE minority > educ [COUNT F40.0] BY jobcat
  /CATEGORIES VARIABLES=minority educ jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=jobcat educ DISPLAY=DEFAULT
  /TABLE jobcat [COUNT F40.0] BY educ
  /CATEGORIES VARIABLES=jobcat educ ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=jobcat DISPLAY=NONE  /VLABELS VARIABLES=educ minority DISPLAY=DEFAULT
  /TABLE jobcat [COUNT F40.0] BY educ + minority
  /CATEGORIES VARIABLES=jobcat educ minority ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES 
    POSITION=BEFORE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

SPSSINC MODIFY TABLES subtype="customtable"
SELECT="<<ALL>>" 
DIMENSION= COLUMNS LEVEL = -1  SIGLEVELS=BOTH 
PROCESS = PRECEDING 
/STYLES  APPLYTO=DATACELLS 
CUSTOMFUNCTION="customstylefunctions.spreadsig".

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=educ salary jobcat DISPLAY=DEFAULT
  /TABLE educ [C] > salary [S][MEAN, TABLEPCT.COUNT.LCL PCT40.1, TABLEPCT.COUNT.UCL PCT40.1] BY 
    jobcat [C]
  /CATEGORIES VARIABLES=educ [8, 12, 14, 15, 16, SUBTOTAL, 17, 18, 19, 20, 21, OTHERNM] 
    EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=MEAN ALPHA=.05 ADJUST=NONE ORIGIN=COLUMN INCLUDEMRSETS=YES CATEGORIES=SUBTOTALS 
    MEANSVARIANCE=ALLCATS MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

CTABLES
  /VLABELS VARIABLES=educ salary jobcat DISPLAY=DEFAULT
  /TABLE educ [C] > salary [S][MEAN, TABLEPCT.COUNT.LCL PCT40.1, TABLEPCT.COUNT.UCL PCT40.1] BY 
    jobcat [C]
  /CATEGORIES VARIABLES=educ [8, 12, 14, 15, 16, SUBTOTAL, 17, 18, 19, 20, 21, OTHERNM] 
    EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=MEAN ALPHA=.05 ADJUST=NONE ORIGIN=COLUMN INCLUDEMRSETS=YES 
    MEANSVARIANCE=ALLCATS MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=educ jobcat DISPLAY=DEFAULT
  /TABLE educ BY jobcat [COUNT F40.0]
  /SLABELS VISIBLE=NO
  /CATEGORIES VARIABLES=educ jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* does not work.
CTABLES
  /VLABELS VARIABLES=educ jobcat DISPLAY=DEFAULT
  /TABLE educ [C] BY jobcat [C][COUNT F40.0]
  /SLABELS POSITION=ROW VISIBLE=no
  /CATEGORIES VARIABLES=educ jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=educ jobcat DISPLAY=DEFAULT
  /TABLE educ BY jobcat [COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=educ jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=gender educ jobcat DISPLAY=DEFAULT
  /TABLE gender [C] > educ [C] BY jobcat [C][COUNT F40.0]
  /CATEGORIES VARIABLES=gender educ jobcat ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MERGE=YES STYLE=SIMPLE SHOWSIG=NO.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=salary jobcat gender educ DISPLAY=DEFAULT
  /TABLE salary [S][MEAN, MEAN.LCL, MEAN.UCL, MEDIAN] > jobcat [C] > gender [C] BY educ [C]
  /CATEGORIES VARIABLES=jobcat gender educ ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=MEAN ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MEANSVARIANCE=ALLCATS MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* V24.0.0.0 hangs on this syntax.
CTABLES
  /VLABELS VARIABLES=salary jobcat gender educ DISPLAY=DEFAULT
  /TABLE salary [S][MEAN, MEAN.LCL, MEAN.UCL, MEDIAN] > jobcat [C] > gender [C] BY educ [C]
  /SLABELS POSITION=ROW
  /CATEGORIES VARIABLES=jobcat gender educ ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=MEAN ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MEANSVARIANCE=ALLCATS MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

*v24.0.0.0 hang.
CTABLES
  /VLABELS VARIABLES=jobcat salary DISPLAY=DEFAULT
  /TABLE jobcat [C] > salary [S][MEAN.LCL, MEAN, MEDIAN.UCL, SEMEAN] BY jobcat [C]
  /SLABELS POSITION=ROW
  /CATEGORIES VARIABLES=jobcat [1, 2, SUBTOTAL, 3, OTHERNM] EMPTY=INCLUDE POSITION=AFTER
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=MEAN ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=ALLVISIBLE MEANSVARIANCE=ALLCATS MERGE=YES STYLE=SIMPLE SHOWSIG=NO.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=gender jobcat minority DISPLAY=DEFAULT
  /TABLE gender [C] > jobcat [C][COUNT.LCL F40.0, COUNT F40.0, COUNT.UCL F40.0] BY minority [C]
  /CATEGORIES VARIABLES=gender ['f', 'm', SUBTOTAL, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=jobcat minority ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE
  /CRITERIA CILEVEL=95
  /COMPARETEST TYPE=PROP ALPHA=0.05 ADJUST=BONFERRONI ORIGIN=COLUMN INCLUDEMRSETS=YES 
    CATEGORIES=SUBTOTALS MERGE=YES STYLE=SIMPLE SHOWSIG=NO.