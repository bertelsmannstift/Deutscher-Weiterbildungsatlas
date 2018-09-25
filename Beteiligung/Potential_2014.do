**************************BWS2014

clear 
use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\BWS2014.dta", replace
destring A, gen(krs14)
replace krs14=2000 if krs14==2
replace krs14=11000 if krs14==11

drop A

rename Insgesamt BWS2014
rename LandundForstwirtschaftFisch BWSLand
rename ProduzierendesGewerbeohneBaug BWSProd
rename VerarbeitendesGewerbeC BWSVer
rename BaugewerbeF BWSBau
rename HandelVerkehrGastgewerbeInfor BWSHan
rename FinVersUntdienstlGrunds BWSFin
rename öffentlusonstDienstlErzi BWSOeffi

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\BWS2014.dta", replace

clear

use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta" 




merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\BWS2014.dta"

***Kreisfusion Göttingen/Osterode 

replace erwartet =25405.93 + 5035.958 if krs14==3159
replace beobachtet= 21238.177+6721.496 if krs14==3159
replace N= 189230.9 + 61115.338 if krs14==3159 


sort krs14 

drop if erwartet==.

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta", replace


*******************BST2014
clear

import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\BST2014.xlsx", sheet("12411-01-01-4") firstrow

rename DG krs14
label variable krs14 ""
rename Deutschland Name
label variable C ""
rename C BST2014

destring krs14, replace 

replace krs14=2000 if krs14==2
replace krs14=11000 if krs14==11


save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\BST2014.dta"

clear 

use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta" 

rename _merge _merge1

merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\BST2014.dta"
 
drop if _merge==2 
replace BST2014="0" if BST2014=="-" 
destring BST2014, replace 

***Goettingen
replace BST2014= 250220 + 73793 if krs14==3159 

replace BWS2014 ="0" if krs14==3152 | krs14==3156
replace BWSLand ="0" if krs14==3152 | krs14==3156
replace BWSProd ="0" if krs14==3152 | krs14==3156
replace BWSVer ="0" if krs14==3152 | krs14==3156
replace BWSBau ="0" if krs14==3152 | krs14==3156
replace BWSHan ="0" if krs14==3152 | krs14==3156
replace BWSFin ="0" if krs14==3152 | krs14==3156
replace BWSOeffi ="0" if krs14==3152 | krs14==3156

destring BWS2014 BWSLand BWSProd BWSVer BWSBau BWSHan BWSFin BWSOeffi, replace

replace BWS2014 =. if krs14==3152 | krs14==3156
replace BWSLand =. if krs14==3152 | krs14==3156
replace BWSProd =. if krs14==3152 | krs14==3156
replace BWSVer =. if krs14==3152 | krs14==3156
replace BWSBau =. if krs14==3152 | krs14==3156
replace BWSHan =. if krs14==3152 | krs14==3156
replace BWSFin =. if krs14==3152 | krs14==3156
replace BWSOeffi =. if krs14==3152 | krs14==3156

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta", replace

***************Fahrzeiten 

clear
import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\krs_Fahrzeiten.xls", sheet("Daten") firstrow

rename Kennziffer krs14
rename ErreichbarkeitvonAutobahnen Autob
rename ErreichbarkeitvonOberzentren Oberz
rename ErreichbarkeitvonMittelzentren Mittelz

destring krs14, replace 

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Fahrzeiten.dta", replace

clear 

use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta", replace

rename _merge _merge2
merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Fahrzeiten.dta"


***Goettingen 

replace Autob = ((11*250220)+(28*73793))/(250220+73793) if krs14==3159
replace Oberz = ((17*250220)+(47*73793))/(250220+73793) if krs14==3159
replace Mittelz = ((9*250220)+(14*73793))/(250220+73793) if krs14==3159

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta", replace


*******************Siedlungsstruktur

clear 

import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Kopie von download-ref-kreistypen-xls.xlsx", sheet("Referenz Krs") firstrow


replace krs14= krs14/1000

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\kreistypen.dta"

clear 

use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta", replace

rename _merge _merge3

merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\kreistypen.dta"


***Göttingen
replace ktyp4=2 if krs14==3159

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Beteiligung.dta", replace


***************reg
gen rWBT=beobachtet/N
gen rEWBT=erwartet/N
gen rBWSLand = BWSLand / BST2014     
gen rBWSProd = BWSProd / BST2014 
gen rBWSVer = BWSVer / BST2014 
gen rBWSBau = BWSBau / BST2014 
gen rBWSHan = BWSHan / BST2014 
gen rBWSFin = BWSFin / BST2014 
gen rBWSÖff = BWSOeffi / BST2014 



reg  rWBT  rEWBT  rBWSLand rBWSProd rBWSVer rBWSBau rBWSHan rBWSFin rBWSÖff ///
Autob Mittelz Oberz i.ktyp4
predict erw
gen rRES=(rWBT-erw)/erw



































