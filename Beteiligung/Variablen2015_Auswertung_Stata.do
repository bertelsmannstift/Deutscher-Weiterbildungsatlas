
********************************************************************************************************************
************************************************ Musterprogramm Stata **********************************************
                               
*** Hinweis: Das Musterprogramm dient Ihnen zur Orientierung bei der Erstellung Ihres Programmcodes.             ***
*** Das Ziel ist Ihre Outputfiles bestmöglich für die Geheimhaltungsprüfung aufzubereiten.                       ***
*** Bitte beachten Sie: Dieses Musterprogramm enthält keine statistikspezifischen Hilfestellungen zur            ***
*** Aufbereitung und Auswertung der von Ihnen beantragten Daten.                                                 ***
                                                                                                                    
********************************************************************************************************************

clear all

*** Version festlegen
version <13> /*Version einfügen*/

*** Bildschirmausgabe steuern
set more off
set logtype text
set linesize 255 

*** Ado-Pfad festlegen
sysdir set PERSONAL "<Pfad wird im Forschungsdatenzentrum ergänzt>"
mata mata mlib index

*** Makros für Pfade
global datenpfad "<Pfad wird im Forschungsdatenzentrum ergänzt>\"
global outputpfad "<Pfad wird im Forschungsdatenzentrum ergänzt>\"

*** Makros für Datei- und Outputnamen
global dateiname <dateiname.dta> /*Dateiname einfügen*/
global outputname <outputname>   /*Outputname einfügen*/


********************************************************************************************************************
*** Aufzeichung in Protokoll starten.
capture log close
log using "$outputpfad\$outputname.log", replace


********************************************************************************************************************
********************************************************************************************************************
********************************************************************************************************************


********************************************************************************************************************
********************************************************************************************************************
*** Titel des Projekts: 			<Regionale Bildungschanchen>
*** Datengrundlage: 				<Mikrozensus 2015>
***
*** Dateiname des Programmcodes: 	<Variablen2015_imptation_Stata.do>
*** erstellt: 						<18.04-2018> 
*** von: 							<Andreas Martin> 
*** E-Mail: 						<martin@die-bonn.de> 
*** Tel.: 							<0228 3294 278> 
*** 
*** Dateiname des Output-Files: 	<Imputation_2015.log> 
*** 
*** 
*** Grundriss des Programms: 
***			<Programm zur Erfassung der regionalen Weiterbildungsbeteiligung und der erwarteten Weiterbildungsbeteiligung> 
***
*** 
*** Verwendete Variablen: 
*** Originalvariablen: 	
***			   <EF29;
***				EF30 
***             EF44  
***             EF117; 
***             EF131; 
***             EF119UG1; 
***             EF137; 
***             EF122; 
***             EF44; 
***             EF46; 
***             EF436; 
***             EF707;
***				EF309; 
***             EF310; 
***				EF311;
***             EF312; 
***             EF2009; 
***             EF49; 
***             EF 866; 
***             EF323.
*** 
***
*** Neu angelegte Variablen in dieser Syntax <syntaxname.sas>:  
***			   <Neue Variablen (ausser Kinderzahl, Tätigkeitsumfang alles Dummys): 
***             Erwerbstätig; 
***             NichtErwerbsperson; 
***             Erwerbslos; 
***             Soloselbstständig;
***             Selbstständig;
***             Beamte; 
***             Angestellte;
***             Arbeiter; 
***             Azubi; 
***             Soldaten;
***             Sonstige; 
***             Tätigkeitsumfang; 
***             skills; 
***             WiWZI; 
***             WiWZPG; 
***             WiWZD; 
***             BetriebsgrößeKlein; 
***             BetriebsgrößeMittel; 
***             Frau;  
***             EinkommenKlass1; 
***             Einkommensklasse2; 
***             EinkommenKlass3; 
***             EinkommenKlass4; 
***             EinkommenKlass5; 
***             EinkommenKlass6; 
***             HHEinkommenKlass1; 
***             HHEinkommenKlass2; 
***             HHEinkommenKlass3; 
***             HHEinkommensKlass4; 
***             HHEinkommenKlass5; 
***             HHEinkommenKlass6; 
***             Hauptschule; 
***             POS; Realsschule;
***             FachAbitur; 
***             Abitur; 
***             AngelerntPraktikum; 
***             Berufsvorbereitungsjahr; 
***             Lehre; 
***             Berufsfachschule; 
***             MeisterTechniker; 
***             FachschuleDDR; 
***             Verwaltungsfachhochschule; 
***             Universität; 
***             Fachhochschule; 
***             Promotion; 
***             Vorbereitungsdienst Berufsakademie; 
***             SchuleGesund1J; 
***             SchuleGesund2J; 
***             Fachakademie; 
***             Migrationshintergrund; 
***             Alleinstehend; 
***             Kinderzahl; 
***             WBTeilnahme. 
***				SiB = Stellung im Beruf (nominal) 
*** 			NE = Nettoeinkommen (ordinal)
***				HHE =Haushaltseinkommen (ordinal)
***				Schulbildung (nominal)
***				Ausbildung (nominal)
***
***   
***            
*** Gewichtungsvariable: 	EF952; EF953
***
***
********************************************************************************************************************
********************************************************************************************************************



