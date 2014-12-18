# how to use the converter

#1 : you want to convert your freemindFile in Hdoc
- put your freemind file in the mapMapping_to_Hdoc 
- enter the command line :
	- linux : ant -buildfile mapMapping2Hdoc.ant -DinputPath <yourFilename>
	- windows : C:\ant\bin\ant -buildfile mapMapping2Hdoc.ant -DinputPath <yourFilename>

you will find the result in the folder result/hdoc

#2 : you want a .scar (for scenari)
- put your freemind file in the mapMapping_to_Hdoc 
- enter the command line :
	- linux : ant -buildfile mapMapping2Hdoc.ant -DinputPath <yourFilename>  -Dopale true
	- windows : C:\ant\bin\ant -buildfile mapMapping2Hdoc.ant -DinputPath <yourFilename>  -Dopale true
you will find the result in the folder result/opale

