# Population genetics of United States' *Empidonax traillii* populations

This project will be based on the data publidshed by Ruegg et. al, 2018.
They used Rad loci for analyses of landscape genomics and climate change vulnearability, but aside form FST values, no population genetics anlyses were done.The data set has a large geogrpahic reprentation and sample numbers making it ideal for population genetics and phylogeography. 

# Organization of the project

## Directories for the data

Directory `ProyectoUnidad5_FLG/Data/` This directoy contains the files that reference de data in the analyses

Directory `ProyectoUnidad5_FLG/Data/Plots` this Directory contains the plots obtained form the analyses

Directory `ProyectoUnidad5_FLG/Data/Metadata` This directory has files tha reference order and names of the samples

## Directories containing scripts

Directory `ProyectoUnidad5_FLG/bin` This folder contains the scripts used in the project, the order noted in this README is the onde used for running the scripts

### 1. Trimmfilter.sh:
This script is for filtering the samples `/seq_or` with Trimmomatic before the ipyrad pipeline and writing the output files in `/clean_seq`. 

### 2. ipyradpipe.sh:
This script runs the ipyrad pipeline on the filtered samples in `/clean_seq`

### 3. vcftools_sc.sh:
This script contains line for doing obtaining population genetics satitstics using vcftools

### 4. LEA_sc.R:
This script contains the lines for building the genetic structure plot with the package LEA.
 
