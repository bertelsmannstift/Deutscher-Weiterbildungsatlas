
********************************************************************************************************************
************************************************  Stata **********************************************
                               
                                                ***
                                                                                                                    
********************************************************************************************************************
clear all

*** Version festlegen
version 15.1 /*Version einfügen*/

*** Bildschirmausgabe steuern
set more off
set logtype text
set linesize 255 



********************************************************************************************************************
*** Aufzeichung in Protokoll starten.
capture log close
log using "G:\FZDH\LSK\Nutzungsantraege\3451-2017 DIE - Schrader (3)\KDFV\20180528\20180606.log", replace


********************************************************************************************************************
********************************************************************************************************************
********************************************************************************************************************


********************************************************************************************************************
********************************************************************************************************************
*** Titel des Projekts: 			<>
*** Datengrundlage: 				<Unternehmensregister 2013/2014>
***
*** Dateiname des Programmcodes: 	<markt_WB.do>
*** erstellt: 						<24.052018> 
*** von: 							<Andreas Martin> 
*** E-Mail: 						<martin@die-bonn.de> 
*** Tel.: 							<022832944278> 
*** 
*** Dateiname des Output-Files: 	<20180524.log> 
*** 
*** 
*** Grundriss des Programms: 
***			<Programm zur Erfassung der regionalen Häufigkeit von betrieblichen Weiterbildungsangeboten> 
***
*** 
*** Verwendete Variablen: 
*** Originalvariablen: 	
***			   <unr: Unternehmen ID
***				bnr: Betrieb ID
***				jahr: Jahr
***				urs_rt_rechtsform_k: Rechtsform
***				urs_nl_wz= Branche wz08
***				urs_nl_ags: Amtlicher Gemeindeschlüssel>
*** 
***
*** Neu angelegte Variablen in dieser Syntax <syntaxname.sas>:  
***			   <Rechtsform
***				wzwD08
***				wzwVG08
***				wzwInd08
***				bl016
***				bl015
***				bl014
***				bl013
***				bl012
***				bl011
***				bl010
***				bl09
***				bl08
***				bl07
***				bl06
***				bl04
***				bl03
***				bl02
***				bl01
***				SVB49
***				SVB19
***				SVB9
***				Kreis>
*** 
***    
***            
*** Gewichtungsvariable: 	-
***
***
********************************************************************************************************************
********************************************************************************************************************



********************************************************************************************************************
*** I. Datenaufbereitung
********************************************************************************************************************

clear
*** Betriebsdatei 
use "G:\FZDH\LSK\Nutzungsantraege\3451-2017 DIE - Schrader (3)\Daten\uneu_panel2016_nl_3451.dta" 

set more off
***mergen der Unternehmensdatei 
merge m:1 unr jahr using "G:\FZDH\LSK\Nutzungsantraege\3451-2017 DIE - Schrader (3)\Daten\uneu_panel2016_we_3451.dta" 

*** wir benötigen nur den Rechtsstand
drop urs_we_ags urs_we_gemeindeverb urs_we_beginn_datum urs_we_ende_datum urs_we_gruendungs_datum ///
urs_we_wz  urs_we_svb_durchschnitt urs_we_geb_durchschnitt ///
urs_we_svb_stichtag urs_we_geb_stichtag urs_we_besch_gad urs_we_tp_gesch urs_we_tp_gesch_gad urs_we_umsatz ///
urs_we_umsatz_gad urs_rt_gruppen_kennz urs_rt_gruppen_kennz_gad urs_rt_oeff_unternehmen urs_rt_inst_sektor /// 

keep if urs_we_auswertungsrelevant=="1" /* Einfügung im FDZ */
keep if urs_nl_auswertungsrelevant=="1" /* Einfügung im FDZ */

drop if _merge==2 // Unternehmen ohne Niederlassung(????) 
drop if _merge==1 // Niederlassung ohne Unternehmen -> kein Rechtsstand (?)

***nur 2013
keep if jahr==2014


*** Wirtschaftszweig auf 3-Steller trimmen
gen wz08=  substr(urs_nl_wz,1,3) 


