import excel "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\2014.xlsx"

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

replace Kreis5 = "15085" in 322
replace Kreis5 = "15083" in 348
replace Kreis5 = "15086" in 353
replace Kreis5 = "15089" in 356
replace Kreis5 = "0554" in 445
replace Kreis5 = "05554" in 445
replace Ort = "Bocholt" in 445

sort Kreis5
by Kreis5: gen NR=_N 
by Kreis5: keep if _n==1
destring Kreis5, gen(krs14)

drop ID PLZ Ort Kreis5 n _merge _merge1

merge m:1 krs14 using "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\BST2014.dta" 

drop if BST2014=="-" 
drop if krs14<1000
drop if krs14>17000 

save "\\srvdaten\UserFolderRedirection\martina\Eigene Dateien\Bertelsman\Daten\Verbund\2014 2015\2014.dta", replace


tostring krs14, gen(krs)
gen null="0"

replace krs= null+krs if krs14<10000
gen BL= substr(krs,1,2)

sort BL 
by BL: egen NR_BL=total(NR)
by BL: egen BST_BL=total(BST2015)
gen Angebot_BV100_BL= (NR_BL/BST_BL)*1000

by BL: keep if _n==1


















