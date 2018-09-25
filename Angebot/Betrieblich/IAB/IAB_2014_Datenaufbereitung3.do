* Programmdatei des Projektes "Deutscher Weiterbildungsatlas" fdz1492 - 2014_Datenaufbereitung3.do
* Inhalt: Datenaufbereitung 
* Aggregationsniveau: Branchen (3-Steller), Bundeslaender

clear



captur log close


log using "$log\2014_Datenaufbereitung3.log", replace

use "$orig\iabbp_2014.dta"

*Aufbereitung 

*** Variable wissensintensive Industrien (Dummy)
gen wzwInd08=.
la var wzwInd08 "wissensintensive Industrie" 

replace wzwInd08=1 if wz08_14>=20100 & wz08_14<20200
replace wzwInd08=1 if wz08_14>=20200 & wz08_14<20300
replace wzwInd08=1 if wz08_14>=20400 & wz08_14<20500
replace wzwInd08=1 if wz08_14>=20500 & wz08_14<20600
replace wzwInd08=1 if wz08_14>=21100 & wz08_14<21200
replace wzwInd08=1 if wz08_14>=21200 & wz08_14<21300
replace wzwInd08=1 if wz08_14>=25300 & wz08_14<25400
replace wzwInd08=1 if wz08_14>=25400 & wz08_14<25500
replace wzwInd08=1 if wz08_14>=26100 & wz08_14<26200
replace wzwInd08=1 if wz08_14>=26200 & wz08_14<26300
replace wzwInd08=1 if wz08_14>=26300 & wz08_14<26400
replace wzwInd08=1 if wz08_14>=26400 & wz08_14<26500
replace wzwInd08=1 if wz08_14>=26500 & wz08_14<26600
replace wzwInd08=1 if wz08_14>=26600 & wz08_14<26700
replace wzwInd08=1 if wz08_14>=26700 & wz08_14<26800
replace wzwInd08=1 if wz08_14>=27100 & wz08_14<27200
replace wzwInd08=1 if wz08_14>=27400 & wz08_14<27500
replace wzwInd08=1 if wz08_14>=27900 & wz08_14<28000
replace wzwInd08=1 if wz08_14>=28100 & wz08_14<28200
replace wzwInd08=1 if wz08_14>=28200 & wz08_14<28300
replace wzwInd08=1 if wz08_14>=28900 & wz08_14<29000
replace wzwInd08=1 if wz08_14>=29100 & wz08_14<29200
replace wzwInd08=1 if wz08_14>=29300 & wz08_14<29400
replace wzwInd08=1 if wz08_14>=30100 & wz08_14<30200
replace wzwInd08=1 if wz08_14>=30200 & wz08_14<30300
replace wzwInd08=1 if wz08_14>=30300 & wz08_14<30400
replace wzwInd08=1 if wz08_14>=30400 & wz08_14<30500
replace wzwInd08=1 if wz08_14>=33200 & wz08_14<33300




replace wzwInd08=0 if wz08_14<. & wzwInd08~=1


*** Variable wissensintensives Verarbeitendes Gewerbe (Dummy)

gen wzwVG08=.
la var wzwVG08 "wissensintensives verarbeitendes Gewerbe"

replace wzwVG08=1 if wz08_14>=6100 & wz08_14<6200
replace wzwVG08=1 if wz08_14>=6200 & wz08_14<6300
replace wzwVG08=1 if wz08_14>=9100 & wz08_14<9200
replace wzwVG08=1 if wz08_14>=19200 & wz08_14<19300
replace wzwVG08=1 if wz08_14>=35100 & wz08_14<35200
replace wzwVG08=1 if wz08_14>=35200 & wz08_14<35300
replace wzwVG08=1 if wz08_14>=35300 & wz08_14<35400




replace wzwVG08=0 if wz08_14<. & wzwVG08~=1


*** Variable wissensintensive Dienstleistungen (Dummy)

gen wzwD08=.
la var wzwD08 "wissensintensive Dienstleistungen" 

