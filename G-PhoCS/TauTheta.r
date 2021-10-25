library("HDInterval")
datos=read.table(file="wabc54.log",header=TRUE)
sink("TausThetasWabc.csv",append=FALSE,split=FALSE)
for (i in names(datos)[2:17]){
print(paste(i,mean(datos[[i]]/100),sqrt(var(datos[[i]]/100)),hdi(datos[[i]]/100)[[1]],hdi(datos[[i]]/100)[[2]])) }
 sink()

