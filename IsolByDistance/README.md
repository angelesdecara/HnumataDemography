Files and script required for the analysis of isolation by distance, as described in the supplementary text.

In R: 

`>source("Analyses.R")`

we can obtain the significance of the slope vs. distance and the effect of the group (i.e. species or population).

All Heliconii are analysed together firstly (inter), then just H. numata (numinter), and then within H. numata, testing the effect of removing the Brazilian samples (inter.allbutBrfst). 
Significance can be calculated using the function anova. For instance, for all Heliconii, in R

`>source("Analyses.R")`

`>allfst # shows all Fst for all Heliconii we have here`

`>anova(lm(Fst ~ Distance*Species,data=allfst))`


returns the significance of distance, species and their interaction in explaining the slope of Fst.

Similar analyses can be done within groups. For instance, `numwith` includes all H. numata and the variable Species refers to their geographical origin. Thus, in R, to compare slopes H. numata Amazonian with H. numata from Brazil

`with15inter=lm(Fst~Distance*Species,data=numwith)`

In an analogous manner, we can exclude regions of the genome including the inversions (`numwout`) and analyse the significance of the slope, the effect of analysing all H. numata together or excluding those from Brazil.
