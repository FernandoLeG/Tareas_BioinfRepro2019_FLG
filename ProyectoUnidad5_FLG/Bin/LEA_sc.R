
library(LEA)
#Loads LEA Package

vcf2geno("../subdata_outfiles/etrai_max.vcf")
#Converts the vcf file into geno file

project = snmf("etrai_max.geno", K=1:3, entropy=TRUE, repetitions=15, project="new")
#Creates a project to the assigning of genetic groups and does the genetic structure analysis

plot(project, col="blue", pch=19,cex=1.2)
#Plots the cross entropy data

for (i in 2:3){

best=which.min(cross.entropy(project,K=i))
}
#sets the best scheme for any given K based of on the cross entropy criterion

my.colors=c("tomato","lightblue", "olivedrab", "gold")
#Sets a color palette to be used in the plots

for (t in 2:3){
barchart(project, K=t,run=best, border=NA,space=0, col=my.colors,xlab="Individuals",ylab="Ancestry populations", main="Ancestry matrix")->bp  
axis(1, at=1:length(bp$order),labels=bp$order,las=1,cex.axis=.8)
project = load.snmfProject("subdata.snmfProject")
}
#Plots the barcharts using the best scheme for any given K  