********************************************************************************************************************
*** I. Datenaufbereitung
********************************************************************************************************************


***Erwerbsstatus

gen Erwerbstätig=.
replace Erwerbstätig =0 if EF29==2 | EF29==3 | EF29==4
replace Erwerbstätig =1 if EF29==1
label define Erwerbstätig 0 "nicht erwerbstätig" 1 "erwerbstätig"
label values Erwerbstätig Erwerbstätig

gen NichtErwerbsperson=.
replace NichtErwerbsperson= 0 if EF29==2 | EF29==1 
replace NichtErwerbsperson= 1 if EF29==3 | EF29==4 
label define NichtErwerbsperson 0 "Erwerbsperson" 1 "Nichterwerbsperson"
label values NichtErwerbsperson NichtErwerbsperson

gen Erwerbslos=. 
replace Erwerbslos=0 if EF29==1 | EF29==3 | EF29==4
replace Erwerbslos=1 if EF29==2 
label define Erwerbslos 0 "nicht erwerbslos" 1 "erwerbslos"
label values Erwerbslos Erwerbslos 

*** Stellung im Beruf

gen Soloselbstaendiger=.
replace Soloselbstaendiger=0 if EF117!=1 & EF117!=.
replace Soloselbstaendiger=1 if EF117==1
label define Soloselbstaendiger 0 "nicht soloselbststaendig" 1 "soloselbststaendig"
label values Soloselbstaendiger Soloselbstaendiger 
replace Soloselbstaendiger=0 if EF29!=1 & EF29!=. 

gen Selbstaendiger=.
replace Selbstaendiger=0 if EF117!=2 & EF117!=.
replace Selbstaendiger=1 if EF117==2
label define Selbstaendiger 0 "nicht selbststaendig" 1 "selbststaendig"
label values Selbstaendiger Selbstaendiger 
replace Selbstaendiger=0 if EF29!=1 & EF29!=. 


gen Beamter=.
replace Beamter=0 if EF117!=4 & EF117!=.
replace Beamter=1 if EF117==4
label define Beamter 0 "kein Beamter" 1 "Beamter"
label values Beamter Beamter 
replace Beamter=0 if EF29!=1 & EF29!=. 

gen Angestellter=.
replace Angestellter=0 if EF117!=5 & EF117!=.
replace Angestellter=1 if EF117==5
label define Angestellter 0 "kein Angestellter" 1 "Angestellter"
label values Angestellter Angestellter 
replace Angestellter=0 if EF29!=1 & EF29!=. 


gen Arbeiter=.
replace Arbeiter=0 if EF117!=6 & EF117!=.
replace Arbeiter=1 if EF117==6
label define Arbeiter 0 "kein Arbeiter" 1 "Arbeiter"
label values Arbeiter Arbeiter 
replace Arbeiter=0 if EF29!=1 & EF29!=.


gen Azubi=.
replace Azubi=0 if EF117!=13 & EF117!=14 & EF117!=15 & EF117!=.
replace Azubi=1 if EF117==13 | EF117==14 | EF117==15
label define Azubi 0 "kein Azubi" 1 "Azubi"
label values Azubi Azubi
replace Azubi=0 if EF29!=1 & EF29!=. 


gen Soldaten=.
replace Soldaten=0 if EF117!=9 & EF117!=.
replace Soldaten=1 if EF117==9 
label define Soldaten 0 "kein Soldat" 1 "Soldaten"
label values Soldaten Soldaten
replace Soldaten=0 if EF29!=1 & EF29!=. 

