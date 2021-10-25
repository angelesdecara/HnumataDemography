Script and input files used to run the G-PhoCs analysis. 
G-PhoCs was installed on ~/G-PhoCS/bin/G-PhoCS which is available from https://github.com/gphocs-dev/G-PhoCS

Trace files were later examined with Tracer (http://tree.bio.ed.ac.uk/software/tracer/) to check for convergence.
Last 100000 mcmc iterations were stored and mean and standard deviation obtained with TauTheta.r

FromCsvToInputPlotInYears.f90 converts time units into years and returns a script to produce a script (InYearsscriptToPlotwabc) to plot the results with gnuplot
