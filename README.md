[![DOI](https://zenodo.org/badge/414560525.svg)](https://zenodo.org/badge/latestdoi/414560525)

# Demographic history and (lack of) isolation by distance in H. numata
Scripts and tools to analyse demographic history and isolation by distance (or lack of) in *Heliconius numata*, as described in
https://www.biorxiv.org/content/10.1101/2021.09.29.462348v1

Simon Martin provided several scripts (mostly available at https://github.com/simonhmartin), used to evaluate Fst, dxy and &pi; per scaffold and then averaged over the genome. We also used Ilan Gronau's G-PhoCS to infer demograpihic history (https://github.com/gphocs-dev/G-PhoCS).

PCA was calculated with plink (https://www.cog-genomics.org) and structure with admixture (http://dalexander.github.io/admixture/index.html).

In order to perform demographic inferences with G-PhoCS, we filtered out known genes, the scaffolds that include the inversions encoding the colour genes and linked regions. Repetitive regions were masked using RepeatMasker and Tandem Repeat Finder (Benson 1999). GC islands were detected with CpGcluster.pl and removed from the analyses. Once we had filtered out these regions and using only 12 individuals (2 *H. cydno* as outgroup, 2 Amazonian *H. numata*, 2 Atlantic *H. numata*, 2 *H. ismenius*, 2 *H. melpomene* and 2 *H. pardalinus*), we performed analyses with G-PhoCS without migration between their lineages and with several scenarios of migration.