gen Sonstige=.
replace Sonstige=0 if EF117!=3 & EF117!=12 & EF117!=16 & EF117!=17 & EF117!=.
replace Sonstige=1 if EF117==3 | EF117==12 | EF117==16 | EF117==17
label define Sonstige 0 "keine Sonstigen" 1 "Grundwehrdienst Zivi Mithelfende Geringfügige"
label values Sonstige Sonstige 
replace Sonstige=0 if EF29!=1 & EF29!=. 

gen SiB=. 
replace SiB=0 if EF29!=1 & EF29!=. 
replace SiB=1 if EF117==1
replace SiB=2 if EF117==2
replace SiB=3 if EF117==4
replace SiB=4 if EF117==5
replace SiB=5 if EF117==6
replace SiB=6 if EF117==9
replace SiB=7 if EF117==13 | EF117==14 | EF117==15
replace SiB=8 if EF117==3 | EF117==12 | EF117==16 | EF117==17

*** Beschaeftigungsumfang 

gen Taetigkeitsumfang=EF131 
replace Taetigkeitsumfang=0 if EF29!=1 & EF29!=. 



*** Wissensintensive Berufe

tostring EF114, gen(skill1) 
gen skill5= substr(skill1,5,1) 
gen skills=. 
replace skills=1 if skill5=="4"
replace skills=0 if skill5!="4" 


*** Wissensintensive Industriezweige (Gehrke; Rammer; Neuhäusler; Leidmann 2010) nach WZ08.
gen WiWZI=. 
replace WiWZI=1 if EF137== 201 | EF137==202 | EF137==204 | EF137==205 | EF137==211 ///
| EF137==212 | EF137==253 | EF137==254 | EF137==261 | EF137==262 | EF137==263 | EF137==264 ///
| EF137==265 | EF137==266 | EF137==266 | EF137==267 | EF137==271 | EF137==274 | EF137==279 ///
| EF137==281 | EF137==282 | EF137==289 | EF137==291 | EF137==293 | EF137==301 | EF137==302 ///
| EF137==303 | EF137==304 | EF137==332

replace WiWZI=0 if WiWZI!=1 
replace WiWZI=0 if EF29!=1 & EF29!=. 
replace WiWZI=. if EF137==. & EF29==1
replace WiWZI=. if EF137==. & EF29==.


*** Wissensintesives produzierendes Gewerbe (Gehrke; Rammer; Neuhäusler; Leidmann 2010) nach WZ08.

gen WiWZPG=.
replace WiWZPG=1 if EF137== 61 | EF137==62 | EF137==91 | EF137==192 | EF137==351 | EF137==352 ///
| EF137==353

replace WiWZPG=0 if WiWZPG!=1 
replace WiWZPG=0 if EF29!=1 & EF29!=. 
replace WiWZPG=. if EF137==. & EF29==1
replace WiWZPG=. if EF137==. & EF29==.

*** Wissensintesive Dienstleistungen (Gehrke; Rammer; Neuhäusler; Leidmann 2010) nach WZ08.

gen WiWZD=. 
replace WiWZD=1 if EF137== 411 | EF137==581 | EF137==582 | EF137==591 | EF137==592 | EF137==601 ///
| EF137==602 | EF137==611 | EF137==612 | EF137==613 | EF137==619 | EF137==620 | EF137==631 ///
| EF137==639 | EF137==641 | EF137==642 | EF137==643 | EF137==649 | EF137==651 | EF137==652 ///
| EF137==653 | EF137==661 | EF137==663 | EF137==681 | EF137==683 | EF137==691 | EF137==692 ///
| EF137==701 | EF137==702 | EF137==711 | EF137==712 | EF137==721 | EF137==722 | EF137==731 ///
| EF137==732 | EF137==741 | EF137==743 | EF137==749 | EF137==750 | EF137==774 | EF137==821 ///
| EF137==823 | EF137==861 | EF137==862 | EF137==869 | EF137==900 | EF137==910

replace WiWZD=0 if WiWZD!=1 
replace WiWZD=0 if EF29!=1 & EF29!=. 
replace WiWZD=. if EF137==. & EF29==1
replace WiWZD=. if EF137==. & EF29==. 

*** Betriebsgröße 
gen BetriebsgroesseKlein=. 
replace BetriebsgroesseKlein=1 if EF122 <=10
replace BetriebsgroesseKlein=0 if BetriebsgroesseKlein!=1
replace BetriebsgroesseKlein=0 if EF29!=1 & EF29!=.
replace BetriebsgroesseKlein=. if EF122==. & EF29==1
replace BetriebsgroesseKlein=. if EF122==. & EF29==.

