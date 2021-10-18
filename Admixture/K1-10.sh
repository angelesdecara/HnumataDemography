#!/bin/bash
for K in {1..10}; do
    admixture --cv Nu15PRotherNuNoMoyMinMac1MaxMac85MinAll2MaxAll2MaxMiss50.bed  $K | tee log${K}.out
done
