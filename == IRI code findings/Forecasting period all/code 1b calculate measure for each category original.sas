﻿*
this macro rank the models with respect to various measures ;
 
* first we input the library where the results data are stored ;
 

%macro all_initial (category) ;
	data all ;
		set rank_all.model_&model._&category._result ;
	run ;
%mend ;

%macro all_others (category);
	data all ;
		set all rank_all.model_&model._&category._result ;
	run ;
%mend ;

/* %let model=adl ; */
%all_initial (beer) ;

%all_others (	carbbev	) ;
*%all_others (	Paptowl) ;
%all_others (	blades	) ;
%all_others (	cigets	) ;
%all_others (	coffee	) ;
%all_others (	coldcer	) ;
%all_others (	deod	) ;
*%all_others (	diapers	) ;
%all_others (	factiss	) ;
%all_others (	fzdinent	) ;
%all_others (	fzpizza	) ;
%all_others (	hhclean	) ;
%all_others (	hotdog	) ;
%all_others (	laundet	) ;
%all_others (	margbutr	) ;
%all_others (	mayo	) ;
%all_others (	milk	) ;
%all_others (	mustketc	) ;
%all_others (	peanbutr	) ;
%all_others (	photo	) ;
* %all_others (	razors	) ; * too few SKUs so eliminated ;
%all_others (	saltsnck	) ;
%all_others (	shamp	) ;
%all_others (	soup	) ;
%all_others (	spagsauc	) ;
%all_others (	sugarsub	) ;
%all_others (	toitisu	) ;
%all_others (	toothbr	) ;
%all_others (	toothpa	) ;
%all_others (	yogurt	) ;

data &destinated1 (rename = (&measure = &measure._&model )) ;
	set all ;
	 ;
	drop model ;
run ;
proc sort data= &destinated1 ;
	by category ;
run ;
