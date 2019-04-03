#This script contains the commands for running th ipyrad

#Creating the subdata parameter files
ipyrad -p params-etraillii2.txt -b subdata samplesk.text
#This command creates a paramete file with the samples specified in the samplesk.txt file

#Running ipyrad
ipyrad -fp params-subdata.txt -s 1234567
