# Tarea 7.1 Efecto de la variación en el cromosoma Y sobre la expresión génica
Fernando León García, maestría en ciencias biológicas

 ## Introducción

Como se ha visto en los estudios anteriores, el cromosoma Y puede tener variantes que pueden afectar procesos no relacionados a la reproducción de los machos (Llamas et al., 2009). Esto implica que los genes en en estas variantes están diferencialmente expresados para generar estos efectos. En el artículo sugiere estos efectos sobre los cardiomiocitos.

Los análisis de expresión diferencial son útiles en muchos aspectos ya que pueden indicar genes o grupos de genes candidatos en distintos procesos, siendo de aplicación directa en áreas de la salud (Abatangelo et al., 2009) 

En este reporte no se explora el efecto fenotípico directamente, pero se hace un análisis de expresión diferencial usando una submuestra de  los datos se busca encontrar indicios de expresión diferencial con un diseño entre tratamientos castrado e intacto y genotipos de cromosoma Y para ratones.


 ## Material y métodos
 Para este trabajo se hizo uso del set de datos Llamas et al. (2009) estos datos se encuentran en https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE15354. Este set contiene datos de expresión génica de *Mus musculus* en tejido cardíaco, observando, principalmente, el cambio de tamaño de los cardiomiocitos en respuesta a a expresión genética diferencial en el cromosoma y y el tamaño de los cardiomiocitos. en este arreglo de datos se ensayaron 8 ratones adultos machos, con cepas B y BY, se castraron cuatro individuos de cada cepa. Para este escrito se utilizó una submuestra de 5000 sondas.

 Para generar la submuestra de 500 sondas al azar se usó el paquete  de R dplyr con el comando siguiente: esto generó un submuestra aleatoria de 5000 del 

 `Data.Raw <- Data.Raw %>% sample_n(size=5000, replace=FALSE)`

 Los análisis de calidad se realizaron con diagramas de caja usando como guía la clasificación de "good probes" y "bad probes" resultado de la anotación. Se realizó un filtrado basado en los índices de calidad y en las sondas no se detectaron, transcritos para los tratamientos.

 Para la normalización de los datos se empleó el paquete de R preprocessCore.
 Para los análisis de expresión diferencial, se hizo uso de un modelo ANOVA factorial. Se consideraron los grupos por genotipo y tratamiento (castrado o no castrado), para el diseño del anova se consideraron las interacciones entre estos factores.

 `cmat <- rbind(Geno     =  c( 1,   1,  -1,  -1 )*.5,
              Trt      =  c( 1,  -1,   1,  -1 )*.5,
              Int      =  c( 1,  -1,  -1,   1 ),
              Geno_I   =  c( 0,   1,   0,  -1 ),
              Geno_C   =  c( 1,   0,  -1,   0 ),
              Trt_B    =  c( 1,  -1,   0,   0 ),
              Trt_BY   =  c( 0,   0,   1,  -1 ),
              B.C_BY.I =  c( 1,   0,   0,  -1 ),
              B.I_BY.C =  c( 0,   1,  -1,   0 ))`

Se hicieron pruebas para los contrastes (filas de la matriz) con 500 permutaciones.
Para el conteo de genes expresados diferencialmente se utilizaron diagramas de venn para ver la distribución entre los diferentes genotipos ante los diferentes tratamientos, para esto se usó el paquete de R Limma.

Para determinar si existen procesos enriquecidos para los genes seleccionados para los efectos de la interacción genotipo y tratamiento se usará el paquete topGo. Para determinar si existe enriquecimiento  de los objetos creados con el paquete se usará un prueba exacta de Fisher.

## Reusltados



Bad        Good     Good***    Good****    No match     Perfect  Perfect*** Perfect**** 
 270          93           1               18             5                      4430          47         136 

Cuadro1. Resultado de la clasificación tras la anotación

![Boxplot raw qc](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_71/output/boxplot_raw_probe_qc.png)




​              Figura 1 Diagramas caja de calidad de sondas. El ancho de las cajas es proporcional al número de sondas presente en el arreglo. en el eje y se presenta la intensidad de la señal



Se puede observar  en los diagramas de calidad (Figura 1) claramente que existe un mayor número de sondas de buena calidad, evidenciado por el ancho de los diagramas, así que todos los arreglos presentan una intensidad similar .

![Boxplot raw qc](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_71/output/boxplot_raw_treatment.png)

Figura 2 Diagramas que muestran la intensidad y posición de las sondas de acuerdo al tratamiento. Los individuos castrados se presentan en rojo, mientras que los intactos, en verde.



No parecen existir diferencias significativas entre las medias de intensidad entre los dos tratamientos (figura 2.)

![](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_71/output/P-values%20Hist.png)

Figura 3.  Gráficos de distribución de los valores p. Ptab valores en tabulación. Pvalperm permutación. F1 prueba F Fs prueba F con contracción de varianza.



Se puede observar que para los tres efectos la mayor parte de los valores p se agrupan cercano a 0.0, sin embargo, para la interacción estos se distribuyen un poco más homogéneo.



![](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_71/output/vennDiagram_DiffExprs.png)

