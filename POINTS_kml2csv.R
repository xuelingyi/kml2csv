input = readline(prompt = "KML file: ")

POINTS_kml2csv = function(input, ...){
  KML = readLines(input)
  
  names = grep("<name>", KML)[-1]
  points = grep("<Point>", KML)
  
  data = KML[sort(c(names, points, points+1))]
  output = as.data.frame(matrix(ncol = 4))
  names(output) = c("site.name", "longitude", "latitude", "altitude")
  i=1
  while (i < length(data)){
    
    if (data[i+1] == "\t\t<Point>") {## this is the name of a point
      
      name = gsub("\t\t<name>", "", data[i])
      name = gsub("</name>", "", name)
      
      point = gsub("\t\t\t<coordinates>", "", data[i+2])
      point = gsub("</coordinates>", "", point)
      point = unlist(strsplit(point, split=","))
        
      output = rbind(output, c(name, point))
    }
    
    i = i+1
  }
  
  output = output[-1, ] #remove the NA row
  write.csv(output, file = gsub("kml", "csv", input), row.names = F)
}

POINTS_kml2csv(input)