***Wissensintensive Industrie
gen wzwInd08=0
replace wzwInd08=1 if wz08 == "201"
replace wzwInd08=1 if wz08 == "202"
replace wzwInd08=1 if wz08 == "204"
replace wzwInd08=1 if wz08 == "205"
replace wzwInd08=1 if wz08 == "211"
replace wzwInd08=1 if wz08 == "212"
replace wzwInd08=1 if wz08 == "253"
replace wzwInd08=1 if wz08 == "254"
replace wzwInd08=1 if wz08 == "261"
replace wzwInd08=1 if wz08 == "262"
replace wzwInd08=1 if wz08 == "263"
replace wzwInd08=1 if wz08 == "264"
replace wzwInd08=1 if wz08 == "265"
replace wzwInd08=1 if wz08 == "266"
replace wzwInd08=1 if wz08 == "267"
replace wzwInd08=1 if wz08 == "271"
replace wzwInd08=1 if wz08 == "274"
replace wzwInd08=1 if wz08 == "279"
replace wzwInd08=1 if wz08 == "281"
replace wzwInd08=1 if wz08 == "282"
replace wzwInd08=1 if wz08 == "289"
replace wzwInd08=1 if wz08 == "291"
replace wzwInd08=1 if wz08 == "293"
replace wzwInd08=1 if wz08 == "301"
replace wzwInd08=1 if wz08 == "302"
replace wzwInd08=1 if wz08 == "303"
replace wzwInd08=1 if wz08 == "304"
replace wzwInd08=1 if wz08 == "332" 


*** wissensintensives Verarbeitendes Gewerbe 
gen wzwVG08=0
replace wzwVG08=1 if wz08== "061"
replace wzwVG08=1 if wz08== "062"
replace wzwVG08=1 if wz08== "091"
replace wzwVG08=1 if wz08== "192"
replace wzwVG08=1 if wz08== "351"
replace wzwVG08=1 if wz08== "352"
replace wzwVG08=1 if wz08== "353"

*** wissensintensive Dienstleistungen

gen wzwD08=0 
replace wzwD08=1 if wz08== "411"
replace wzwD08=1 if wz08== "581"
replace wzwD08=1 if wz08== "582"
replace wzwD08=1 if wz08== "591"
replace wzwD08=1 if wz08== "592"
replace wzwD08=1 if wz08== "601"
replace wzwD08=1 if wz08== "602"
replace wzwD08=1 if wz08== "611"
replace wzwD08=1 if wz08== "612"
replace wzwD08=1 if wz08== "613"
replace wzwD08=1 if wz08== "619"
replace wzwD08=1 if wz08== "620"
replace wzwD08=1 if wz08== "631"
replace wzwD08=1 if wz08== "639"
replace wzwD08=1 if wz08== "641"
replace wzwD08=1 if wz08== "642"
replace wzwD08=1 if wz08== "643"
replace wzwD08=1 if wz08== "649"
replace wzwD08=1 if wz08== "651"
replace wzwD08=1 if wz08== "652"
replace wzwD08=1 if wz08== "653"
replace wzwD08=1 if wz08== "661"
replace wzwD08=1 if wz08== "663"
replace wzwD08=1 if wz08== "681"
replace wzwD08=1 if wz08== "683"
replace wzwD08=1 if wz08== "691"
replace wzwD08=1 if wz08== "692"
replace wzwD08=1 if wz08== "701"
replace wzwD08=1 if wz08== "702"
replace wzwD08=1 if wz08== "711"
replace wzwD08=1 if wz08== "712"
replace wzwD08=1 if wz08== "721"
replace wzwD08=1 if wz08== "722"
replace wzwD08=1 if wz08== "732"
replace wzwD08=1 if wz08== "741"
replace wzwD08=1 if wz08== "743"
replace wzwD08=1 if wz08== "749"
replace wzwD08=1 if wz08== "750"
replace wzwD08=1 if wz08== "774"
replace wzwD08=1 if wz08== "821"
replace wzwD08=1 if wz08== "823"
replace wzwD08=1 if wz08== "861"
replace wzwD08=1 if wz08== "862"
replace wzwD08=1 if wz08== "869"
replace wzwD08=1 if wz08== "900"
replace wzwD08=1 if wz08== "910"

***SVB: Klassifikation 0-9;10-19;20-49;50+
gen SVB9=0
la var SVB9 "bis unter 10"
gen SVB19=0
la var SVB19 "bis unter 20"
gen SVB49=0
la var SVB49 "bis unter 50"
gen SVB50=0
la var SVB50 "ueber 50"