Figura 4. diagrama de Venn con el número de genes diferencialmente expresados entre los distintos efectos



Se puede observar en la figura 4 que los efectos individuales poseen más genes expresados diferencialmente que la interacción, esto concuerda con lo expresado ene l gráfico anterior, donde la gran cantidad de genes presentes para los efectos individuales pudo generar el patrón de gran densidad cerca de valores significativos .

![](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_71/output/vennDiagram_Int.png)

Figura 5 diagramas de Venn para los distintos tratamientos.

Se esperaría en la distribución de genes diferencialmente expresados fuera más homogénea entre los genotipos y fuera menos homogénea entre los tratamientos, aunque esto se ve existe un gran número de diferencias entre los genotipos. concordando con lo que obtuvieron Llamas et al. (2009) existen más genes únicos para los individuos castrados, incluso con la reducida submuestra.



| GO.ID      | Term                                        | Annotated | Significant | Expected | Rank in Fisher.classic | Fisher.classic | Fisher.elim |
| ---------- | ------------------------------------------- | --------- | ----------- | -------- | ---------------------- | -------------- | ----------- |
| GO:0032680 | regulation of tumor necrosis factor prod... | 25        | 8           | 1.64     | 1                      | 0.00012        | 0.00012     |
| GO:0071222 | cellular response to lipopolysaccharide     | 29        | 8           | 1.91     | 5                      | 0.00038        | 0.00038     |
| GO:0010665 | regulation of cardiac muscle cell apopto... | 5         | 3           | 0.33     | 11                     | 0.00253        | 0.00253     |
| GO:0042026 | protein refolding                           | 5         | 3           | 0.33     | 12                     | 0.00253        | 0.00253     |
| GO:0061900 | glial cell activation                       | 5         | 3           | 0.33     | 13                     | 0.00253        | 0.00253     |
| GO:0071356 | cellular response to tumor necrosis fact... | 23        | 6           | 1.51     | 17                     | 0.0029         | 0.0029      |
| GO:0008643 | carbohydrate transport                      | 17        | 5           | 1.12     | 21                     | 0.00373        | 0.00373     |
| GO:0050678 | regulation of epithelial cell proliferat... | 43        | 8           | 2.83     | 26                     | 0.00584        | 0.00584     |
| GO:0042035 | regulation of cytokine biosynthetic proc... | 12        | 4           | 0.79     | 27                     | 0.00587        | 0.00587     |
| GO:0009968 | negative regulation of signal transducti... | 159       | 19          | 10.46    | 31                     | 0.00656        | 0.00656     |
| GO:0060326 | cell chemotaxis                             | 36        | 7           | 2.37     | 34                     | 0.00765        | 0.00765     |
| GO:0030225 | macrophage differentiation                  | 7         | 3           | 0.46     | 35                     | 0.00802        | 0.00802     |
| GO:0097192 | extrinsic apoptotic signaling pathway in... | 13        | 4           | 0.86     | 36                     | 0.00805        | 0.00805     |
| GO:0032612 | interleukin-1 production                    | 14        | 4           | 0.92     | 40                     | 0.0107         | 0.0107      |
| GO:0032652 | regulation of interleukin-1 production      | 14        | 4           | 0.92     | 41                     | 0.0107         | 0.0107      |
| GO:0061077 | chaperone-mediated protein folding          | 14        | 4           | 0.92     | 42                     | 0.0107         | 0.0107      |
| GO:2001234 | negative regulation of apoptotic signali... | 39        | 7           | 2.57     | 43                     | 0.01194        | 0.01194     |
| GO:0006955 | immune response                             | 145       | 17          | 9.54     | 44                     | 0.0121         | 0.0121      |
| GO:0010837 | regulation of keratinocyte proliferation    | 8         | 3           | 0.53     | 45                     | 0.01222        | 0.01222     |
| GO:0032720 | negative regulation of tumor necrosis fa... | 8         | 3           | 0.53     | 46                     | 0.01222        | 0.01222     |

   Cuadro 2. Tabla de resultados de la prueba exacta de Fisher para detectar enriquecimiento en la interacción



Se pude observar que genes de respuesta inmune y de regulación negativa de transducción son aquellos con más notaciones, pero se debe tener en cuenta que el subconjunto no podría mostrar una imagen representativa  del conjunto. El gen que presentó la mayor significancia fue regulación de producción de factores de  necrosis tumoral, sin embargo como fue mencionado, se tiene  que tener en cuenta que esto podría no se representativo del total.

# Conclusión

A pesar de tener una muestra reducida del conjunto total de datos, se observa el patrón obtenido por Llamas et al. (2009). Esto al final puede ser un refuerzo ya que este patrón se mantiene independiente  al tamaño de muestra.



Literatura citada

Llamas, B., Verdugo, R. A., Churchill, G. A., y Deschepper, C. F. 2009. Chromosome Y variants  form different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics, 10: 150.

Abatangelo, L.,  Maglietta, R., Distaso, A., D'Addabbo, A., Creanza, T. M., Mukherjee, S. y Ancona, N. 2009. Comparative study of gene set enrichment methods. BMC Bioinformatics, 10:275.
