***ID
clear
import excel "P:\Entfernungen\aktualisiert\2014\GV_2014_LB.xls", sheet("Onlineprodukt_Gemeinden_311214") firstrow clear
drop insgesamt F 
label variable Lngengrad ""
rename Lngengrad Laengengrad
label variable Breitengrad "" 
gen ID=Land+RB+Kreis+VB+Gem 
drop Land RB Kreis VB Gem
drop if Laengengrad==""
drop if Laengengrad==" " 
drop if Breitengrad==""
destring Laengengrad Breitengrad, generate(Laengengrad2 Breitengrad2) dpcomma

drop Laengengrad Breitengrad
rename Laengengrad2 Laengengrad
rename Breitengrad2 Breitengrad

save "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta", replace

clear
use P:\Entfernungen\aktualisiert\2014\01Lang.dta 

merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 

drop if _merge==2 

drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\01Koordinaten.dta", replace

***reg 
clear
import excel "P:\Entfernungen\aktualisiert\2014\GV_2014_LB.xls", sheet("Onlineprodukt_Gemeinden_311214") firstrow clear
drop insgesamt F 
label variable Lngengrad ""
rename Lngengrad Laengengrad
label variable Breitengrad "" 
gen reg=Land+RB+Kreis+VB+Gem 
drop Land RB Kreis VB Gem
drop if Laengengrad==""
drop if Laengengrad==" " 
drop if Breitengrad==""
destring Laengengrad Breitengrad, generate(Laengengrad2 Breitengrad2) dpcomma

drop Laengengrad Breitengrad
rename Laengengrad2 Laengengradreg
rename Breitengrad2 Breitengradreg

save "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta", replace 

clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\01Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\01Koordinaten.dta", replace 







*******02
***ID
clear
use P:\Entfernungen\aktualisiert\2014\02Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\02Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\02Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\02Koordinaten.dta", replace




*****03 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\03Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\03Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\03Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\03Koordinaten.dta", replace


*****04 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\04Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\04Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\04Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\04Koordinaten.dta", replace

*****05 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\05Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\05Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\05Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\05Koordinaten.dta", replace


*****06 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\06Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\06Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\06Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\06Koordinaten.dta", replace




*****07 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\07Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\07Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\07Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\07Koordinaten.dta", replace






*****08 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\08Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\08Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\08Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\08Koordinaten.dta", replace




*****09 
***ID
clear
use P:\Entfernungen\aktualisiert\2014\09Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\09Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\09Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\09Koordinaten.dta", replace



*****10
***ID
clear
use P:\Entfernungen\aktualisiert\2014\10Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\10Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\10Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\10Koordinaten.dta", replace






*****11
***ID
clear
use P:\Entfernungen\aktualisiert\2014\11Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\11Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\11Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\11Koordinaten.dta", replace



*****12
***ID
clear
use P:\Entfernungen\aktualisiert\2014\12Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\12Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\12Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\12Koordinaten.dta", replace 





*****13
***ID
clear
use P:\Entfernungen\aktualisiert\2014\13Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\13Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\13Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\13Koordinaten.dta", replace 




*****14
***ID
clear
use P:\Entfernungen\aktualisiert\2014\14Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\14Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\14Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\14Koordinaten.dta", replace





*****15
***ID
clear
use P:\Entfernungen\aktualisiert\2014\15Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\15Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\15Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\15Koordinaten.dta", replace 





*****16
***ID
clear
use P:\Entfernungen\aktualisiert\2014\16Lang.dta 
merge m:1 ID using "P:\Entfernungen\aktualisiert\2014\Koordinaten\ID_Koordinaten.dta" 
drop if _merge==2 
drop A Land RB Kreis VB Gem _merge 
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\16Koordinaten.dta", replace

***reg 
clear 
use "P:\Entfernungen\aktualisiert\2014\Koordinaten\16Koordinaten.dta" 
merge m:1 reg using "P:\Entfernungen\aktualisiert\2014\Koordinaten\reg_Koordinaten.dta" 
drop if _merge==1 
drop _merge
rename Laengengrad Laenge
rename Breitengrad Breite
rename Laengengradreg Laengereg
rename Breitengradreg Breitereg


gen e= acos(sin(Breite/180*3.141592653589793)*sin(Breitereg/180*3.141592653589793) + cos(Breite/180*3.141592653589793)*cos(Breitereg/180*3.141592653589793)*cos((Laengereg/180*3.141592653589793)-(Laenge/180*3.141592653589793)))
gen Entfernung= e *6378.137 

replace Entfernung=0 if Breite==Breitereg & Laenge==Laengereg
sort ID reg
save "P:\Entfernungen\aktualisiert\2014\Koordinaten\16Koordinaten.dta", replace
