
clear
use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Methoden\Daten\VHS\VHS - Statistik\VHS_2015\SUF_2015_interne_Forschung_1991-2017-mit VHSNR_gekürzt.DTA" 

keep if berichtsjahr==2015

keep vhsnr knr kso uso ksa usa kss uss 

gen knr1=substr(knr,1,2)
gen knr2=substr(knr,4,6)
gen krs11reg=knr1+knr2 
keep vhsnr krs11reg kso uso ksa usa kss uss 

save "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015.dta", replace  

clear
use "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015.dta" 

keep vhsnr krs11reg kso 

save "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta", replace  

***Gebietsstand Kreise 2014
clear
import excel "P:\Entfernungen\aktualisiert\2015\VHS\Kreise.xlsx", sheet("12411-01-01-4") firstrow
drop if Insgesamt=="-"
keep if strlen(krs11reg)==5 | krs11reg=="02" | krs11reg=="11" 
replace krs11reg="11000" if krs11reg=="11"
replace krs11reg="02000" if krs11reg=="02" 
rename Insgesamt BV

save "P:\Entfernungen\aktualisiert\2015\VHS\Kreise.dta", replace 




***VHS_KSO_BV

clear
use "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\Kreise.dta"

drop if vhsnr==8199

replace kso=1066.714 if krs11reg=="03152"
replace kso=308.2858 if krs11reg=="03156"

replace kso=268.3823 if krs11reg=="03354"
replace kso=498.6177 if krs11reg=="03360" 

replace kso=477.2746 if krs11reg=="03455"
replace kso=278.7254 if krs11reg=="03462" 

replace kso=749.6847 if krs11reg=="05122"
replace kso=1653.315 if krs11reg=="05124" 

replace kso=1144.189 if krs11reg=="06611"
replace kso=1362.811 if krs11reg=="06633"

replace kso=366.8068 if krs11reg=="09262"
replace kso=1366.193 if krs11reg=="09275" 

replace kso=527.9099 if krs11reg=="09463"
replace kso=1108.09 if krs11reg=="09473" 

replace kso=0 if krs11reg=="12065" 

sort krs11reg 

by krs11reg: egen AngebotKSO= total(kso) 
by krs11reg: keep if _n==1 

drop vhsnr 
drop kso 
drop _merge 

destring BV, replace

gen AngebotKSO_BV=AngebotKSO/BV

save "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso_BV.dta",  replace 

drop B BV AngebotKSO_BV

save "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta",  replace 






clear
import excel "P:\Entfernungen\aktualisiert\2015\Nr.xls", sheet("Onlineprodukt_Gemeinden_311215") firstrow

drop if Gem=="" 

gen ID=Land+RB+Kreis+VB+Gem

gen Kreis1= Land+RB+Kreis 
drop Land RB Kreis VB Gem F
sort Kreis1 ID 
by Kreis1: gen N=_N 
by Kreis1: keep if _n==1 
drop ID
drop if Kreis1=="07000"	
drop if Kreis1=="13000" 
rename N Nkrs
rename Kreis1 krs11

save "P:\Entfernungen\aktualisiert\2015\VHS\Kreis_N.dta",  replace 


***01


clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\01Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_01.dta", replace 

***02

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\02Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_02.dta", replace 


***03

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\03Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_03.dta", replace 







***04

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\04Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_04.dta", replace 






***05

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\05Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_05.dta", replace 







***06

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\06Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_06.dta", replace 





***07


clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\07Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_07.dta", replace 



***08

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\08Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_08.dta", replace 


***09

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\09Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_09.dta", replace 



***10

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\10Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_10.dta", replace 




***11
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\11Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_11.dta", replace 




***12
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\12Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_12.dta", replace 



***13
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\13Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_13.dta", replace 


***14
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\14Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_14.dta", replace 


***15

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\15Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_15.dta", replace 


***16
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\16Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999"
gen AngebotKSOGe= AngebotKSO/N
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
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_16.dta", replace 



clear
use "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_01.dta" 

append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_02.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_03.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_04.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_05.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_06.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_07.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_08.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_09.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_10.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_11.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_12.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_13.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_14.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_15.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK_16.dta"

keep krs11 Angebot
save "P:\Entfernungen\aktualisiert\2015\VHS\kso_UK.dta", replace






*******************Umkreisdaten/Bevölkerungspotential 



***01

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\01Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_01.dta", replace 

***02
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\02Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_02.dta", replace 



***03

clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\03Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_03.dta", replace 







***04
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\04Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_04.dta", replace 
 




***05
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\05Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_05.dta", replace



***06
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\06Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_06.dta", replace
 





