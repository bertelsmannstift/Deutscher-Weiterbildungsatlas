
clear
use P:\Entfernungen\Koordinaten\01KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_01.dta", replace




clear
use P:\Entfernungen\Koordinaten\02KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_02.dta", replace





clear
use P:\Entfernungen\Koordinaten\03KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_03.dta", replace






clear
use P:\Entfernungen\Koordinaten\04KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_04.dta", replace





clear
use P:\Entfernungen\Koordinaten\05KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_05.dta", replace







clear
use P:\Entfernungen\Koordinaten\06KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_06.dta", replace







clear
use P:\Entfernungen\Koordinaten\07KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_07.dta", replace



clear
use P:\Entfernungen\Koordinaten\08KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_08.dta", replace





clear
use P:\Entfernungen\Koordinaten\09KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_09.dta", replace




clear
use P:\Entfernungen\Koordinaten\10KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_10.dta", replace






clear
use P:\Entfernungen\Koordinaten\11KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_11.dta", replace






clear
use P:\Entfernungen\Koordinaten\12KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_12.dta", replace







clear
use P:\Entfernungen\Koordinaten\13KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_13.dta", replace






clear
use P:\Entfernungen\Koordinaten\14KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_14.dta", replace






clear
use P:\Entfernungen\Koordinaten\15KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_15.dta", replace







clear
use P:\Entfernungen\Koordinaten\16KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt.dta" 
drop if _merge==1
rename _merge _merge3
merge m:1 reg using "P:\Entfernungen\Entfernungen\Bevoelkerungspotential\2013\BP.dta" 
drop if _merge==2
gen AngebotGe= (Angebot/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen AngebotB=AngebotUK/Nkrs
sort ID IDreg
sort krs11
by krs11: keep if _n==1
keep krs11 AngebotB
save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_16.dta", replace


clear

use "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_01.dta"

append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_02.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_03.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_04.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_05.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_06.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_07.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_08.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_09.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_10.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_11.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_12.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_13.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_14.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_15.dta"
append using "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP_16.dta"


save "P:\Entfernungen\aktualisiert\2013\Marktförmig\markt_UK_BP.dta"
