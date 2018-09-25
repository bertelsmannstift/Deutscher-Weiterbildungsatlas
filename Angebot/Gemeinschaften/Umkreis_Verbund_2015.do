
clear

use "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 

tostring krs14, gen(krs11reg)
gen Null="0"
replace krs11reg= Null+krs11reg if krs14<10000
replace NR =0 if NR==.
sort krs11reg
keep krs11reg NR

save "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta", replace

***01

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\01Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_01.dta", replace 


***02

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\02Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_02.dta", replace 


***03

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\03Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_03.dta", replace 


***04

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\04Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_04.dta", replace 


***05

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\05Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_05.dta", replace 

***06

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\06Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_06.dta", replace 


***07

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\07Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_07.dta", replace 



***08

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\08Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_08.dta", replace 



***09

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\09Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_09.dta", replace 



***10

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\10Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_10.dta", replace 



***11

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\11Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_11.dta", replace 




***12

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\12Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_12.dta", replace 



***13

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\13Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_13.dta", replace 


***14

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\14Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_14.dta", replace 




***15

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\15Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_15.dta", replace 







***16

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\16Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= NR/N
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_16.dta", replace 













*******************Umkreisdaten/Bevölkerungspotential 



***01

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\01Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_01.dta", replace 

 

***02

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\02Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_02.dta", replace
 
 
***03

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\03Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_03.dta", replace 
 
 
***04

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\04Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_04.dta", replace 
 
 
***05

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\05Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_05.dta", replace 
 

***06

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\06Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_06.dta", replace 
 
 
 
 ***07

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\07Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_07.dta", replace
 
 
 
 
***08

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\08Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_08.dta", replace 
 
 
 
***09

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\09Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_09.dta", replace 
 
 
 
 
***10

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\10Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_10.dta", replace 
 
 
 
***11

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\11Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_11.dta", replace 
 
 
***12

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\12Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_12.dta", replace 


***13

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\13Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_13.dta", replace


***14

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\14Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_14.dta", replace




***15

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\15Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_15.dta", replace



***16

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\16Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\Verbund\2015.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (NR/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
rename _merge _merge1
merge m:1 krs11 using "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta" 
drop if _merge==2
gen Angebot=AngebotUK/Nkrs 
sort krs11 ID
by krs11: keep if _n==1
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_16.dta", replace



 
 
clear
use "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_01.dta" 
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_02.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_03.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_04.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_05.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_06.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_07.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_08.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_09.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_10.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_11.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_12.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_13.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_14.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_15.dta"
append using "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP_16.dta"

keep krs11 Angebot
save "P:\Entfernungen\aktualisiert\2015\Verbund\Verbund_UK_BP.dta", replace 










