gen BetriebsgroesseMittel=. 
replace BetriebsgroesseMittel=1 if EF122==11 | EF122==12
replace BetriebsgroesseMittel=0 if BetriebsgroesseMittel!=1
replace BetriebsgroesseMittel=0 if EF29!=1 & EF29!=.
replace BetriebsgroesseMittel=. if EF122==. & EF29==1
replace BetriebsgroesseMittel=. if EF122==. & EF29==. 

gen BetriebsgroesseGross=. 
replace BetriebsgroesseGross=1 if EF122==13 | EF122==14
replace BetriebsgroesseGross=0 if BetriebsgroesseGross!=1
replace BetriebsgroesseGross=0 if EF29!=1 & EF29!=.
replace BetriebsgroesseGross=. if EF122==. & EF29==1
replace BetriebsgroesseGross=. if EF122==. & EF29==. 

*** Geschlecht 

gen Frau=.
replace Frau=1 if EF46==2
replace Frau=0 if EF46==1 

*** Einkommensklassen 

gen Einkommen_u_500=. 
replace Einkommen_u_500=1 if EF436==1 | EF436==2 | EF436==3 | EF436==90
replace Einkommen_u_500=0 if Einkommen_u_500!=1
replace Einkommen_u_500=. if EF436==. | EF436==99 | EF436==50 

gen Einkommen_500_1100=. 
replace Einkommen_500_1100=1 if EF436==4 | EF436==5 | EF436==6 
replace Einkommen_500_1100=0 if Einkommen_500_1100!=1
replace Einkommen_500_1100=. if EF436==. | EF436==99 | EF436==50 

gen Einkommen_1100_1700=. 
replace Einkommen_1100_1700=1 if EF436==7 | EF436==8 | EF436==9 
replace Einkommen_1100_1700=0 if Einkommen_1100_1700!=1
replace Einkommen_1100_1700=. if EF436==. | EF436==99 | EF436==50 

gen Einkommen_1700_2600=. 
replace Einkommen_1700_2600=1 if EF436==10 | EF436==11 | EF436==12 
replace Einkommen_1700_2600=0 if Einkommen_1700_2600!=1
replace Einkommen_1700_2600=. if EF436==. | EF436==99 | EF436==50 

gen Einkommen_2600_3600=. 
replace Einkommen_2600_3600=1 if EF436==13 | EF436==14 | EF436==15 
replace Einkommen_2600_3600=0 if Einkommen_2600_3600!=1
replace Einkommen_2600_3600=. if EF436==. | EF436==99 | EF436==50

gen Einkommen_3600_=. 
replace Einkommen_3600_=1 if EF436>=16 & EF436<=24  
replace Einkommen_3600_=0 if Einkommen_3600_!=1
replace Einkommen_3600_=. if EF436==. | EF436==99 | EF436==50 

gen NE=.
replace NE=0 if EF436==1 | EF436==2 | EF436==3 | EF436==90 
replace NE=1 if EF436==4 | EF436==5 | EF436==6 
replace NE=2 if EF436==7 | EF436==8 | EF436==9 
replace NE=3 if EF436==10 | EF436==11 | EF436==12
replace NE=4 if EF436==13 | EF436==14 | EF436==15  
replace NE=5 if EF436>=16 & EF436<=24 
replace NE=. if EF436==. | EF436==99 | EF436==50

*** Haushaltseinkommensklassen
 
gen HHEinkommen_u_500=. 
replace HHEinkommen_u_500=1 if EF707==1 | EF707==2 | EF707==3 
replace HHEinkommen_u_500=0 if HHEinkommen_u_500!=1
replace HHEinkommen_u_500=. if EF707==. | EF707==99 | EF707==50 

gen HHEinkommen_500_1100=. 
replace HHEinkommen_500_1100=1 if EF707==4 | EF707==5 | EF707==6 
replace HHEinkommen_500_1100=0 if HHEinkommen_500_1100!=1
replace HHEinkommen_500_1100=. if EF707==. | EF707==99 | EF707==50 

gen HHEinkommen_1100_1700=. 
replace HHEinkommen_1100_1700=1 if EF707==7 | EF707==8 | EF707==9 
replace HHEinkommen_1100_1700=0 if HHEinkommen_1100_1700!=1
replace HHEinkommen_1100_1700=. if EF707==. | EF707==99 | EF707==50 

