#!/bin/bash
#
#careful there are now 2 files per scaffold
dir=0csvAll
out=sitesMeanFst.dat
#dir=Wcoord10k100min
#out=CoordMeanFst.dat
head -1 ${dir}/Hmel201001*25*csv | cut -d"," -f1,72- | sed -e 's/,/ /g' > $out
#touch MeanFst.dat
filenames=(Hmel*csv)
gfortran MeanFst.f90
for i in $(ls ${dir}/Hmel*25*csv) ; do
    ./a.out "$i" "$out"
done
#
# average each column with GenomeFst.f90
#
gfortran GenomeFst.f90
./a.out "$out"
#
# see whether this works to transpose it
#WRD=$(head -n 1 $infile|wc -w);
#for((i=1;i<=$WRD;i++)); do
 #   awk '{print $'$i'}' $infile| tr '\n' ' ';echo;
#done
#it does!
