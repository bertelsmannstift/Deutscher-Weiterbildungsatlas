clear
import excel "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand_2015.xls", sheet("Onlineprodukt_Gemeinden_311215") firstrow

rename insgesamt BV
keep if BV!=.
drop if Gem==""
drop if Gem==" "

gen reg= Land+RB+Kreis+VB+Gem
drop Land RB Kreis VB Gem G

save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta"

******01
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\01Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP01.dta"
clear


******02
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\02Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP02.dta" 

******03
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\03Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP03.dta"


******04
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\04Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP04.dta"

******05
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\05Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP05.dta"

******06
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\06Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP06.dta"

******07
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\07Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP07.dta"

*****08
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\08Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP08.dta"


******09
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\09Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP09.dta"

******10
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\10Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP10.dta"

******11
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\11Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP11.dta"

*****12
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\12Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP12.dta"


******13
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\13Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP13.dta"


******14
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\14Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP14.dta"


******15
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\15Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP15.dta"


******16
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\16Koordinaten.dta"
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\Bevoelkerungsstand.dta" 
drop if _merge==2
sort ID reg
gen Gew=exp(-0.0505679* Entfernung)
gen GewBV=BV*Gew
by ID: egen BP= total(GewBV)
by ID: keep if _n==1
drop reg BL Laenge Breite Laengereg Breitereg e Entfernung BV _merge Gew GewBV 
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP16.dta"






clear
use "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP01.dta" 
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP02.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP03.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP04.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP05.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP06.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP07.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP08.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP09.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP10.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP11.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP12.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP13.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP14.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP15.dta"
append using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP16.dta" 
rename ID reg
save "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta", replace 





























































