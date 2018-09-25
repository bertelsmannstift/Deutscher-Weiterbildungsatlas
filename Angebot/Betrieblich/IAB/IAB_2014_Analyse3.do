* Programmdatei des Projektes "Deutscher Weiterbildungsatlas" fdz1492 - 2014_Analyse3.do
* Inhalt: Datenanalyse
* Aggregationsniveau: Branchen (3-Steller), Bundeslaender

clear


captur log close

log using "$log\2014_Analyse3.log", replace

use "$data\2014_3.dta"

*Analyse 

*** Regression Weiterbildungsverhalten a-h (ungewichtet)
set more off
** "weiterbildung gefoerdert"
logit wb SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wb SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "externe Kurse"
logit wba SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wba SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "interne Kurse"
logit wbb SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbb SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "wb am Arbeitsplatz"
logit wbc SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbc SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "Vortraege Tagungen"
logit wbd SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbd SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "Arbeitsplatzwecksel"
logit wbe SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbe SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "selbstgesteuerte wb"
logit wbf SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbf SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "Qual.-/Werkstattzirkel"
logit wbg SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbg SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

** "Sonstige"
logit wbh SVB9 SVB19 SVB49 wzwInd08 wzwVG08  wzwD08, iterate(100)
logit wbh SVB9 SVB19 SVB49 bl01 bl02 bl03 bl04 bl06 bl07 bl08 bl09 bl010 bl011 bl012 bl013 bl014 bl015 bl016   wzwInd08 wzwVG08  wzwD08, iterate(100)

log close

