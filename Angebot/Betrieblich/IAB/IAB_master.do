
***Masterdatei des Projektes "Deutscher Weiterbildungsatlas" fdz 1492 
***Nutzer A.Martin
clear
set more off
set linesize 120
 

do "$prog\2013_Datenaufbereitung3.do" , nostop  // Aufbereitung fuer 2013
do "$prog\2013_Deskription3.do" , nostop        // Deskription fuer 2013
do "$prog\2013_Analyse3.do"  , nostop           // Ananalyse fuer 2013
do "$prog\2014_Datenaufbereitung3.do" , nostop  // Aufbereitung fuer 2014
do "$prog\2014_Deskription3.do" , nostop        // Deskription fuer 2014
do "$prog\2014_Analyse3.do"  , nostop           // Ananalyse fuer 2014

capture log close
log using "$log\Dateiliste.log", replace
dir $prog\
dir $log\
dir $data\ 
dir $orig\
dir $doc\

log close


