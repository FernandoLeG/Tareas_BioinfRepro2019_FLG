# Population genetics of United States' *Empidonax traillii* populations

This project will be based on the data publidshed by Ruegg et. al, 2018.
They used Rad loci for analyses of landscape genomics and climate change vulnearability, but aside form FST values, no population genetics anlyses were done.The data set has a large geogrpahic reprentation and sample numbers making it ideal for population genetics and phylogeography. 
The data available for download is not ready for anlysis as it is comprised of the raw reads, so prior filtering and clutering analyses will be done, using trimmomatic and ipyrad.
VCFtools will be used to obtain population genetics statistics.
The R package LEA will be used to assess genetic structure for the populations considered.

# Organization of the project

## Directories for the data

Directory 'ProyectoUnidad5_FLG/Data/ This directoy contains the files that reference de data in the analyses

## Directories containing scripts

Directory 'ProyectoUnidad5_FLG/bin' This folder will contain folders with the scripts used in the project and will be presented in order of usage.

Directory 'ProyectoUnidad5_FLG/bin/clustering Thid folder contains the script used for trimmomatic and ipyrad.

Directory 'ProyectoUnidad5_FLG/bin/vcftools' This folder will cotain the scripts ofr obtaining population gentics statistics in vcftools.

Directory 'ProyectoUnidad5_FLG/Data/LEA' This folder will contain the scripts for the genetic structure analyses done using LEA.




 
