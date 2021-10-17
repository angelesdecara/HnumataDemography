library("vcfR")
library("adegenet")
library("geosphere")
library("nlme")

library("vegan")
library("geosphere")
library("tidyverse")
fstnums=read.csv("FstNumataPairs.csv",header=T)
popscoords=read.csv("CoordsNumata.csv",header=T)

geo=data.frame(popscoords$Decimal.Longitude, popscoords$Decimal.Latitude)
#
#need to build a df with fst and lats and long of each or dataframe of fst distances
#and resort
FstCoords=fstnums
#now add long and lat
popsN=as.data.frame(unique(fstnums$Pop1))
names(popsN)[names(popsN)=="unique(fstnums$Pop1)"]="populations"
#names(popsN)[1]="populations"
#need to add last rrow of LaMerced
popsN=popsN %>% add_row(populations="LaMerced")
 popsN$latitude=popscoords$Decimal.Latitude[match(popsN$populations,popscoords$Population)]
 popsN$longitude=popscoords$Decimal.Longitude[match(popsN$populations,popscoords$Population)]

geo=data.frame(popsN$longitude,popsN$latitude)
#geographic data frame - haversine distance
d.geo = distm(geo, fun = distHaversine)
dist.geo = as.dist(d.geo)

 matfst=matrix(0,ncol=length(popsN$populations),nrow=length(popsN$populations))
 rownames(matfst)=colnames(matfst)=popsN$populations


for(i in seq(from=1,to=length(popsN$populations)-1)){for(j in seq(from=i+1,to=length(popsN$populations))){
        a=popsN$populations[i]
        b=popsN$populations[j]
        matfst[i,j]=fstnums[fstnums$Pop1==a&fstnums$Pop2==b,]$Fst
        matfst[j,i]=matfst[i,j]
        matfst[i,i]=0
}}
ibdfst=matfst/(1-matfst)
 numdistfst=mantel(as.dist(ibdfst),dist.geo,method = "spearman", permutations = 99999, na.rm = TRUE)
 
 #let's see without Brazil
#Brazil is pop 5
#
numNoBrPops=popsN[-7,]
numfstNoBr=matrix(0,ncol=length(numNoBrPops$populations),nrow=length(numNoBrPops$populations))
rownames(numfstNoBr)=colnames(numfstNoBr)=numNoBrPops$populations
#
for(i in seq(from=1,to=length(numNoBrPops$populations)-1)){for(j in seq(from=i+1,to=length(numNoBrPops$populations))){
   a=numNoBrPops$populations[i]
   b=numNoBrPops$populations[j]
   numfstNoBr[i,j]=fstnums[fstnums$Pop1==a&fstnums$Pop2==b,]$Fst
   numfstNoBr[j,i]=numfstNoBr[i,j]
   numfstNoBr[i,i]=0
}}
#distances without Brazil
NoBrgeo=data.frame(numNoBrPops$longitude,numNoBrPops$latitude)
#geographic data frame - haversine distance
NoBr.geo = distm(NoBrgeo, fun = distHaversine)
NoBrdist.geo = as.dist(NoBr.geo)

#other heliconius
#
elev=read.csv('FstElevatus.csv',header=T)
parda=read.csv('FstPardalinus.csv',header=T)
#
#remove Sergestus
pardaWserg=parda
parda=parda[parda$Pop1!='Pa_Ser'&parda$Pop_2!='Pa_Ser']

melp=read.csv('FstMelpomene.csv',header=T)
hec=read.csv('FstHecale.csv',hea=T)

Hfstmatrix <- function(species){ #insert csv with header Pop1,Pop2,Fst,Distance,Species
   pops=as.data.frame(unique(species$Pop1))
   popb=setdiff(species$Pop2,species$Pop1)
   colnames(pops)="Populations"
   pops=pops %>% add_row(Populations=popb)
   matfst=matrix(0,ncol=length(pops$Populations),nrow=length(pops$Populations))
   rownames(matfst)=colnames(matfst)=pops$Populations
         #now distance has to be a matrix
      dist=matrix(0,ncol=length(pops$Populations),nrow=length(pops$Populations))
   rownames(dist)=colnames(dist)=pops$Populations
   for(i in seq(from=1,to=length(pops$Populations)-1)){for(j in seq(from=i+1,to=length(pops$Populations))){
      a=pops$Populations[i]
      b=pops$Populations[j]
      if(length(species[species$Pop1==a&species$Pop2==b,]$Fst)>0){
      #if(a %in% as.vector(species$Pop1) & b %in% as.vector(species$Pop2)){
      #pops$Populations[i] %in% as.vector(species$Pop1) {
      #$Populations[j] %in% as.vector(species$Pop2)){
       #       a,b,i,j
        matfst[i,j]=species[species$Pop1==a&species$Pop2==b,]$Fst
        matfst[j,i]=matfst[i,j]
        matfst[i,i]=0
        dist[i,j]=species[species$Pop1==a&species$Pop2==b,]$Distance
        dist[j,i]=dist[i,j]
        dist[i,i]=0
       }else { #if a in Pop2 and b in Pop1       
        matfst[i,j]=species[species$Pop2==a&species$Pop1==b,]$Fst
        matfst[j,i]=matfst[i,j]
        matfst[i,i]=0
        dist[i,j]=species[species$Pop2==a&species$Pop1==b,]$Distance
        dist[j,i]=dist[i,j]
        dist[i,i]=0
       }
  }}
  dist=as.dist(dist)
  cosa=list(matfst,dist)
  return(cosa)
}
#in order to test slope differences, use gls like this
#gls(Fst ~ Distance, data=hec)