gen HHEinkommen_1700_2600=. 
replace HHEinkommen_1700_2600=1 if EF707==10 | EF707==11 | EF707==12 
replace HHEinkommen_1700_2600=0 if HHEinkommen_1700_2600!=1
replace HHEinkommen_1700_2600=. if EF707==. | EF707==99 | EF707==50 

gen HHEinkommen_2600_3600=. 
replace HHEinkommen_2600_3600=1 if EF707==13 | EF707==14 | EF707==15 
replace HHEinkommen_2600_3600=0 if HHEinkommen_2600_3600!=1
replace HHEinkommen_2600_3600=. if EF707==. | EF707==99 | EF707==50

gen HHEinkommen_3600_=. 
replace HHEinkommen_3600_=1 if EF707>=16 & EF707<=24  
replace HHEinkommen_3600_=0 if HHEinkommen_3600_!=1
replace HHEinkommen_3600_=. if EF707==. | EF707==99 | EF707==50  

gen HHE=.
replace HHE=0 if EF707==1 | EF707==2 | EF707==3 
replace HHE=1 if EF707==4 | EF707==5 | EF707==6 
replace HHE=2 if EF707==7 | EF707==8 | EF707==9 
replace HHE=3 if EF707==10 | EF707==11 | EF707==12
replace HHE=4 if EF707==13 | EF707==14 | EF707==15 
replace HHE=5 if EF707>=16 & EF707<=24 
replace HHE=. if EF707==. | EF707==99 | EF707==50

*** Bildungsabschluss: Schulbildung 

gen Ohne_Schulab=. 
replace Ohne_Schulab=1 if EF309==8
replace Ohne_Schulab=1 if EF310==6
replace Ohne_Schulab=0 if EF309==1
replace Ohne_Schulab=0 if EF310==1 | EF310==2 | EF310==3 | EF310==4 | EF310==5 | EF310==6 | EF310==7


gen Hauptschule=. 
replace Hauptschule=1 if EF310==1
replace Hauptschule=0 if EF310!=1
replace Hauptschule=. if EF310==9

gen POS=.
replace POS=1 if EF310==2 | EF310==7 
replace POS=0 if EF310!=2 & EF310!=7
replace POS=. if EF310==9

gen Realschule=.
replace Realschule=1 if EF310==3
replace Realschule=0 if EF310!=3
replace Realschule=. if EF310==9

gen FachAbitur=.
replace FachAbitur=1 if EF310==4
replace FachAbitur=0 if EF310!=4
replace FachAbitur=. if EF310==9

gen Abitur=.
replace Abitur=1 if EF310==5
replace Abitur=0 if EF310!=5
replace Abitur=. if EF310==9

gen Schulbildung=.
replace Schulbildung=0 if EF309==8 | EF310==6 | EF309==.
replace Schulbildung=1 if EF310==1 
replace Schulbildung=2 if EF310==2 | EF310==7
replace Schulbildung=3 if EF310==3
replace Schulbildung=4 if EF310==4 
replace Schulbildung=5 if EF310==5
replace Schulbildung=. if EF310==9

***Bildungsabschluss: Beruf

gen AngelerntPraktikum=. 
replace AngelerntPraktikum=1 if EF312==1
replace AngelerntPraktikum=0 if EF312!=1
replace AngelerntPraktikum=. if EF312==99
replace AngelerntPraktikum=. if EF312==. & EF311==9 

gen Berufsvorbereitungsjahr=. 
replace Berufsvorbereitungsjahr=1 if EF312==2
replace Berufsvorbereitungsjahr=0 if EF312!=2
replace Berufsvorbereitungsjahr=. if EF312==99
replace Berufsvorbereitungsjahr=. if EF312==. & EF311==9 

gen Lehre=. 
replace Lehre=1 if EF312==3
replace Lehre=0 if EF312!=3
replace Lehre=. if EF312==99
replace Lehre=. if EF312==. & EF311==9

gen Berufsfachschule=.
replace Berufsfachschule=1 if EF312==4
replace Berufsfachschule=0 if EF312!=4
replace Berufsfachschule=. if EF312==99
replace Berufsfachschule=. if EF312==. & EF311==9

gen MeisterTechniker=. 
replace MeisterTechniker=1 if EF312==8
replace MeisterTechniker=0 if EF312!=8
replace MeisterTechniker=. if EF312==99
replace MeisterTechniker=. if EF312==. & EF311==9

