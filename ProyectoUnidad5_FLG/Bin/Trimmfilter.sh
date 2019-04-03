#This script is for cleaning the data in order to be used with ipyrad

#To celan de data with Trimmomatic
for i in *fastaq.gz; do java -jar ../../Programas/Trimmomatic-0.38/trimmomatic-0.38jar SE -phredd 33 $i ..clean_seq/clean_$i SLIDINGWINDOW:4:20; done.
#This command is for trimmomatic to be used  on all fastq samples in the current directory. It executes the filtering with quality scores of phred-33 and with a trimming sliding window of 4 and quality filter of 20