fstnumsNoBr=fstnums[fstnums$Pop1!="Brazil"&fstnums$Pop2!="Brazil",]
#
#lets build a dataframe with all heliconii with column n species
#numata's species are a tad diff to work with
fstnums$Species=as.character(fstnums$Species)
fstnums[fstnums$Species=="H.numata (Amazon)",]$Species="NumataAmazon"
fstnums[fstnums$Species=="H.numata (Brazil) vs H.numata (Amazon)",]$Species="NumataBrazil"
#
#FstElevatus.csv  FstHecale.csv    FstMelpomene.csv    FstPardalinus.csv
#FstEthilla.csv   FstIsmenius.csv  FstNumataPairs.csv
#
eth=read.csv("FstEthilla.csv",hea=T)
ism=read.csv("FstIsmenius.csv",hea=T)
allfst=rbind(hec,fstnums,melp,elev,parda,eth,ism)

library(lsmeans)
inter=lm(Fst ~ Distance*Species,data=allfst)
#anova(inter)
lst=lstrends(inter,"Species",var="Distance")
# Compare slopes
pairs(lst)
#just numatas
numinter=lm(Fst~Distance*Species,data=fstnums)
#let's make all non numata OtherHelico
NonNumfst=rbind(hec,melp,elev,parda,eth,ism)
NonNumfst$Species=as.character(NonNumfst$Species)
NonNumfst$Species="OtherHeliconii"
#not to mess with species
allbutBrfst=rbind(NonNumfst,fstnums[fstnums$Species!="NumataBrazil",])
inter.allbutBrfst=lm(Fst~Distance*Species,data=allbutBrfst)
st.allbutBrfst=lstrends(inter.allbutBrfst,"Species",var="Distance")
#not to distinguish amazon/brazil
allnumsnorig=fstnums
allnumsnorig$Species="Numata"
allNoOrig=rbind(allnumsnorig,NonNumfst)
 interNoOrig=lm(Fst~Distance*Species,data=allNoOrig)
stNoOrig=lstrends(interNoOrig,"Species",var="Distance")


#
#
# numata with and without chr 15, mapped scaffolds only (ie Hmel201 up to Hmel222)
#
numwith=read.csv('FstNumatawith.csv',hea=T)
numwout=read.csv('FstNumataWithout.csv',hea=T)
#
#let's check slopes with and without brazilian samples, as in
#fstnumsNoBr=fstnums[fstnums$Pop1!="Brazil"&fstnums$Pop2!="Brazil",]
#
withregress=lm(Fst~Distance,data=numwith)
summary(withregress)
#need to merge both with a different species/something to see interaction
#now with chr15 but withouut Brazilian
withNoBr=numwith[numwith$Pop1!="Brazil"&numwith$Pop2!="Brazil",]
 withoutNoBr=numwout[numwout$Pop1!="Brazil"&numwout$Pop2!="Brazil",] #and without
 #slopes anf sig
regWithNoBr=lm(Fst~Distance,data=withNoBr)
regWithoutNoBr=lm(Fst~Distance,data=withoutNoBr)
#
#to check interaction distance-Brazil, let's rename column Species
#
numwith$Species=as.character(numwith$Species)
 numwith[numwith$Species=="H.numata (Amazon)",]$Species="NumataAmazon"
 numwith[numwith$Species=="H.numata (Brazil) vs H.numata (Amazon)",]$Species="NumataBrazil"
 #
 with15inter=lm(Fst~Distance*Species,data=numwith)
 lstrends(with15inter,"Species",var="Distance")
 pairs(lstrends(with15inter,"Species",var="Distance"))
 
 #now without
numwout$Species=as.character(numwout$Species)
numwout[numwout$Species=="H.numata (Amazon)",]$Species="NumataAmazon"
 numwout[numwout$Species=="H.numata (Brazil) vs H.numata (Amazon)",]$Species="NumataBrazil"
woutinter=lm(Fst~Distance*Species,data=numwout)
