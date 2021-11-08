Scripts used to obtain Fst and Pi in all H. numata populations.
It requires a vcf file with at least all individuals in AllPopulationsBCF.txt and four folders where output will be stored for each scaffold (vcfAll/ genoAll/ filterAll/ and 0csvAll).
Firstly, we ran FstNumata.sh, which requires bcftools, python and Simon Martin's scripts from https://github.com/simonhmartin/genomics_general

It requires a vcf as input file with whole genome data, and every scaffold is separated into a different vcf file. Then we filtered each vcf as described in our manuscript and generated a .geno file for each scaffold.
Lastly, using Simon's script popgenWindows.py we obtained Fst between all populations described in AllPopulations.txt.

To obtain the mean Fst for the whole genome between populations, we used our own programs (MeanFst.f90 and GenomeFst.f90) using the script AverFstScaffs.sh. This script firstly averages Fst per scaffold and then obtains the mean in the genome.
