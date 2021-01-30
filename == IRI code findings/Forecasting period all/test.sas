﻿options nonotes nosource ;
*calculating AvgRelMAE ;



 %let number_of_sku=127 ;
/*%let number_of_sku=127 ;

%let benchmark=base ;
%let model=adl ;
%let horizon=4 ;
%let roll=1 ;

%let limit_horizon= %str(if horizon>&horizon then delete ; ) ; * this include the forecast horizons from 1 to 12 ;
%global limit_horizon ;
%put &limit_horizon ;

*/
%macro shw(benchmark, model, horizon) ;

	%macro run1 ;
		 
		%do i= 1 %to 2 ;
			%let roll= &i ;
			%include "Q:\= IRI data research\== IRI code findings\Forecasting period all\code 3.1 calculate AvgRelMAE.sas" ;

		%end ;
	%mend ;

	%run1 ;

 
data rank_2.Armae_&model._vs_&benchmark._h&horizon ;
	set Armae_&model._vs_&benchmark._h&horizon._r1 ;
run ;

proc delete data= Armae_&model._vs_&benchmark._h&horizon._r1 ; run ;

	%macro concatenate1 ;
		%do i= 2 %to 2 ;
			data rank_2.Armae_&model._vs_&benchmark._h&horizon ;
				set rank_2.Armae_&model._vs_&benchmark._h&horizon
					Armae_&model._vs_&benchmark._h&horizon._r&i ;
			run ;
			proc delete data= Armae_&model._vs_&benchmark._h&horizon._r&i ; run ;
		%end ;
	%mend ;

	%concatenate1 ; 
%mend; 




 
 %let horizon1=12 ;
%let limit_horizon= %str(if horizon>&horizon1 then delete ; ) ; * this include the forecast horizons from 1 to 12 ;
%global limit_horizon ;


%shw(	base	,	own	,	&horizon1) ;
 

 
 %let horizon1=4 ;
%let limit_horizon= %str(if horizon>&horizon1 then delete ; ) ; * this include the forecast horizons from 1 to 12 ;
%global limit_horizon ;


%shw(	base	,	own	,	&horizon1) ;
 

 
