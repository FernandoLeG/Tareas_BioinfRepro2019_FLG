# Tarea 7.1 Efecto dela vairaicón ne el cromosoma Y en el tamaño de los cardiomiocitos en ratones
Fernando León García, maestría en ciencias biológicas

 ## Introducción
 
 
 ## Material y métodos
 Para este trabajo se hizo uso del set de datos Llamas etal. (2009) estos datos se encuentran en https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE15354. Este set contiene datos de expresión génica de *Mus musculus* en tejido cardíaco, observando, principlamente, el cmabio de tamaño de los cardiomiocitos en respuesta a a expresión genética diferecial en el cromosoma y y el tamaño de los dardiomiocitos. en este arreglo de datos s eensayaron 8 ratoes adultos machos, con cepas B y BY, se castraron cuatro individuos de cada cepa. Para este escrito se utilizó una submuestra de 5000 sondas.
 
 Para egenerar la submuestra de 500 sondas al azar se usó el paquete  de R dplyr con el comando siguiente:
 
 `Data.Raw <- Data.Raw %>% sample_n(size=5000, replace=FALSE)`
 
 Los análisis de calidad se relaizaron con diagrams de caja usando como base los tratamientos. Se realizó un filtrado basado en los índices de calidad y en las sondas no se detectaron, transcritos para los tratamientos.
 
 Para la normalización d elos datos se empleó el paquete de R preprocessCore.
 Para los anaálisis de expresión diferencial, se hizo uso de un modelo ANOVA factorial. Se consideraron lso grupos por genotipo y tratamiento (castrado o no castrado), para el diseño del anova se consideraron la sinteracciones netre estos factores.
 
 `cmat <- rbind(Geno     =  c( 1,   1,  -1,  -1 )*.5,
              Trt      =  c( 1,  -1,   1,  -1 )*.5,
              Int      =  c( 1,  -1,  -1,   1 ),
              Geno_I   =  c( 0,   1,   0,  -1 ),
              Geno_C   =  c( 1,   0,  -1,   0 ),
              Trt_B    =  c( 1,  -1,   0,   0 ),
              Trt_BY   =  c( 0,   0,   1,  -1 ),
              B.C_BY.I =  c( 1,   0,   0,  -1 ),
              B.I_BY.C =  c( 0,   1,  -1,   0 ))`

Se hicieron pruebas para los contastes (filas de la matriz) con 500 permutaciones.
Para el conteo de genes expresados difrreencialmente se utilizaron digramas de venn para ver la distribución entre los diferentes genotipos ante los diferentes tratamientos, para esto se usó el paquete de R Limma.

Para determinar si existen procesos enriquecidos para los genes seleccionados para los efectos d ela interacción genotipo y tratamiento se usará el paquete topGo. Para determianr si existe enrquecimiento  de los objetos creados con el paquete se usará un prueba exacta de Fisher.

Reusltados
![Boxplot raw qc](D:/Programas/BioinfinvRepro-master/Unidad7/DE_tutorial/output/boxplot_raw_probe_qc.png)




              
              
