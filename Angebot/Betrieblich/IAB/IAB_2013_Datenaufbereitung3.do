* Programmdatei des Projektes "Deutscher Weiterbildungsatlas" FDz1492 - 2013_Datenaufbereitung3.do
* Inhalt: Datenaufbereitung 
* Aggregationsniveau: Branchen (3-Steller), Bundeslaender

clear



captur log close


log using "$log\2013_Datenaufbereitung3.log", replace

use "$orig\iabbp_2013.dta"

*Aufbereitung 

*** Variable wissensintensive Industrien (Dummy)
gen wzwInd08=.
la var wzwInd08 "wissensintensive Industrie" 

replace wzwInd08=1 if wz08_13>=20100 & wz08_13<20200
replace wzwInd08=1 if wz08_13>=20200 & wz08_13<20300
replace wzwInd08=1 if wz08_13>=20400 & wz08_13<20500
replace wzwInd08=1 if wz08_13>=20500 & wz08_13<20600
replace wzwInd08=1 if wz08_13>=21100 & wz08_13<21200
replace wzwInd08=1 if wz08_13>=21200 & wz08_13<21300
replace wzwInd08=1 if wz08_13>=25300 & wz08_13<25400
replace wzwInd08=1 if wz08_13>=25400 & wz08_13<25500
replace wzwInd08=1 if wz08_13>=26100 & wz08_13<26200
replace wzwInd08=1 if wz08_13>=26200 & wz08_13<26300
replace wzwInd08=1 if wz08_13>=26300 & wz08_13<26400
replace wzwInd08=1 if wz08_13>=26400 & wz08_13<26500
replace wzwInd08=1 if wz08_13>=26500 & wz08_13<26600
replace wzwInd08=1 if wz08_13>=26600 & wz08_13<26700
replace wzwInd08=1 if wz08_13>=26700 & wz08_13<26800
replace wzwInd08=1 if wz08_13>=27100 & wz08_13<27200
replace wzwInd08=1 if wz08_13>=27400 & wz08_13<27500
replace wzwInd08=1 if wz08_13>=27900 & wz08_13<28000
replace wzwInd08=1 if wz08_13>=28100 & wz08_13<28200
replace wzwInd08=1 if wz08_13>=28200 & wz08_13<28300
replace wzwInd08=1 if wz08_13>=28900 & wz08_13<29000
replace wzwInd08=1 if wz08_13>=29100 & wz08_13<29200
replace wzwInd08=1 if wz08_13>=29300 & wz08_13<29400
replace wzwInd08=1 if wz08_13>=30100 & wz08_13<30200
replace wzwInd08=1 if wz08_13>=30200 & wz08_13<30300
replace wzwInd08=1 if wz08_13>=30300 & wz08_13<30400
replace wzwInd08=1 if wz08_13>=30400 & wz08_13<30500
replace wzwInd08=1 if wz08_13>=33200 & wz08_13<33300




replace wzwInd08=0 if wz08_13<. & wzwInd08~=1


*** Variable wissensintensives Verarbeitendes Gewerbe (Dummy)

gen wzwVG08=.
la var wzwVG08 "wissensintensives verarbeitendes Gewerbe"

replace wzwVG08=1 if wz08_13>=6100 & wz08_13<6200
replace wzwVG08=1 if wz08_13>=6200 & wz08_13<6300
replace wzwVG08=1 if wz08_13>=9100 & wz08_13<9200
replace wzwVG08=1 if wz08_13>=19200 & wz08_13<19300
replace wzwVG08=1 if wz08_13>=35100 & wz08_13<35200
replace wzwVG08=1 if wz08_13>=35200 & wz08_13<35300
replace wzwVG08=1 if wz08_13>=35300 & wz08_13<35400




replace wzwVG08=0 if wz08_13<. & wzwVG08~=1


*** Variable wissensintensive Dienstleistungen (Dummy)

gen wzwD08=.
la var wzwD08 "wissensintensive Dienstleistungen" 

