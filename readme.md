
The goal of this tool is to convert mind mapping files from [Freemind](http://freemind.sourceforge.net/wiki/index.php/Main_Page) to Hdoc file for [Scenari](http://scenari-platform.org/projects/scenari/fr/pres/co/).
A map mapping can be convert to structured document.


# How to use the converter

##1 : you want to convert your freemindFile in Hdoc
- put your freemind file in the mindMapping_to_Hdoc 
- enter the command line :
	- linux : ant -buildfile mindMapping2Hdoc.ant -DinputPath <yourFilename>
	- windows : C:\ant\bin\ant -buildfile mindMapping2Hdoc.ant -DinputPath <yourFilename>

you will find the result in the folder result/hdoc

##2 : you want a .scar (for scenari)
- put your freemind file in the mindMapping_to_Hdoc 
- enter the command line :
	- linux : ant -buildfile mindMapping2Hdoc.ant -DinputPath <yourFilename>  -Dopale true
	- windows : C:\ant\bin\ant -buildfile mindMapping2Hdoc.ant -DinputPath <yourFilename>  -Dopale true
you will find the result in the folder result/opale

-------------------
[Website](https://stph.scenari-community.org/nf29/co/nf29.html)