replace wzwD08=1 if wz08_14>=41100 & wz08_14<41200
replace wzwD08=1 if wz08_14>=58100 & wz08_14<58200
replace wzwD08=1 if wz08_14>=58200 & wz08_14<58300
replace wzwD08=1 if wz08_14>=59100 & wz08_14<59200
replace wzwD08=1 if wz08_14>=59200 & wz08_14<59300
replace wzwD08=1 if wz08_14>=60100 & wz08_14<60200
replace wzwD08=1 if wz08_14>=60200 & wz08_14<60300
replace wzwD08=1 if wz08_14>=61100 & wz08_14<61200
replace wzwD08=1 if wz08_14>=61200 & wz08_14<61300
replace wzwD08=1 if wz08_14>=61300 & wz08_14<61400
replace wzwD08=1 if wz08_14>=61900 & wz08_14<62000
replace wzwD08=1 if wz08_14>=62000 & wz08_14<62100
replace wzwD08=1 if wz08_14>=63100 & wz08_14<63200
replace wzwD08=1 if wz08_14>=63900 & wz08_14<64000
replace wzwD08=1 if wz08_14>=64100 & wz08_14<64200
replace wzwD08=1 if wz08_14>=64200 & wz08_14<64300
replace wzwD08=1 if wz08_14>=64300 & wz08_14<64400
replace wzwD08=1 if wz08_14>=64900 & wz08_14<65000
replace wzwD08=1 if wz08_14>=65100 & wz08_14<65200
replace wzwD08=1 if wz08_14>=65200 & wz08_14<65300
replace wzwD08=1 if wz08_14>=65300 & wz08_14<65400
replace wzwD08=1 if wz08_14>=66100 & wz08_14<66200
replace wzwD08=1 if wz08_14>=66300 & wz08_14<66400
replace wzwD08=1 if wz08_14>=68100 & wz08_14<68200
replace wzwD08=1 if wz08_14>=68300 & wz08_14<68400
replace wzwD08=1 if wz08_14>=69100 & wz08_14<69200
replace wzwD08=1 if wz08_14>=69200 & wz08_14<69300
replace wzwD08=1 if wz08_14>=70100 & wz08_14<70200
replace wzwD08=1 if wz08_14>=70200 & wz08_14<70300
replace wzwD08=1 if wz08_14>=71100 & wz08_14<71200
replace wzwD08=1 if wz08_14>=71200 & wz08_14<71300
replace wzwD08=1 if wz08_14>=72100 & wz08_14<72200
replace wzwD08=1 if wz08_14>=72200 & wz08_14<72300
replace wzwD08=1 if wz08_14>=73200 & wz08_14<73300
replace wzwD08=1 if wz08_14>=74100 & wz08_14<74200
replace wzwD08=1 if wz08_14>=74300 & wz08_14<74400
replace wzwD08=1 if wz08_14>=74900 & wz08_14<75000
replace wzwD08=1 if wz08_14>=75000 & wz08_14<75100
replace wzwD08=1 if wz08_14>=77400 & wz08_14<77500
replace wzwD08=1 if wz08_14>=82100 & wz08_14<82200
replace wzwD08=1 if wz08_14>=82300 & wz08_14<82400
replace wzwD08=1 if wz08_14>=86100 & wz08_14<86200
replace wzwD08=1 if wz08_14>=86200 & wz08_14<86300
replace wzwD08=1 if wz08_14>=86900 & wz08_14<87000
replace wzwD08=1 if wz08_14>=90000 & wz08_14<90100
replace wzwD08=1 if wz08_14>=91000 & wz08_14<91100





replace wzwD08=0 if wz08_14<. & wzwD08~=1


*** Variablen Buldeslaender (Dummy)

gen bl01=0
la var bl01 "Schleswig-Holstein"
gen bl02=0
la var bl02 "Hamburg"
gen bl03=0
la var bl03 "Niedersachsen"
gen bl04=0
la var bl04 "Bremen"
gen bl05=0
la var bl05 "NRW"
gen bl06=0
la var bl06 "Hessen"
gen bl07=0
la var bl07 "Reinland-Pfalz"
gen bl08=0
la var bl08 "BW"
gen bl09=0
la var bl09 "Bayern"
gen bl010=0
la var bl010 "saarland"
gen bl011=0
la var bl011 "Berlin"
gen bl012=0
la var bl012 "Brandenburg"
gen bl013=0
la var bl013 "Meck-Pomm"
gen bl014=0
la var bl014 "Sachsen"
gen bl015=0
la var bl015 "Sachsen-Anhalt"
gen bl016=0
la var bl016 "Thueringen"

replace bl01=1 if bula2014==1
replace bl02=1 if bula2014==2
replace bl03=1 if bula2014==3
replace bl04=1 if bula2014==4
replace bl05=1 if bula2014==5
replace bl06=1 if bula2014==6
replace bl07=1 if bula2014==7
replace bl08=1 if bula2014==8
replace bl09=1 if bula2014==9
replace bl010=1 if bula2014==10
replace bl011=1 if bula2014==11
replace bl012=1 if bula2014==12
replace bl013=1 if bula2014==13
replace bl014=1 if bula2014==14
replace bl015=1 if bula2014==15
replace bl016=1 if bula2014==16

*** Variablen Weiterbildungsaktivitaeten(Dummy)
gen wb=.
la var wb "weiterbildung gefoerdert"
gen wba=.
la var wba "externe Kurse"
gen wbb=.
la var wbb "interne Kurse"
gen wbc=.
la var wbc "wb am Arbeitsplatz"
gen wbd=.
la var wbd "Vortraege Tagungen"
gen wbe=.
la var wbe "arbeitsplatwecksel"
gen wbf=.
la var wbf "selbstgesteuerte wb"
gen wbg=.
la var wbg "Qual.-/Werkstattzirkel"
gen wbh=.
la var wbh "Sonstige"


replace wb=0 if v55==2
replace wba=0 if v56a==0| v55==2
replace wbb=0 if v56b==0| v55==2
replace wbc=0 if v56c==0| v55==2
replace wbd=0 if v56d==0| v55==2
replace wbe=0 if v56e==0| v55==2
replace wbf=0 if v56f==0| v55==2
replace wbg=0 if v56g==0| v55==2
replace wbh=0 if v56h==0| v55==2

replace wb=1 if v55==1
replace wba=1 if v56a==1
replace wbb=1 if v56b==1
replace wbc=1 if v56c==1
replace wbd=1 if v56d==1
replace wbe=1 if v56e==1
replace wbf=1 if v56f==1
replace wbg=1 if v56g==1
replace wbh=1 if v56h==1

***Sozialversicherungspflichtig Beschaeftigte 
gen SVB9=0
la var SVB9 "bis unter 10"
gen SVB19=0
la var SVB19 "bis unter 20"
gen SVB49=0
la var SVB49 "bis unter 50"
gen SVB50=0
la var SVB50 "ueber 50"

replace SVB9=1 if  v01svb14 >=0 &  v01svb14 < 10
replace SVB19=1 if  v01svb14 >=10 &  v01svb14 < 20
replace SVB49=1 if  v01svb14 >=20 &  v01svb14 < 50
replace SVB50=1 if  v01svb14 >=50 
replace SVB9=. if v01svb14==.
replace SVB19=. if v01svb14==.
replace SVB49=. if v01svb14==.
replace SVB50=. if v01svb14==.

save "$data\2014_3.dta", replace


log close