replace wzwD08=1 if wz08_13>=41100 & wz08_13<41200
replace wzwD08=1 if wz08_13>=58100 & wz08_13<58200
replace wzwD08=1 if wz08_13>=58200 & wz08_13<58300
replace wzwD08=1 if wz08_13>=59100 & wz08_13<59200
replace wzwD08=1 if wz08_13>=59200 & wz08_13<59300
replace wzwD08=1 if wz08_13>=60100 & wz08_13<60200
replace wzwD08=1 if wz08_13>=60200 & wz08_13<60300
replace wzwD08=1 if wz08_13>=61100 & wz08_13<61200
replace wzwD08=1 if wz08_13>=61200 & wz08_13<61300
replace wzwD08=1 if wz08_13>=61300 & wz08_13<61400
replace wzwD08=1 if wz08_13>=61900 & wz08_13<62000
replace wzwD08=1 if wz08_13>=62000 & wz08_13<62100
replace wzwD08=1 if wz08_13>=63100 & wz08_13<63200
replace wzwD08=1 if wz08_13>=63900 & wz08_13<64000
replace wzwD08=1 if wz08_13>=64100 & wz08_13<64200
replace wzwD08=1 if wz08_13>=64200 & wz08_13<64300
replace wzwD08=1 if wz08_13>=64300 & wz08_13<64400
replace wzwD08=1 if wz08_13>=64900 & wz08_13<65000
replace wzwD08=1 if wz08_13>=65100 & wz08_13<65200
replace wzwD08=1 if wz08_13>=65200 & wz08_13<65300
replace wzwD08=1 if wz08_13>=65300 & wz08_13<65400
replace wzwD08=1 if wz08_13>=66100 & wz08_13<66200
replace wzwD08=1 if wz08_13>=66300 & wz08_13<66400
replace wzwD08=1 if wz08_13>=68100 & wz08_13<68200
replace wzwD08=1 if wz08_13>=68300 & wz08_13<68400
replace wzwD08=1 if wz08_13>=69100 & wz08_13<69200
replace wzwD08=1 if wz08_13>=69200 & wz08_13<69300
replace wzwD08=1 if wz08_13>=70100 & wz08_13<70200
replace wzwD08=1 if wz08_13>=70200 & wz08_13<70300
replace wzwD08=1 if wz08_13>=71100 & wz08_13<71200
replace wzwD08=1 if wz08_13>=71200 & wz08_13<71300
replace wzwD08=1 if wz08_13>=72100 & wz08_13<72200
replace wzwD08=1 if wz08_13>=72200 & wz08_13<72300
replace wzwD08=1 if wz08_13>=73200 & wz08_13<73300
replace wzwD08=1 if wz08_13>=74100 & wz08_13<74200
replace wzwD08=1 if wz08_13>=74300 & wz08_13<74400
replace wzwD08=1 if wz08_13>=74900 & wz08_13<75000
replace wzwD08=1 if wz08_13>=75000 & wz08_13<75100
replace wzwD08=1 if wz08_13>=77400 & wz08_13<77500
replace wzwD08=1 if wz08_13>=82100 & wz08_13<82200
replace wzwD08=1 if wz08_13>=82300 & wz08_13<82400
replace wzwD08=1 if wz08_13>=86100 & wz08_13<86200
replace wzwD08=1 if wz08_13>=86200 & wz08_13<86300
replace wzwD08=1 if wz08_13>=86900 & wz08_13<87000
replace wzwD08=1 if wz08_13>=90000 & wz08_13<90100
replace wzwD08=1 if wz08_13>=91000 & wz08_13<91100





replace wzwD08=0 if wz08_13<. & wzwD08~=1


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

replace bl01=1 if bula2013==1
replace bl02=1 if bula2013==2
replace bl03=1 if bula2013==3
replace bl04=1 if bula2013==4
replace bl05=1 if bula2013==5
replace bl06=1 if bula2013==6
replace bl07=1 if bula2013==7
replace bl08=1 if bula2013==8
replace bl09=1 if bula2013==9
replace bl010=1 if bula2013==10
replace bl011=1 if bula2013==11
replace bl012=1 if bula2013==12
replace bl013=1 if bula2013==13
replace bl014=1 if bula2013==14
replace bl015=1 if bula2013==15
replace bl016=1 if bula2013==16

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


replace wb=0 if u56==2
replace wba=0 if u57a==0| u56==2
replace wbb=0 if u57b==0| u56==2
replace wbc=0 if u57c==0| u56==2
replace wbd=0 if u57d==0| u56==2
replace wbe=0 if u57e==0| u56==2
replace wbf=0 if u57f==0| u56==2
replace wbg=0 if u57g==0| u56==2
replace wbh=0 if u57h==0| u56==2

replace wb=1 if u56==1
replace wba=1 if u57a==1
replace wbb=1 if u57b==1
replace wbc=1 if u57c==1
replace wbd=1 if u57d==1
replace wbe=1 if u57e==1
replace wbf=1 if u57f==1
replace wbg=1 if u57g==1
replace wbh=1 if u57h==1

***Sozialversicherungspflichtig Beschaeftigte 
gen SVB9=0
la var SVB9 "bis unter 10"
gen SVB19=0
la var SVB19 "bis unter 20"
gen SVB49=0
la var SVB49 "bis unter 50"
gen SVB50=0
la var SVB50 "ueber 50"

replace SVB9=1 if  u01svb13 >=0 &  u01svb13 < 10
replace SVB19=1 if  u01svb13 >=10 &  u01svb13 < 20
replace SVB49=1 if  u01svb13 >=20 &  u01svb13 < 50
replace SVB50=1 if  u01svb13 >=50 
replace SVB9=. if u01svb13==.
replace SVB19=. if u01svb13==.
replace SVB49=. if u01svb13==.
replace SVB50=. if u01svb13==.


save "$data\2013_3.dta", replace


log close
