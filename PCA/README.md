PCAs were obtained with plink from a vcf file of H. numata samples with the following options in a first go

  --allow-extra-chr
  --double-id
  --indep-pairwise 50 10 0.1
  --out plinkPruned50-10-0.1
  --set-missing-var-ids @:#
  --vcf ../AdmixtureOnlyNuNoMoyo/Nu15PRotherNuNoMoyMinMac1MaxMac85MinAll2MaxAll2MaxMiss50.recode.vcf

and then

  --allow-extra-chr
  --double-id
  --extract plinkPruned50-10-0.1.prune.in
  --make-bed
  --out PrunedNumataNoMoyo
  --pca
  --set-missing-var-ids @:#
  --vcf ../AdmixtureOnlyNuNoMoyo/Nu15PRotherNuNoMoyMinMac1MaxMac85MinAll2MaxAll2MaxMiss50.recode.vcf

