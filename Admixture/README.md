Input bed file and bash script to analyse clusters with Admixture. In order to choose the k number, we plotted the CV error vs. K, and the k with the minimum CV error is the most appropiate one.
To do that, in gnuplot


    set ylabel "CV error"
    set xlabel "K"
    p "<grep CV *out | awk '{print $3,$4}' |sed -e 's/(K=//g' -e 's/)://g' " u 1:2 w p pt 5 notitle


