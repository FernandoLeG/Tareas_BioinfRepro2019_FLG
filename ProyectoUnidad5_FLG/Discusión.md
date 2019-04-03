# An approach to the population genetics of the West Coast *Empidonax traillii* populations

*Empidonax traillii* is an species of tyrant flycatcher that tends to live in forest edges thoughout almost all of United States territory. There is one population of this species that occupies different habitats, living in semi arid and arid areas (Howell and Webb, 1995). This population has been recognized as *Empidonax traillii extimus* and has been under numerous studies due to its endangered status. The fact that this population differs in habitat type to the rest of its species may inidcate a certain degree of differentiaiton.

Here I use a reduced representation of the data set used in Ruegg (2018) focusing on the populations that ar on the west side of thr Rocky Mountains being these, the subespecies *E. traillii brewsteri*, *E. traillii adastus* and *E. traillii extimus*. A total of fourteen individuals were chosen due to computing limitations and after the cleaning of data the set was reduced to eight individuals, four belonging to *E. t. extimus* ad four to the other two populations.

Trimmomatic v. 0.38 was used to clean and filter the data for it tu be used by ipyrad. For assembly and loci calling loci, the software ipyrad was used. As step four of the pipeline was unable to work with some of the samples a subdata array of eight individuals was used to run from this step onwards.

To obtain the statistics of Tajima's D, nucleotide diversity per site and heterozygosity, and to filter thos loci with missing data the software vcftools v. 0.1.15 was used via a container for biocantainers. I order to do the genetic structure analyses the R package LEA was used.

## Discussion
The mean of population genetics stadistics were as follow
mean heterozygosity of all the individuals is 0.63584
mean site nucleotide diversity is 0.38103
mean Tajima's D across all sites 0.47184

The values of nucleotide diversity are much higher than that of other brids like *Turdus assimilis* or *Junco phaenotus* (Friis et al., 2016; Montaño et al., 2015) tthis is moslikely an effect of a very reduced number of individuals. This is more evident because th *E- t. extimus* endangered ststus would present a reduced diversity. 

As there is no clear association of the individuals with any group in particular, the statistics per population do not offer relevant information. Th mean value of Tajima's D would indicate balancing selection or stable populations. However, this is on avergae, as many loci exhibit the opposite pattern. Therefore, it will be necessary ti increase smaple size and to make landcape association with loci and more so because of the diffrence in habitat of *E. traillii extimus* compared to the other subespecies described. 

The genetic groups association was made on the R package LEA considering K=1, 2, 3 and 4. However, the results between these schemes and between different anlyses ended up being inconsistent. The best scheme according to the cross-entropy criterion was that of 1 genetic group, supporting the inconsistency obtained with the genetic group assignation. This shows the need to add more samples to this analysis as it couldn't identify clearly the genetic group in which and individual belongs. Other factor that must be taken into account is relatedness. *Empidonax traillii* and its sister species *E. alnorum* have an estimated diveregence of 2M years (Johnson and Cicero, 2004), although is a long time for *Empidonax* it still could explain this pattern of almost no differentiation. If it could be added the other subespecies *E. traillii traillii* probably would help to diminish the ambiguity in the genetic group assignation.

Frichot, E. and François, O. 2015. LEA: an R package for landscape and ecological association studies. Methods in Ecology and Evolution, 6: 925-929.

Friis, G., Aleixandre, P., Rodríguez-Estrella, R., Navarro-Sigüenza, A. G.  and Milá B. 2016. Rapid postglacial diversification and long-term stasis within the songbird genus *Junco*: phylogeographic and phylogenomic evidence. Molecular Ecology, 25: 6175-6195

Howell S. N. G. and Webb, S. 1995. A guide yo the birds of Mexico and Northern Central America, New York, Oxford Univeristy Press.

Johnson, N. K. and Cicero, C. 2004. New mitochondrial DNA data affirm the importance of pleistocene speciation in North American birds. Evolution, 58: 1122-1130.

Montaño-Rendón, M., Sánchez-Gonzáles, L. A., Hernández-Alonso, G. and Navarro-Sigüenza, A. G. 2015. Genetic differentiation in the Mexican endemic Rufous-backed Robin *Turdus rufopalliatus* (Passeriformes: Turdidae). Zootaxa, 4034: 495-514.

Danecek, P., Auton, A., Abecasis, A., Albers, C. A., Banks, E., DePristo, M. A., Handsaker, R. E., Lunter, G., Marth, G. T., Sherry, S. T., McVean, G., Durbin, R. and 1000 Genomes Project Analysis Group. 2011. The variant call format and VCFtools. Bioinformatics, 27: 2156-2158.