***07
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\07Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_07.dta", replace





***08
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\08Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_08.dta", replace



***09
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\09Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_09.dta", replace
 



***10
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\10Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_10.dta", replace
 




***11
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\11Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_11.dta", replace 




***12
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\12Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_12.dta", replace 



***13
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\13Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_13.dta", replace


***14
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\14Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_14.dta", replace 


***15
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\15Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_15.dta", replace
 


***16
clear
use "P:\Entfernungen\aktualisiert\2015\Koordinaten\16Koordinaten.dta"
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= substr(reg,1,5)
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015kso.dta" 
drop if reg=="070009999999" 
rename _merge _merge2
merge m:1 reg using "P:\Entfernungen\aktualisiert\2015\Bevoelkerungspotential\BP.dta" 
drop if reg=="070009999999" 
drop if reg=="130009999999"
gen AngebotKSOGe= (AngebotKSO/N)/BP
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
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_16.dta", replace 




clear
use "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_01.dta" 
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_02.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_03.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_04.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_05.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_06.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_07.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_08.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_09.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_10.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_11.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_12.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_13.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_14.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_15.dta"
append using "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP_16.dta" 

keep krs11 Angebot
save "P:\Entfernungen\aktualisiert\2015\VHS\BP\kso_UK_BP.dta", replace 



***KSO/USO/KSA/USA/KSS/USS_Bevölkerung 2014 


***kso uso ksa usa kss uss   

clear
use using "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015.dta" 
 
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2015\VHS\Kreise.dta"

drop if vhsnr==8199
replace krs11reg="03156" if vhsnr==3048
destring BV, replace

set more off

foreach x in kso uso ksa usa kss uss {

gen `x'2=`x' if krs11reg=="03152" 
replace `x'2=`x' if krs11reg=="03156"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="03152" 
replace BV2=BV if krs11reg=="03156" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="03152" | krs11reg=="03156"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4 

gen `x'2=`x' if krs11reg=="03354" 
replace `x'2=`x' if krs11reg=="03360"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="03354" 
replace BV2=BV if krs11reg=="03360" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="03354" | krs11reg=="03360"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4 

gen `x'2=`x' if krs11reg=="03455" 
replace `x'2=`x' if krs11reg=="03462"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="03455" 
replace BV2=BV if krs11reg=="03462" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="03455" | krs11reg=="03462"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4

gen `x'2=`x' if krs11reg=="05122" 
replace `x'2=`x' if krs11reg=="05124"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="05122" 
replace BV2=BV if krs11reg=="05124" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="05122" | krs11reg=="05124"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4

gen `x'2=uso if krs11reg=="06611" 
replace `x'2=`x' if krs11reg=="06633"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="06611" 
replace BV2=BV if krs11reg=="06633" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="06611" | krs11reg=="06633"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4

gen `x'2=`x' if krs11reg=="09262" 
replace `x'2=`x' if krs11reg=="09275"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="09262" 
replace BV2=BV if krs11reg=="09275" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="09262" | krs11reg=="09275"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4

gen `x'2=`x' if krs11reg=="09463" 
replace `x'2=`x' if krs11reg=="09473"
egen `x'3= total(`x'2) 
gen BV2=BV if krs11reg=="09463" 
replace BV2=BV if krs11reg=="09473" 
egen BV3= total(BV2)
gen BV4= BV2/BV3 
gen `x'4 =`x'3*BV4 
replace `x'=`x'4 if krs11reg=="09463" | krs11reg=="09473"
drop `x'2 `x'3 BV2 BV3 BV4 `x'4
 
replace `x'=0 if krs11reg=="12065" 

sort krs11reg 

}



by krs11reg: egen AngebotKSO= total(kso) 
by krs11reg: egen AngebotUSO= total(uso)
by krs11reg: egen AngebotKSA= total(ksa)
by krs11reg: egen AngebotUSA= total(usa)
by krs11reg: egen AngebotKSS= total(kss)
by krs11reg: egen AngebotUSS= total(uss)

by krs11reg: keep if _n==1

gen AngebotKSO_BV= AngebotKSO/BV 
gen AngebotUSO_BV= AngebotUSO/BV 
gen AngebotKSA_BV= AngebotKSA/BV
gen AngebotUSA_BV= AngebotUSA/BV
gen AngebotKSS_BV= AngebotKSS/BV
gen AngebotUSS_BV= AngebotUSS/BV







drop vhsnr kso  _merge uso ksa usa kss uss

save "P:\Entfernungen\aktualisiert\2015\VHS\VHS2015ks_us_BV.dta",  replace
