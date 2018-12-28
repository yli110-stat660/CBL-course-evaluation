libname cbl 'D:\Dropbox\CBL course\CBL-course-evaluation';
libname pre_cbl xlsx 'D:\Dropbox\CBL course\CBL-course-evaluation\pre-CBL performance.xlsx';

data cbl.pre_cbl_performance;
    set pre_cbl.sheet1;
run;
proc print;
run;

proc means data = cbl.pre_cbl_performance maxdec=2;
    var score;
    class class;
run;

proc boxplot data = cbl.pre_cbl_performance;
    plot score*class;
run;

proc anova data = cbl.pre_cbl_performance;
    class class;
    model score = class;
    means class/lsd;
    means class/tukey;
run;






libname af_cbl xlsx 'D:\Dropbox\CBL course\CBL-course-evaluation\after-CBL performance.xlsx';

data cbl.after_cbl_performance;
    set af_cbl.sheet1;
run;
proc print;
run;

proc means data = cbl.after_cbl_performance maxdec=2;
    var score;
    class treatment;
run;

proc boxplot data = cbl.after_cbl_performance;
    plot score*treatment;
run;

proc ttest data = cbl.after_cbl_performance;
    class treatment;
    var score;
run;

proc anova data = cbl.after_cbl_performance;
    class treatment;
    model score = treatment;
run;
quit;
