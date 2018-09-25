import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\2015.xlsx", sheet("Tabelle1") firstrow

replace beobachtet="0" if beobachtet=="XXX" 

destring beobachtet, replace

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta"

clear 

import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\BWS2015.xlsx", sheet("82111-01-05-4 ") firstrow clear

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

drop if BWS2014=="-"

destring BWS2014 BWSLand BWSProd BWSVer BWSBau BWSHan BWSFin BWSOeffi, replace

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\BWS2015.dta", replace

clear
use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta"

merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\BWS2015.dta"

sort krs14 

replace erwartet =27100.93+6058.408 if krs14==3159
replace beobachtet= 24668.604+7799.012 if krs14==3159
replace N=193924.2+60778.243 if krs14==3159

drop if erwartet==.

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta", replace

clear

import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\BST2015.xlsx", sheet("12411-01-01-4 ")

rename A krs14
rename B Name
rename C BST2015

destring krs14, replace 

replace krs14=2000 if krs14==2
replace krs14=11000 if krs14==11

drop if BST2015=="-" 

destring BST2015, replace

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\BST2015.dta"

clear 

use "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta"

rename _merge _merge1
merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\BST2015.dta"

replace BST2015= 255653+73885 if krs14==3159

drop if _merge==2

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta", replace

rename _merge _merge2
merge m:1 krs14 using  "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\Fahrzeiten.dta"
 
replace Autob = ((11*250220)+(28*73793))/(250220+73793) if krs14==3159
replace Oberz = ((17*250220)+(47*73793))/(250220+73793) if krs14==3159
replace Mittelz = ((9*250220)+(14*73793))/(250220+73793) if krs14==3159
 
save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta", replace

rename _merge _merge3

merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2014\kreistypen.dta" 

replace ktyp4=2 if krs14==3159 

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta", replace


***************reg
gen rWBT=beobachtet/N
gen rEWBT=erwartet/N
gen rBWSLand = BWSLand / BST2015     
gen rBWSProd = BWSProd / BST2015 
gen rBWSVer = BWSVer / BST2015 
gen rBWSBau = BWSBau / BST2015 
gen rBWSHan = BWSHan / BST2015 
gen rBWSFin = BWSFin / BST2015 
gen rBWSÖff = BWSOeffi / BST2015 



reg  rWBT  rEWBT  rBWSLand rBWSProd rBWSVer rBWSBau rBWSHan rBWSFin rBWSÖff ///
Autob Mittelz Oberz i.ktyp4
predict erw
gen rRES=(rWBT-erw)/erw

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\MZ\Strukturdatensätze\Ergebnisse Erwartungswerte\Neuer Ordner\Kreise\2015\Beteiligung2015.dta", replace




























