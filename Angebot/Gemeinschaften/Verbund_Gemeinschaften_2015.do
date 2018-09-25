clear

import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\2015\2015.xlsx"

rename A ID
rename B PLZ
rename C Ort


merge m:1 ID using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\ID-Kreis.dta"

drop if _merge==2

rename _merge _merge1
merge m:1 PLZ using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\PLZ-Kreis.dta"

replace Kreis5="05562" if Ort=="Datteln"
replace Kreis5="15088" if Ort=="Schkopau"
replace Kreis5="05170" if Ort=="Moers"
replace Kreis5="05334" if Ort=="Aachen"
replace Kreis5="05314" if Ort=="Bonn"
replace Kreis5="05111" if Ort=="Düsseldorf"
replace Kreis5="05112" if Ort=="Duisburg"
replace Kreis5="05124" if Ort=="Wuppertal"
replace Kreis5="05158" if Ort=="Hilden" 
replace Kreis5="05378" if Ort=="Burscheid"
replace Kreis5="05170" if Ort=="Dinslaken"
replace Kreis5="06633" if Ort=="Wolfhagen"
replace Kreis5="06632" if Ort=="Bad Hersfeld"
replace Kreis5="06636" if Ort=="Eschwege"
replace Kreis5="07143" if Ort=="Homberg (Efze)"
replace Kreis5="07111" if Ort=="Koblenz"
replace Kreis5="14524" if Ort=="Werdau"
replace Kreis5="03459" if Ort=="Wallenhorst-Rulle" 
replace Kreis5="09162" if Ort=="München"

replace Kreis5 = "15084" in 17
replace Kreis5 = "05111" in 204
replace Kreis5 = "06633" in 249
replace Kreis5 = "15085" in 318
replace Kreis5 = "15083" in 342
replace Kreis5 = "15086" in 349
replace Kreis5 = "15089" in 352
replace Kreis5 = "05554" in 449
replace Kreis5 = "08311" in 895
replace Kreis5 = "08311" in 896
replace Kreis5 = "08311" in 900
replace Kreis5 = "08311" in 902
replace Kreis5 = "08311" in 903
replace Kreis5 = "08311" in 904
replace Kreis5 = "08311" in 905
replace Kreis5 = "08311" in 906
replace Kreis5 = "08311" in 907
replace Kreis5 = "08311" in 908
replace Kreis5 = "08311" in 909
replace Kreis5 = "08311" in 909
replace Kreis5 = "08311" in 910
replace Kreis5 = "08311" in 911
replace Kreis5 = "08311" in 912
replace Kreis5 = "08311" in 913
replace Kreis5 = "08311" in 914
replace Kreis5 = "08311" in 916


save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\2015\2015.dta", replace

sort Kreis5
by Kreis5: gen NR=_N 
by Kreis5: keep if _n==1
destring Kreis5, gen(krs14)



merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\2015\BST2015.dta" 
drop if BST2015== .
drop if krs14<1000
drop if krs14>17000 
 



drop ID PLZ Ort Kreis5 n _merge _merge1

sort krs14 

replace NR=0 if NR==.

gen Angebot= (NR/BST2015)*1000 

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\2015\2015.dta", replace


























