# Pregunta 2

## Inroducción

Con los recientes avances de técnicas de secuenciación, especialmente, en aquellos que generan lecturas cortas como resultado. El trabajar con lecturas cortas añade el desafío de obtener información a partir de un genoma fragmentado, es por esto que se necesitan programas que puedan ensamblar  y filtar estas secuencias para obtener caracteres que puedan proveer información. Ipyrad es un programa que funciona con lenguaje Python diseñado para análisis y ensamblaje de conjuntos de datos provenientes de RAD-seq (Eaton, 2015)

Ipyrad funciona con un archivo de parámetros, más que especificar los parámetros en la línea de comando, se hace referencia a un archivo .txt en esta. El archivo contiene todos los parámetros utilizados en los siete pasos del análisis.  

Como la línea de comando de Ipyrad procesa desde filtrado de archivos fastaq, están los parámetros que son sensibles en esta etapa que son phred y máximo de llamado de bases de baja calidad. Estos no son los únicos pasos que filtran el conjunto de datos, ya que otros parámetros como máximo de indels o SNP's por locus puede realizar esta función pero con una aproximación diferente 

El parámetro de umbral para agrupación es uno de los más importantes de considerar. Ipyrad genera clústeres basados en similitud, por tanto, este parámetro es fundamental cambiarlo acorde a la resolución que se busca (Shafer at al., 2016). El parámetro varía de 0 a 1, siendo el valor de 1 en el que la secuencias tienen que ser idénticas para la formación del clúster. Trabajando debajo del nivel de especie requiere que este valor sea alto para poder discernir entre individuos de la misma especie.

El parámetro mindepth_statistical representa la profundidad mínima en la que se hace el llamado estadístico de bases. Este parámetro está relacionado con mindepth_majrule, cuando son iguales todos los llamados de bases serán estadísticos.

Otros parámetros sensibles son aquellos que se refieren a los parámetros permitidos en un locus, especialmente el número máximo de SNP’s y el número máximo de indels. Estos dos parámetros establecen el número máximo de es los permitido en un locus. 

Es necesario variar los parámetros para poder obtener un arreglo óptimo de parámetros para los datos que se están manejando. Para optimizar los parámetros lo que puede hacerse es hacer los análisis variando estos parámetros a partir de una configuración estándar. 

Existen otros parámetros que afectan de manera importante el resultado, sin embargo, estos parámetros son dependientes del número de muestra, por tanto con un mismo conjunto de datos, la variación que pueden tener es limitada.

## Discusión

Consiederando un set de datos que pueda contener muchas fuentes de error, como un conjunto con mucho ejemplares de Museo, los siguientes rangos de optimización podrían se radecuados.

Otros investigadores han usado, para aves, en genética de poblaciones, un umbral para agrupación de 0.88 (linck y Battey, 2018), siendo el estándar 0.85. Con estos datos se podría dejar este parámetro estable y variar individualmente los demás parámetros. Como los comandos se introducen por un archivo de texto, se tienen que crear todos los archivos con todas las configuraciones posibles. Este es el esquema que se utiliza en Mastretta-Yanes et al. (2015) y Shafer et al. (2017).

```
Ipyrad -fp params-data.txt -s 1234567
```

El comando ejecuta ipyrad con el archive de parámetros seleccionado y flag `-s` indica que pasos se correrán con el archivo de parámetros correspondiente que está indicado por el nombre de archivo siguiendo al flag `-fp`.   

El parámetro mindepth_statistical tendría un valor mínimo de 6, es el mínimo recomendado en la documentación. ya que s lo mínimo que con una cantidad razonable de error es la profundidad mínima en la que una base heteróciga pueda ser diferenciada de un error de secuenciación.

El número máximo de SNP’s por locus de variaría de 1 a 5 SNP’s por locus pare que ningún locus tenga un exceso de información y podría compensar errores en la secuenciación. El máximo número de indels se dejaría en valores de 1 a 8. Siendo el valor máximo el recomendado por la documentación.

Estos parámetros son más óptimos con conjuntos de datos que pueden tener baja calidad, ya que los rangos de parámetros elegidos, ayudan a filtrar datos o alineamientos de baja calidad. Estos rangos de parámetros funcionarían bien con datos provenientes de ejemplares de mueso, por la menor calidad esperada, además de tener los primeros pasos que filtran por la calidad de las secuencias. Pero es de notar que se menciona explícitamente en la documentación que no es recomendable  sobre filtrar los datos, aunque esto se puede aliviar por las diferentes combinaciones entre parámetros

## Literatura citada

Linck, E. y Battey, C. J. 2018. Minor allele frequency tresholds dramatically affect population structure inference with genomic datasets. BioRxiv. 

Mastretta-Yanes, A., Arrigo, N., Alvárez, N., Jorgensen, T. H., Piñeros D. y Emerson, B. C. 2015. Restriction site-associated DNA sequencing, genotyping error estimation and *de novo* assembly optimization for population genetic inference. Molecular Ecology, 15: 28-41. 

Shafer, A. B. A., Peart, C. R., Tusso, S., Maayan, I., Brelsford, A., Wheat, C. W. y Wolf, J. B. W. 2016. Bioinformatic  processing of RAD-seq data dramatically impacts downstream 	population genetic inference. Methods in Ecology and Evolution, 8: 907-917.