gen FachschuleDDR=.
replace FachschuleDDR=1 if EF312==9
replace FachschuleDDR=0 if EF312!=9
replace FachschuleDDR=. if EF312==99
replace FachschuleDDR=. if EF312==. & EF311==9

gen Verwaltungsfachhochschule=. 
replace Verwaltungsfachhochschule=1 if EF312==12
replace Verwaltungsfachhochschule=0 if EF312!=12
replace Verwaltungsfachhochschule=. if EF312==99
replace Verwaltungsfachhochschule=. if EF312==. & EF311==9

gen Universität=. 
replace Universität=1 if EF312==14
replace Universität=0 if EF312!=14
replace Universität=. if EF312==99
replace Universität=. if EF312==. & EF311==9

gen Fachhochschule=. 
replace Fachhochschule=1 if EF312==13
replace Fachhochschule=0 if EF312!=13
replace Fachhochschule=. if EF312==99
replace Fachhochschule=. if EF312==. & EF311==9

gen Promotion=.
replace Promotion=1 if EF312==15
replace Promotion=0 if EF312!=15
replace Promotion=. if EF312==99
replace Promotion=. if EF312==. & EF311==9 

gen Berufsakademie=. 
replace Berufsakademie=1 if EF312==11
replace Berufsakademie=0 if EF312!=11
replace Berufsakademie=. if EF312==99
replace Berufsakademie=. if EF312==. & EF311==9 

gen Vorbereitungsdienst=.
replace Vorbereitungsdienst=1 if EF312==5
replace Vorbereitungsdienst=0 if EF312!=5
replace Vorbereitungsdienst=. if EF312==99
replace Vorbereitungsdienst=. if EF312==. & EF311==9 

gen SchuleGesund1J=.
replace SchuleGesund1J=1 if EF312==6
replace SchuleGesund1J=0 if EF312!=6
replace SchuleGesund1J=. if EF312==99
replace SchuleGesund1J=. if EF312==. & EF311==9 

gen SchuleGesund2J=.
replace SchuleGesund2J=1 if EF312==7
replace SchuleGesund2J=0 if EF312!=7
replace SchuleGesund2J=. if EF312==99
replace SchuleGesund2J=. if EF312==. & EF311==9 

gen Fachakademie=. 
replace Fachakademie=1 if EF312==10 
replace Fachakademie=0 if EF312!=10
replace Fachakademie=. if EF312==99
replace Fachakademie=. if EF312==. & EF311==9 

gen Ausbildung=. 
replace Ausbildung=1 if EF312==1 | EF312==2 | EF312==6
replace Ausbildung=2 if EF312==3 | EF312==4 | EF312==5 | EF312==7 | EF312==16 | EF312==17
replace Ausbildung=3 if EF312==8 | EF312==9 | EF312==10 | EF312==11
replace Ausbildung=4 if EF312==12 | EF312==13 
replace Ausbildung=5 if EF312==14 | EF312==15
replace Ausbildung=. if EF312==99
replace Ausbildung=. if EF312==. & EF311==9 
replace Ausbildung=0 if EF312==. & (EF311==8 | EF311==.) 



***Migrationsstatus 

gen Migrationshintergrund=.
replace Migrationshintergrund=1 if EF2009!=1
replace Migrationshintergrund=0 if EF2009==1 
replace Migrationshintergrund=. if EF2009==.

***Familienstand 

gen Verheiratet=.
replace Verheiratet=1 if EF49==2 | EF49==5
replace Verheiratet=0 if EF49!=2 & EF49!=5
replace Verheiratet=. if EF49==. 

gen Alleinstehend=.
replace Alleinstehend=1 if EF49==1 | EF49==3 | EF49==4| EF49==6 | EF49==7
replace Alleinstehend=0 if EF49!=1 & EF49!=3 & EF49!=4 & EF49!=6 & EF49!=7
replace Alleinstehend=. if EF49==.

***Zahl der ledigen Kinder im Haushalt
gen Kinderzahl= EF867 

*** Kreise 

gen Kreise2014= EF560UG2

*** Weiterbildungsbeteiligung
gen WBTeilnahme=. 
replace WBTeilnahme=1 if EF323==1
replace WBTeilnahme=0 if EF323==8
replace WBTeilnahme=. if EF323==. 





