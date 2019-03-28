# Readme

This readme contains scripts for de bioinformatic processes before the analyses made

For data processing in trimmomatic


`For i in *fastq.gz; do java -jar ../../Descargas/Trimmomatic-0.38/trimmomatic-0.38.jar SE -phred33 $i ../clean_seq/clean_$i SLIDINGWINDOW:4:20; done` This command is for trimmomatic to be used on all fastq samples in a given folder. It executes the filtering with qulity scores of phred-33 and an dwitha trimming sliding window of 4 and quality filter of 20

`ipyrad -fp params-etraillii2.txt -s 1234567`

Creating the subdata array

`ipyrad -p params-estraillii2.txt -b subdata samplesk.txt`

This command creates a subdata for step of ipyrad to work with

Running the remaining steps with de subdata array

`ipyrad -fp params-subdata.txt -s 4567`



