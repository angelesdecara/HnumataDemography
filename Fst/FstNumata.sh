#!/bin/bash
# Define shell to use for this job (/bin/sh here)
#$ -S /bin/sh
# Job name
#$ -N WholeAll
# Using current working directory (otherwise, you will have to use '#$ wd /path/to/run')
#$ -cwd
# job time limits (h_rt is required [s_rt == software time limit / h_rt == hardware time limit])
#$ -l h_rt=468:00:00
# choose to run on a specific queue
# (qconf -sql (to list queues) qconf -sq queue_name (to print informations on this queue))
###########$ -q cemeb20.q
#$ -q mem.q
# Get a mail when the job begins, ends or is suspended
#$ -m ebs
#$ -M angeles.decara@cefe.cnrs.fr
# Redirects the standard output to the named file.
#$ -o 0wholeAllBcf.out
##$ -e 0wholeAllBcf.err
# merge standard and error outputs
#$ -j y
# Export all my environment variables into job runtime context
#$ -V
module load vcftools/0.1.17 bcftools-1.3 htslib-1.2.1
#
# calculation for all populations
#
while read chr length; do
    if [ $length -gt 25000 ] 
    then
        echo $chr
        bcftools view -r ${chr} -S AllPopulationsBCF.txt -i'(TYPE="SNP"|TYPE="REF")&AN>0' /share/heliconius/Data/VCF/Hmel2/Hmel2NuNameWoCO1.vcf.gz > vcfAll/${chr}.vcf
        #echo "$chr selected"
        bgzip vcfAll/${chr}.vcf
        python2.7 ~/bin/genomics_general/VCF_processing/parseVCF.py -i vcfAll/${chr}.vcf.gz --gtf flag=DP min=8 max=200 --skipIndels -o genoAll/${chr}.geno.gz
        bcftools filter -e 'FORMAT/DP<10 | FORMAT/DP>200' vcfAll/${chr}.recode.vcf.gz | bcftools query -f '%CHROM\t%POS[\t%TGT]\n' | sed -e 's/\./N/g' | cat headerAll - | gzip > genoAll/${chr}.geno.gz
#
        #python2.7 ~/bin/genomics_general/filterGenotypes.py --minCalls 3 --minVarCount 2 --maxHet 0.9 --inputGenoFormat phased --podSize 5000 -i genoAll/${chr}.geno.gz -o filterAll/${chr}.filter.gz
#
        python ~/bin/genomics_general/popgenWindows.py -p Moyobamba -p Urahuasha -p Michaela -p Tunel -p FG -p Colombia -p Brazil -p Ecuador -p MadreDios -p PuertoBermudez -p LaMerced --windType sites -w 25000 --overlap 0 --popsFile AllPopulations.txt --genoFile filterAll/${chr}.filter.gz --genoFormat phased --outFile 0csvAll/${chr}.25kOv10k.csv
    fi
done < ScaffoldsNoSymb
