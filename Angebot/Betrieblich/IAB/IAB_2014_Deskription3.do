* Programmdatei des Projektes "Chancenindex" fdz1492 - 2014_Deskription3.do
* Inhalt: Deskription
* Aggregationsniveau: Branchen (3-Steller), Bundeslaender

clear


captur log close


log using "$log\2014_Deskription3.log", replace

use "$data\2014_3.dta"
 
set more off
*** Dummy wissensintensive Industrie
tab wzwInd08
sum wzwInd08

*** Dummy wissensintensives verarbeitendes Gewerbe
tab wzwVG08
sum wzwVG08

*** Dummy wissensintensive Dienstleistung
tab wzwD08
sum wzwD08

*** Dummys Bundeslaender
tab bl01
sum bl01

tab bl02
sum bl02

tab bl03
sum bl03

tab bl04
sum bl04

tab bl05
sum bl05

tab bl06
sum bl06
 
tab bl07
sum bl07

tab bl08
sum bl08

tab bl09
sum bl09

tab bl010
sum bl010

tab bl011
sum bl011

tab bl012
sum bl012

tab bl013
sum bl013

tab bl014
sum bl014

tab bl015
sum bl015

tab bl016
sum bl016

*** Dummys Weiterbildungsaktivitaeten
tab wb
sum wb

tab wba
sum wba

tab wbb
sum wbb

tab wbc
sum wbc

tab wbd
sum wbd

tab wbe
sum wbe

tab wbf
sum wbf

tab wbg
sum wbg

tab wbh
sum wbh

*** Sozialversicherungspflichtig beschaeftiget

sum v01svb14 

tab SVB9
sum SVB9

tab SVB19
sum SVB19

tab SVB49
sum SVB49

tab SVB50
sum SVB50

log close 













