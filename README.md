# kml2csv
This R script transfers point coordinates in a Google Earth .kml file to a csv file.
NOTE: only point coordinates are written out. No other types of geographic info will be extracted 

Example run:
> source("POINTS_kml2csv.R")
> 
> When you see the prompt "KML file: ", type in the file name (e.g., mydata.kml) ## NOTE: .kml needs to be included

Then a .csv file of the same file name will be written out in the working directory. The output has four columns: site name, longitude, latitude, and altitude.
