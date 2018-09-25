clear
use "P:\Entfernungen\Koordinaten\01KoordinatenLang.dta"
drop Name
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP01.dta"
clear

use "P:\Entfernungen\Koordinaten\02KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP02.dta"
clear

use "P:\Entfernungen\Koordinaten\03KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP03.dta"
clear


use "P:\Entfernungen\Koordinaten\04KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP04.dta"
clear

use "P:\Entfernungen\Koordinaten\05KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP05.dta"
clear

use "P:\Entfernungen\Koordinaten\06KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP06.dta"
clear


use "P:\Entfernungen\Koordinaten\07KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP07.dta"
clear

use "P:\Entfernungen\Koordinaten\08KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP08.dta"
clear

use "P:\Entfernungen\Koordinaten\09KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP09.dta"
clear


use "P:\Entfernungen\Koordinaten\10KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP10.dta"
clear


use "P:\Entfernungen\Koordinaten\11KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP11.dta"
clear


use "P:\Entfernungen\Koordinaten\12KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP12.dta"
clear


use "P:\Entfernungen\Koordinaten\13KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP13.dta"
clear

use "P:\Entfernungen\Koordinaten\14KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP14.dta"
clear

use "P:\Entfernungen\Koordinaten\15KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP15.dta"
clear

use "P:\Entfernungen\Koordinaten\16KoordinatenLang.dta"
drop Name _merge
keep if Entfernung!=.
gen krsreg=substr( reg,1,5)
gen gemreg=substr(reg,10, 12)
gen krsgemreg= krsreg+gemreg
merge m:1 krsgemreg using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BVST2012.dta" 
drop if _merge==2
sort krsreg
by krsreg: egen BVSTm= mean(BVST2012)
replace BVST2012=BVSTm if _merge==1
gen Gew=exp(-0.0505679* Entfernung)
gen GewBVST=BVST2012*Gew
sort ID reg
by ID: egen BP= total(GewBVST)
by ID: keep if _n==1
drop reg A_ Land RB Kreis GV GM Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge1 e Entfernung krsreg gemreg krsgemreg BVST2012 _merge BVSTm Gew GewBVST 
save "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP16.dta"
clear


clear
use P:\Entfernungen\Koordinaten\01KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP01.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP01.dta", replace



clear
use P:\Entfernungen\Koordinaten\02KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP02.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP02.dta", replace


clear
use P:\Entfernungen\Koordinaten\03KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP03.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP03.dta", replace



clear
use P:\Entfernungen\Koordinaten\04KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP04.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP04.dta", replace


clear
use P:\Entfernungen\Koordinaten\05KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP05.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP05.dta", replace


clear
use P:\Entfernungen\Koordinaten\06KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP06.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP06.dta", replace



clear
use P:\Entfernungen\Koordinaten\07KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP07.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP07.dta", replace


clear
use P:\Entfernungen\Koordinaten\08KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP08.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP08.dta", replace


clear
use P:\Entfernungen\Koordinaten\09KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP09.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP09.dta", replace


clear
use P:\Entfernungen\Koordinaten\10KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP10.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP10.dta", replace

clear
use P:\Entfernungen\Koordinaten\11KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP11.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP11.dta", replace


clear
use P:\Entfernungen\Koordinaten\12KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP12.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP12.dta", replace

clear
use P:\Entfernungen\Koordinaten\13KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP13.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP13.dta", replace

clear
use P:\Entfernungen\Koordinaten\14KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP14.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP14.dta", replace

clear
use P:\Entfernungen\Koordinaten\15KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP15.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP15.dta", replace

clear
use P:\Entfernungen\Koordinaten\16KoordinatenLang.dta 
keep if Entfernung!=.
gen krs11=substr( ID,1,5)
gen krs11reg= Landreg+ RBreg+ Kreisreg
sort ID krs11reg
by ID krs11reg: gen N=_N
rename _merge _merge2
merge m:1 krs11reg using P:/VHS2012kurz.dta
rename _merge _merge3
merge m:1 ID using "P:\Entfernungen\Entfernungen\Bevölkerungspotential\BP16.dta"
gen AngebotKSOGe= (AngebotKSO/N)/BP
gen Gew=exp(-0.0505679* Entfernung)
gen GewAnGe=AngebotKSOGe*Gew
sort krs11
by krs11: egen AngebotUK= total(GewAnGe)
gen IDreg= Landreg+ RBreg + Kreisreg+ GVreg+ GMreg
sort IDreg krs11
by IDreg krs11: gen Nkrs=_N
gen Angebot=AngebotUK/Nkrs
sort ID IDreg
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP16.dta", replace

clear

use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP01.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k01.dta"

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP02.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k02.dta"

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP03.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k03.dta" 


clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP04.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k04.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP05.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k05.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP06.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k06.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP07.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k07.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP08.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k08.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP09.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k09.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP10.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k10.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP11.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k11.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP12.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k12.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP13.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k13.dta" 


clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP14.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k14.dta" 


clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP15.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k15.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP16.dta"
sort krs11
by krs11: keep if _n==1
drop ID reg A_ Land RB Kreis GV GM Name Länge Breite _merge1 Landreg RBreg Kreisreg GVreg GMreg Namereg Längereg Breitereg _merge2 e Entfernung krs11reg N AngebotKSO _merge3 
drop _merge AngebotKSOGe Gew GewAnGe AngebotUK IDreg Nkrs BP
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k16.dta" 

clear
use "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k01.dta"
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k02.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k03.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k04.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k05.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k06.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k07.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k08.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k09.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k10.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k11.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k12.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k13.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k14.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k15.dta" 
append using "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k16.dta" 
save "P:\Entfernungen\Entfernungen\EntfernungenVHS\VHSBP_k.dta"





