*** Multiple Imputation (die Zusammenfassung benötige ich um zu sehen, wieviele Angaben ergänzt wurden)  
mi set wide
mi register imputed SiB Soloselbstaendiger Selbstaendiger Beamter Angestellter Arbeiter Azubi Soldaten Sonstige Erwerbslos skills WiWZI WiWZPG WiWZD BetriebsgroesseKlein ///
 BetriebsgroesseMittel Migrationshintergrund Verheiratet Alleinstehend WBTeilnahme  Frau ///
 Schulbildung Ausbildung NE HHE Taetigkeitsumfang EF44 Kinderzahl

set matsize 800 
set more off
mi impute chained ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger i.Beamter ///
 i.Angestellter i.Arbeiter i.Azubi i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel Taetigkeitsumfang)) Erwerbslos /// 
(logit, omit (i.Erwerbslos)) skills Migrationshintergrund  ///
   Alleinstehend WBTeilnahme  Frau ///
(logit, omit(i.BetriebsgroesseKlein i.Erwerbslos i.Migrationshintergrund i.Alleinstehend ///
 i.Schulbildung i. Soldaten i.Soloselbstaendiger i.HHE)) BetriebsgroesseMittel /// 
(logit, omit(i.BetriebsgroesseMittel i.Erwerbslos i.Migrationshintergrund i.Alleinstehend ///
 i.Schulbildung i. Soldaten i.Soloselbstaendiger i.HHE)) BetriebsgroesseKlein ///
(logit, omit(i.Alleinstehend i.HHE i.Schulbildung i.BetriebsgroesseKlein i.BetriebsgroesseMittel ///
 i.WiWZPG i.WiWZD i.Soldaten i.Soloselbstaendiger i.Selbstaendiger i.Beamter )) WiWZI /// 
(logit, omit(i.Alleinstehend i.HHE i.Schulbildung i.BetriebsgroesseKlein i.BetriebsgroesseMittel ///
 i.WiWZPG i.WiWZI i.Soldaten i.Soloselbstaendiger i.Selbstaendiger i.Beamter)) WiWZD ///
(logit, omit(i.Alleinstehend i.HHE i.Schulbildung i.BetriebsgroesseKlein i.BetriebsgroesseMittel ///
 i.WiWZI i.WiWZD i.Soldaten i.Soloselbstaendiger i.Selbstaendiger i.Beamter)) WiWZPG ///
(logit, omit(i.Selbstaendiger i.Beamter ///
 i.Angestellter i.Arbeiter i.Azubi i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung))Soloselbstaendiger ///
(logit, omit(i.Soloselbstaendiger i.Beamter ///
 i.Angestellter i.Arbeiter i.Azubi i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung )) Selbstaendiger ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger  ///
 i.Angestellter i.Arbeiter i.Azubi i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung))Beamter ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger i.Beamter ///
  i.Arbeiter i.Azubi i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE /// 
 i.Migrationshintergrund i.Schulbildung))Angestellter ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger i.Beamter ///
 i.Angestellter  i.Azubi i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung))Arbeiter ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger i.Beamter ///
 i.Angestellter i.Arbeiter  i.Soldaten i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung))Azubi ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger i.Beamter ///
 i.Angestellter i.Arbeiter i.Azubi  i.Sonstige  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung ))Soldaten ///
(logit, omit(i.Soloselbstaendiger i.Selbstaendiger i.Beamter ///
 i.Angestellter i.Arbeiter i.Azubi i.Soldaten  i.WiWZI i.WiWZPG /// 
 i.WiWZD i.BetriebsgroesseKlein i.BetriebsgroesseMittel i.Erwerbslos i.HHE ///
 i.Migrationshintergrund i.Schulbildung))Sonstige ///
(mlogit, omit(i.Schulbildung i.Alleinstehend i.HHE  i.BetriebsgroesseKlein ///
 i.BetriebsgroesseMittel i.WiWZI i.WiWZPG i.WiWZD i.Migrationshintergrund i.WBTeilnahme Taetigkeitsumfang /// 
 i.Soloselbstaendiger i.Selbstaendiger i.Beamter i.Angestellter i.Arbeiter i.Azubi i.Soldaten i.Sonstige )) ///
 Ausbildung ///
