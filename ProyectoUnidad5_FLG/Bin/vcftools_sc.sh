#This script contains commands used in vcftools

vcftools="sudo docker run --rm -v /home/alex/Fer_Project/subdata_outfiles:/data biocontainers/vcftools:0.1.15 vcftools"
#This command runs vcftools by using a container from biocontainers

#Filtering missing data sites
$vcftools --vcf subdata.vcf --max-missing 0.5 --recode --out etrai_max

#Obtaining pi
$vcftools --vcf etrai_max.vcf --site-pi

#Obtaining Tajima's D
$vcftools --vcf etrai_max.vcf --TajimaD 10000

#Getting the heterozygosity
$vcftools --vcf etrai_max.vcf --het
