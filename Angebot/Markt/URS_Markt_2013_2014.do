
********************************************************************************************************************
************************************************  Stata **********************************************
                               
                                                ***
                                                                                                                    
********************************************************************************************************************

clear all

*** Version festlegen
version <13> /*Version einfügen*/

*** Bildschirmausgabe steuern
set more off
set logtype text
set linesize 255 



********************************************************************************************************************
*** Aufzeichung in Protokoll starten.
capture log close
log using "G:\FZDH\LSK\Nutzungsantraege\3451-2017 DIE - Schrader (3)\KDFV\20180524.log", replace


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
***			<Programm zur Erfassung der regionalen käufigkeit von Weiterbildungseinrichtung> 
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
***				Markt
***				Kreis>
*** 
*** Anmerkung: Falls Variablen verwendet werden, die in einer vorherigen Syntax erstellt wurden, 
*** diese bitte in separaten Blöcken auflisten.   
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

***mergen der Unternehmensdatei 
merge m:1 unr jahr using "G:\FZDH\LSK\Nutzungsantraege\3451-2017 DIE - Schrader (3)\Daten\uneu_panel2016_we_3451.dta" 

*** wir benötigen nur den Rechtsstand
drop urs_we_ags urs_we_gemeindeverb urs_we_beginn_datum urs_we_ende_datum urs_we_gruendungs_datum ///
urs_we_wz  urs_we_svb_durchschnitt urs_we_geb_durchschnitt ///
urs_we_svb_stichtag urs_we_geb_stichtag urs_we_besch_gad urs_we_tp_gesch urs_we_tp_gesch_gad urs_we_umsatz ///
urs_we_umsatz_gad urs_rt_gruppen_kennz urs_rt_gruppen_kennz_gad urs_rt_oeff_unternehmen urs_rt_inst_sektor /// 
urs_we_auswertungsrelevant

drop if _merge==2 // Unternehmen ohne Niederlassung(????) 
drop if _merge==1 // Niederlassung ohne Unternehmen -> kein Rechtsstand (?)

gen Rechtsform=urs_rt_rechtsform_k // (die gleiche Klassifikation wie urs_1ef26 im URS95 ???)

***marktförmige Betriebe 
gen Markt=0
replace Markt=1 if Rechtsform== "01" | Rechtsform== "02" | Rechtsform=="03" | Rechtsform=="04" ///
| Rechtsform=="05" | Rechtsform=="06" | Rechtsform=="07"| Rechtsform=="09" 


*** Wirtschaftszweig auf 4-Steller trimmen
gen WZ=  substr(urs_nl_wz,1,4) // (liegt der WZ08 noch differenziert als 4-Steller vor wie urs_1ef20 ?? Im Dummy-File enden alle Schlüssel nach der 3. Stelle auf 00!!)

*** Weiterbildung im engeren Sinne (Ohne fahrschulen)
gen WBeng=0
replace WBeng=1 if  WZ=="8551" | WZ=="8552" | WZ=="8559"| WZ=="8560" | WZ=="856"

*** Weiterbildung im Weiteren Sinne (Mit Fahrschulen)
gen WBweit=0
replace WBweit=1 if  WZ== "8551" | WZ== "8552" | WZ== "8553" | WZ=="8559"| WZ=="8560" | WZ=="856" | WZ=="855" 

***Kreise
gen Kreis=  substr(urs_nl_ags,1,5)


********************************************************************************************************************
*** II. Datenauswertung
********************************************************************************************************************

***WB im engeren Sinne 2013
tab Kreis if jahr==2013 & Markt==1 &  WBeng==1

***WB im weiteren Sinne 2013
tab Kreis if jahr==2013 & Markt==1 & WBweit==1 

***WB im engeren Sinne 2014
tab Kreis if jahr==2014 & Markt==1 &  WBeng==1

***WB im weiteren Sinne 2014
tab Kreis if jahr==2014 & Markt==1 & WBweit==1 


********************************************************************************************************************


********************************************************************************************************************
********************************************************************************************************************

log close

exit