(mlogit,omit(i.Ausbildung i.Alleinstehend i.HHE  i.BetriebsgroesseKlein ///
 i.BetriebsgroesseMittel i.WiWZI i.WiWZPG i.WiWZD i.Migrationshintergrund i.WBTeilnahme Taetigkeitsumfang /// 
 i.Soloselbstaendiger i.Selbstaendiger i.Beamter i.Angestellter i.Arbeiter i.Azubi i.Soldaten i.Sonstige ) )Schulbildung ///
(ologit) NE HHE ///
(regress, omit(i.Erwerbslos)) Taetigkeitsumfang (regress) EF44 Kinderzahl, augment add(5) burn(10) nois
 
 ******************************************************************************************************************************
 *********************************************************Auswertung***********************************************************
*******************************************************************************************************************************
 
 
 
 *********************************************************************************************************************
 ******************************************************gewichtete Auswertung******************************************* 
 
 
 
 set more off
 
 *** erwartete Weiterbildungsbeteiligung 
 mi estimate, noisily saving(miest, replace): logit WBTeilnahme i.Soloselbstaendiger i.Selbstaendiger i.Beamter i.Angestellter ///
 i.Arbeiter i.Azubi i.Soldaten i.Sonstige i.Erwerbslos i.skills i.WiWZI i.WiWZPG i.WiWZD i.BetriebsgroesseKlein ///
 i.BetriebsgroesseMittel i.Migrationshintergrund  i.Alleinstehend   i.Frau ///
 i.Schulbildung i.Ausbildung i.NE i.HHE c.Taetigkeitsumfang c.EF44 i.Alleinstehend##c.Kinderzahl [iw=EF953] 
 
 mi predict WBE2 using miest, xb
 gen WBp2=invlogit(WBE2) 
 
 
 ******erwartet in Kreisen (gewichtet)-> das brauche ich
 keep if EF30!=3 & EF44>=25
 sort Kreise2014
 table Kreise2014 [iw=EF953], contents(sum WBp2)
  
 *** beobachtet in Kreisen (gewichtet)-> das brauche ich
 tab Kreise2014 WBTeilnahme [iw=EF953] if WBp2!=. 

 
 
 
 *****erwartet in Bundesländern (gewichtet)-> das brauche ich
 sort EF1
 table EF1[iw=EF952], contents(sum WBp2)
  ***beobachtet in Bundesländern (gewichtet)-> das brauche ich
 tab EF1 WBTeilnahme [iw=EF952] if WBp2!=. 
 
 
 
 
 ******Alle BRD -> das brauche ich
 ***erwartet (gewichtet) -> das brauche ich
 sum WBp2 [iw=EF952]
 dis r(sum)
 
 ***beobachtet (gewichtet)-> das brauche ich
 tab WBTeilnahme [iw=EF952]
 tab WBTeilnahme [iw=EF952] if WBp2!=. 

 
 
*********************************************************************************************************************
 ******************************************************ungewichtete Auswertung******************************************* 
 
 
 
 
 
 *** erwartete Weiterbildungsbeteiligung 
 mi estimate, noisily saving(miest, replace): logit WBTeilnahme i.Soloselbstaendiger i.Selbstaendiger i.Beamter i.Angestellter ///
 i.Arbeiter i.Azubi i.Soldaten i.Sonstige i.Erwerbslos i.skills i.WiWZI i.WiWZPG i.WiWZD i.BetriebsgroesseKlein ///
 i.BetriebsgroesseMittel i.Migrationshintergrund  i.Alleinstehend   i.Frau ///
 i.Schulbildung i.Ausbildung i.NE i.HHE c.Taetigkeitsumfang c.EF44 i.Alleinstehend##c.Kinderzahl  
 
 mi predict WBE3 using miest, xb
 gen WBp3=invlogit(WBE3) 
 
 
 ******erwartet in Kreisen 
 keep if EF30!=3 & EF44>=25
 sort Kreise2014
 table Kreise2014, contents(sum WBp3)
  
 *** beobachtet in Kreisen -> das brauche ich
 tab Kreise2014 WBTeilnahme if WBp3!=. 

 
 
 
 *****erwartet in Bundesländern
 sort EF1
 table EF1, contents(sum WBp3)
  ***beobachtet in Bundesländern -> das brauche ich
 tab EF1 WBTeilnahme if WBp3!=. 
 
 
 
 
 ******Alle BRD 
 ***erwartet 
 sum WBp3 
 dis r(sum)
 
 ***beobachtet -> das brauche ich
 tab WBTeilnahme 
 tab WBTeilnahme if WBp3!=.  

log close

exit
 
 


log close

exit