replace SVB9=1 if urs_nl_svb_durchschnitt >=0 & urs_nl_svb_durchschnitt < 10
replace SVB9=1 if urs_nl_svb_durchschnitt ==. 
replace SVB19=1 if urs_nl_svb_durchschnitt >=10 & urs_nl_svb_durchschnitt < 20
replace SVB49=1 if urs_nl_svb_durchschnitt >=20 & urs_nl_svb_durchschnitt < 50
replace SVB50=1 if urs_nl_svb_durchschnitt >=50 & urs_nl_svb_durchschnitt!=.



***Bundeslaender 
gen bula=  substr( urs_nl_ags,1,2)

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
la var bl016 "Th𲩮gen"

replace bl01=1 if bula=="01"
replace bl02=1 if bula=="02"
replace bl03=1 if bula=="03"
replace bl04=1 if bula=="04"
replace bl05=1 if bula=="05"
replace bl06=1 if bula=="06"
replace bl07=1 if bula=="07"
replace bl08=1 if bula=="08"
replace bl09=1 if bula=="09"
replace bl010=1 if bula=="10"
replace bl011=1 if bula=="11"
replace bl012=1 if bula=="12"
replace bl013=1 if bula=="13"
replace bl014=1 if bula=="14"
replace bl015=1 if bula=="15"
replace bl016=1 if bula=="16" 



***Kreise
gen Kreis=  substr(urs_nl_ags,1,5)


***Geschaezte betriebliche Weiterbildung: Wahrscheinlichkeit eines externen Angebotes
#delimit;
gen WBextern=1/(1+ 
exp(-(
 2.120607
+ wzwD08*  1.040285
+ wzwVG08* 0.4283739
+ wzwInd08* 0.2356508
+ bl016* -0.2838212
+ bl015*  -0.135224
+ bl014*  -0.1287382 
+ bl013*  -0.1428999
+ bl012*  -0.02053
+ bl011*  -0.3135133
+ bl010*  0.1122098
+ bl09*  0.0625354
+ bl08*  0.2280196
+ bl07*  0.0081752
+ bl06*  0.2298027
+ bl04*  0.1358841
+ bl03*  0.2448584
+ bl02* -0.3613368
+ bl01*  0.0000735
+ SVB49* -1.141795
+ SVB19* -1.700181
+ SVB9* -2.863101 )));
#delimit cr
***Geschaezte betriebliche Weiterbildung: Wahrscheinlichkeit eines internen Angebotes

#delimit;
gen WBintern=1/(1+ 
exp(-(
 1.261179 
+ wzwD08*  0.5940961 
+ wzwVG08* 0.7965406
+ wzwInd08*  0.7965406
+ bl016* -0.2413581
+ bl015*  -0.0005768
+ bl014*  -0.1157063
+ bl013*  0.1565174
+ bl012*  -0.0351636
+ bl011*  -0.0627166
+ bl010*  -0.00355 
+ bl09*  0.2362749
+ bl08*  0.750954
+ bl07*  -0.0114929
+ bl06* 0.5225091
+ bl04* 0.5663648
+ bl03* 0.5299593
+ bl02* -0.2530705
+ bl01* 0.1177302 
+ SVB49* -1.210654
+ SVB19* -1.790455
+ SVB9* -3.031774 )));
#delimit cr



***Geschaezte betriebliche Weiterbildung: Wahrscheinlichkeit Vortraege/Tagungen

#delimit;
gen WBvt=1/(1+ 
exp(-(
 0.9922468
+ wzwD08*  0.8931497
+ wzwVG08* 1.083912
+ wzwInd08* 0.3642459 
+ bl016* -0.1771244
+ bl015*  -0.0462946
+ bl014*  -0.0251001
+ bl013*  -0.1114692
+ bl012*  -0.1084172
+ bl011*  -0.3144033
+ bl010*  0.1758876 
+ bl09*  0.0716591
+ bl08*  0.0968599
+ bl07*  -0.2605854 
+ bl06*  0.2615402
+ bl04* 0.3350143
+ bl03* 0.3016361
+ bl02* -0.5729165
+ bl01* -0.1854405 
+ SVB49* -0.9989367
+ SVB19* -1.545417
+ SVB9* -2.454966 )));
#delimit cr








********************************************************************************************************************
*** II. Datenauswertung
********************************************************************************************************************

table  Kreis if jahr==2014 , contents (sum WBextern sum WBintern sum WBvt)


********************************************************************************************************************


********************************************************************************************************************
********************************************************************************************************************

log close

exit




