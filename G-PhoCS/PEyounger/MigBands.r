library(HDInterval)
library(sfsmisc)
datos=read.table(file="6576.log",header=TRUE)
####### BEWARE! The last mig bands assume numata split younger than PE!!!
## I am changing them to younger PE - the time to multiply is not tau_Numata but tau_PE 
###################
sink("TMigBands6576.csv",append=FALSE,split=FALSE)
##
temp=density(datos$m_Numata..Ismenius*(datos$tau_IN-datos$tau_Numata)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Numata..Ismenius*(datos$tau_IN-datos$tau_Numata)",mean(datos$m_Numata..Ismenius*(datos$tau_IN-datos$tau_Numata)/10),sqrt(var(datos$m_Numata..Ismenius*(datos$tau_IN-datos$tau_Numata)/10)), hdi(datos$m_Numata..Ismenius*(datos$tau_IN-datos$tau_Numata)/10)[[1]], hdi(datos$m_Numata..Ismenius*(datos$tau_IN-datos$tau_Numata)/10)[[2]], b))
temp=density(datos$m_Ismenius..Numata*(datos$tau_IN-datos$tau_Numata)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Ismenius..Numata*(datos$tau_IN-datos$tau_Numata)",mean(datos$m_Ismenius..Numata*(datos$tau_IN-datos$tau_Numata)/10),sqrt(var(datos$m_Ismenius..Numata*(datos$tau_IN-datos$tau_Numata)/10)), hdi(datos$m_Ismenius..Numata*(datos$tau_IN-datos$tau_Numata)/10)[[1]], hdi(datos$m_Ismenius..Numata*(datos$tau_IN-datos$tau_Numata)/10)[[2]], b))
#
temp=density(datos$m_Elevatus..Pardalinus*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Elevatus..Pardalinus*(datos$tau_PE)",mean(datos$m_Elevatus..Pardalinus*(datos$tau_PE)/10),sqrt(var(datos$m_Elevatus..Pardalinus*(datos$tau_PE)/10)), hdi(datos$m_Elevatus..Pardalinus*(datos$tau_PE)/10)[[1]], hdi(datos$m_Elevatus..Pardalinus*(datos$tau_PE)/10)[[2]], b))
temp=density(datos$m_Pardalinus..Elevatus*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Pardalinus..Elevatus*(datos$tau_PE)",mean(datos$m_Pardalinus..Elevatus*(datos$tau_PE)/10),sqrt(var(datos$m_Pardalinus..Elevatus*(datos$tau_PE)/10)), hdi(datos$m_Pardalinus..Elevatus*(datos$tau_PE)/10)[[1]], hdi(datos$m_Pardalinus..Elevatus*(datos$tau_PE)/10)[[2]], b))
#
temp=density(datos$m_PE..IN*(datos$tau_PEIN-datos$tau_IN)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_PE..IN*(datos$tau_PEIN-datos$tau_IN)",mean(datos$m_PE..IN*(datos$tau_PEIN-datos$tau_IN)/10),sqrt(var(datos$m_PE..IN*(datos$tau_PEIN-datos$tau_IN)/10)), hdi(datos$m_PE..IN*(datos$tau_PEIN-datos$tau_IN)/10)[[1]], hdi(datos$m_PE..IN*(datos$tau_PEIN-datos$tau_IN)/10)[[2]], b))
#
temp=density(datos$m_IN..PE*(datos$tau_PEIN-datos$tau_IN)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_IN..PE*(datos$tau_PEIN-datos$tau_IN)",mean(datos$m_IN..PE*(datos$tau_PEIN-datos$tau_IN)/10),sqrt(var(datos$m_IN..PE*(datos$tau_PEIN-datos$tau_IN)/10)), hdi(datos$m_IN..PE*(datos$tau_PEIN-datos$tau_IN)/10)[[1]], hdi(datos$m_IN..PE*(datos$tau_PEIN-datos$tau_IN)/10)[[2]], b))
temp=density(datos$m_PEIN..Cydno*(datos$tau_CPEIN-datos$tau_PEIN)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_PEIN..Cydno*(datos$tau_CPEIN-datos$tau_PEIN)",mean(datos$m_PEIN..Cydno*(datos$tau_CPEIN-datos$tau_PEIN)/10),sqrt(var(datos$m_PEIN..Cydno*(datos$tau_CPEIN-datos$tau_PEIN)/10)), hdi(datos$m_PEIN..Cydno*(datos$tau_CPEIN-datos$tau_PEIN)/10)[[1]], hdi(datos$m_PEIN..Cydno*(datos$tau_CPEIN-datos$tau_PEIN)/10)[[2]], b))
temp=density(datos$m_Cydno..PEIN*(datos$tau_CPEIN-datos$tau_PEIN)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Cydno..PEIN*(datos$tau_CPEIN-datos$tau_PEIN)",mean(datos$m_Cydno..PEIN*(datos$tau_CPEIN-datos$tau_PEIN)/10),sqrt(var(datos$m_Cydno..PEIN*(datos$tau_CPEIN-datos$tau_PEIN)/10)), hdi(datos$m_Cydno..PEIN*(datos$tau_CPEIN-datos$tau_PEIN)/10)[[1]], hdi(datos$m_Cydno..PEIN*(datos$tau_CPEIN-datos$tau_PEIN)/10)[[2]], b))
#
temp=density(datos$m_NumataA..NumataB*(datos$tau_Numata)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_NumataA..NumataB*(datos$tau_Numata)",mean(datos$m_NumataA..NumataB*(datos$tau_Numata)/10),sqrt(var(datos$m_NumataA..NumataB*(datos$tau_Numata)/10)), hdi(datos$m_NumataA..NumataB*(datos$tau_Numata)/10)[[1]], hdi(datos$m_NumataA..NumataB*(datos$tau_Numata)/10)[[2]], b))
#
temp=density(datos$m_NumataB..NumataA*(datos$tau_Numata)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_NumataB..NumataA*(datos$tau_Numata)",mean(datos$m_NumataB..NumataA*(datos$tau_Numata)/10),sqrt(var(datos$m_NumataB..NumataA*(datos$tau_Numata)/10)), hdi(datos$m_NumataB..NumataA*(datos$tau_Numata)/10)[[1]], hdi(datos$m_NumataB..NumataA*(datos$tau_Numata)/10)[[2]], b))
#
# contemporaries introduced : pardalinus-numataA, pardalinus-numataB, elevatus-numataA, elevatus-numataB
# need to multiply by tau_PE as PE is younger than Numata split
#
temp=density(datos$m_Pardalinus..NumataA*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Pardalinus..NumataA*(datos$tau_PE)",mean(datos$m_Pardalinus..NumataA*(datos$tau_PE)/10),sqrt(var(datos$m_Pardalinus..NumataA*(datos$tau_PE)/10)), hdi(datos$m_Pardalinus..NumataA*(datos$tau_PE)/10)[[1]], hdi(datos$m_Pardalinus..NumataA*(datos$tau_PE)/10)[[2]], b))
#
temp=density(datos$m_NumataA..Pardalinus*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_NumataA..Pardalinus*(datos$tau_PE)",mean(datos$m_NumataA..Pardalinus*(datos$tau_PE)/10),sqrt(var(datos$m_NumataA..Pardalinus*(datos$tau_PE)/10)), hdi(datos$m_NumataA..Pardalinus*(datos$tau_PE)/10)[[1]], hdi(datos$m_NumataA..Pardalinus*(datos$tau_PE)/10)[[2]], b))
#
temp=density(datos$m_Elevatus..NumataA*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Elevatus..NumataA*(datos$tau_PE)",mean(datos$m_Elevatus..NumataA*(datos$tau_PE)/10),sqrt(var(datos$m_Elevatus..NumataA*(datos$tau_PE)/10)), hdi(datos$m_Elevatus..NumataA*(datos$tau_PE)/10)[[1]], hdi(datos$m_Elevatus..NumataA*(datos$tau_PE)/10)[[2]], b))
#
#
#
temp=density(datos$m_NumataA..Elevatus*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_NumataA..Elevatus*(datos$tau_PE)",mean(datos$m_NumataA..Elevatus*(datos$tau_PE)/10),sqrt(var(datos$m_NumataA..Elevatus*(datos$tau_PE)/10)), hdi(datos$m_NumataA..Elevatus*(datos$tau_PE)/10)[[1]], hdi(datos$m_NumataA..Elevatus*(datos$tau_PE)/10)[[2]], b))
#
# now numataB
#
temp=density(datos$m_Pardalinus..NumataB*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Pardalinus..NumataB*(datos$tau_PE)",mean(datos$m_Pardalinus..NumataB*(datos$tau_PE)/10),sqrt(var(datos$m_Pardalinus..NumataB*(datos$tau_PE)/10)), hdi(datos$m_Pardalinus..NumataB*(datos$tau_PE)/10)[[1]], hdi(datos$m_Pardalinus..NumataB*(datos$tau_PE)/10)[[2]], b))
#
temp=density(datos$m_NumataB..Pardalinus*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_NumataB..Pardalinus*(datos$tau_PE)",mean(datos$m_NumataB..Pardalinus*(datos$tau_PE)/10),sqrt(var(datos$m_NumataB..Pardalinus*(datos$tau_PE)/10)), hdi(datos$m_NumataB..Pardalinus*(datos$tau_PE)/10)[[1]], hdi(datos$m_NumataB..Pardalinus*(datos$tau_PE)/10)[[2]], b))
#
temp=density(datos$m_Elevatus..NumataB*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Elevatus..NumataB*(datos$tau_PE)",mean(datos$m_Elevatus..NumataB*(datos$tau_PE)/10),sqrt(var(datos$m_Elevatus..NumataB*(datos$tau_PE)/10)), hdi(datos$m_Elevatus..NumataB*(datos$tau_PE)/10)[[1]], hdi(datos$m_Elevatus..NumataB*(datos$tau_PE)/10)[[2]], b))
#
#
#
temp=density(datos$m_NumataB..Elevatus*(datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_NumataB..Elevatus*(datos$tau_PE)",mean(datos$m_NumataB..Elevatus*(datos$tau_PE)/10),sqrt(var(datos$m_NumataB..Elevatus*(datos$tau_PE)/10)), hdi(datos$m_NumataB..Elevatus*(datos$tau_PE)/10)[[1]], hdi(datos$m_NumataB..Elevatus*(datos$tau_PE)/10)[[2]], b))
#
# Numata -PE
#
temp=density(datos$m_Numata..PE*(datos$tau_IN-datos$tau_Numata)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Numata..PE*(datos$tau_IN-datos$tau_Numata)",mean(datos$m_Numata..PE*(datos$tau_IN-datos$tau_Numata)/10),sqrt(var(datos$m_Numata..PE*(datos$tau_IN-datos$tau_Numata)/10)), hdi(datos$m_Numata..PE*(datos$tau_IN-datos$tau_Numata)/10)[[1]], hdi(datos$m_Numata..PE*(datos$tau_IN-datos$tau_Numata)/10)[[2]], b))
#
temp=density(datos$m_PE..Numata*(datos$tau_IN-datos$tau_Numata)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_PE..Numata*(datos$tau_IN-datos$tau_Numata)",mean(datos$m_PE..Numata*(datos$tau_IN-datos$tau_Numata)/10),sqrt(var(datos$m_PE..Numata*(datos$tau_IN-datos$tau_Numata)/10)), hdi(datos$m_PE..Numata*(datos$tau_IN-datos$tau_Numata)/10)[[1]], hdi(datos$m_PE..Numata*(datos$tau_IN-datos$tau_Numata)/10)[[2]], b))
#
# Ismenius -PE
#
temp=density(datos$m_Ismenius..PE*(datos$tau_IN-datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_Ismenius..PE*(datos$tau_IN-datos$tau_PE)",mean(datos$m_Ismenius..PE*(datos$tau_IN-datos$tau_PE)/10),sqrt(var(datos$m_Ismenius..PE*(datos$tau_IN-datos$tau_PE)/10)), hdi(datos$m_Ismenius..PE*(datos$tau_IN-datos$tau_PE)/10)[[1]], hdi(datos$m_Ismenius..PE*(datos$tau_IN-datos$tau_PE)/10)[[2]], b))
# PE-Ismenius
#
temp=density(datos$m_PE..Ismenius*(datos$tau_IN-datos$tau_PE)/10)
a=0.03
if(max(temp$x)<0.03)a=max(temp$x)
if(min(temp$x)>=0.03)a=min(temp$x)
b=0
b=integrate.xy(temp$x,temp$y,a,max(temp$x))
if(max(temp$x)<0.03)b=0
print(paste("datos$m_PE..Ismenius*(datos$tau_IN-datos$tau_PE)",mean(datos$m_PE..Ismenius*(datos$tau_IN-datos$tau_PE)/10),sqrt(var(datos$m_PE..Ismenius*(datos$tau_IN-datos$tau_PE)/10)), hdi(datos$m_PE..Ismenius*(datos$tau_IN-datos$tau_PE)/10)[[1]], hdi(datos$m_PE..Ismenius*(datos$tau_IN-datos$tau_PE)/10)[[2]], b))
sink()
