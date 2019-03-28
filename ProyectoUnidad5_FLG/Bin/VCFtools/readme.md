# README

Running vcftools 

`vcftools="sudo docker run --rm -v /home/alex/Fer_Project/subdata_outfiles:/data biocontainers/vcftools:0.1.15 vcftools"`

Obtaning alelle frequency

`vcftools --vcf subdata.vcf --freq --stdout` 

Obtaining pi

`$vcftools --vcf subdata.vcf  --site-pi --stdout`

Obtaining tajima's D

`$vcftools --vcf subdata.vcf --TajimaD 10000 -stdout`

Getting heterozygosity

`$vcftools --vcf subdata.vcf --het stdout`  
