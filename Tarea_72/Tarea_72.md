# Tarea 7.2 Clustering de sondas de cromosoma Y en ratones con dos distintos tratamientos

Fernando León García, Maestría en Ciencias Biológicas

# Introducción

Encontrar clústeres permite la identificación de ensambles que podrían mostrar patrones determinantes en el sistema de estudio. Un ejemplo de esto pueden ser clústeres con niveles similares de expresión en cáncer, ayudando a identificar candidatos en dicha aflicción.

Para este reporte se utilizó los datos de Llamas et al. (2009). Se utilizó un submuestra de 5000 individuos con los datos normalizados previo al análisis descrito en el reporte. Debido a al naturaleza del diseño se espera que las sondas se agrupen de acuerdo a la interacción genotipo tratamiento, pero para esto se debe tener un enfoque estadístico para guiar al algoritmo de agrupamiento, buscando que tenga un sentido biológico ( McShane, et al., 2002).

Se busca de manera jerárquica agrupar las sondas con base en la interacción genotipo-tratamiento usando un algortimo de distancia y ajustar dicho modelo con enfoques de probabilidad (EM).



# Material y métodos

Para seleccionar el número adecuado de K se uso una gráfica de suma de cuadrados, buscando un balance entre la menor suma posible y menor número posible de clústeres. Posterior a K=5 los valores de la suma de cuadrados tienen un declive mínimo, considerando entonces el valor óptimo entre K=4 y K=5.

Se calcularon los valores p para el agrupamiento jerárquico con remuestreos Bootstrap. Para esto se hizo uso del paquete pvclust v. 2.0.0 (Suzuki y Shimodaira, 2015).

Para hacer el ajuste del modelo  al esquema de K seleccionado se hizo uso del paquete mclust v. 5.4.3 (Raftery, Scrucca, Murohy y Fop). Este paquete utiliza un algoritmo Expectation and maximization (EM), escogiendo el modelo usando criterio de información bayesiana.

Se realizó un gráfico de los dos primeros componentes principales para visualizar ala agrupación de las sondas en el esquema de K's propuesto. para esto se utilizó el paquete de R cluster v. 2.09

# Resultados	
![](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_72/output/sumsqk.png)
Fgura 1 Gráfico de suma se cuedrados para los dsitintos esquemas


Para el esquema de agrupación de K=4, el clúster concentra la mayor parte de las sondas con 4368. El esquema K=5 presenta un patrón similar con el que e grupo 5 concentra 4228 sondas. Esto podría deberse a que  estas sondas están siendo forzadas a formar el clúster. Los análisis subsecuentes fueron realizados con el esquema de partición K=5


|           | K    |      |      |      |      |
| --------- | ---- | ---- | ---- | ---- | ---- |
| Esquema 1 | 1    | 2    | 3    | 4    |      |
|           | 4368 | 262  | 75   | 19   |      |
| Esquema 2 | 1    | 2    | 3    | 4    | 5    |
|           | 348  | 46   | 84   | 18   | 4228 |

Cuadro 1. Sondas asociadas con cada grupo delos dos esquemas de partición K=4 y K=5

![](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_72/output/phclust.png)
Figura 2. Dendrograma de distnacia euclidiana los valores de soporte se encuentran en verde y rojo

Se observa en el dendrograma de agrupación jerárquica que todos los genotipos-tratamiento se encuentran muy cercanos. Sin embargo, se puede encontrar al menos un clúster bien definido. Este es el clúster que incluye a genotipo BY castrado, pero se tiene que tener en cuenta que los valores de soporte al interior del grupo son bajos. Exceptuando a los dos intactos de genotipo BY que se agrupan con BY castrados, los de tratamiento intacto forman un clúster. Genotipo B castrado no parece tener una agrupación clara.  Los resultados obtenido parecen indicar que, ni el algoritmo de agrupación y ni las sondas utilizadas son los más óptimos para discernir entre los distintos efectos del modelo. sin embargo, debe ser considerado que este dendrograma fue producto de un algoritmo de distancia, lo cual puede ocultar parte de la información al tener que condensar toda la información en valores de distancia

![](https://github.com/FernandoLeG/Tareas_BioinfRepro2019_FLG/blob/master/Tarea_72/output/pcaplot.png)
Figura 3. Gráfico d elos dos primeros componenetes principlaes, cada agrupación tiene su númeor de clúster asociado

En la gráfica de componentes principales  se pude observar que, los grupos más homogéneos son aquellos con el menor número de sondas, en este caso, grupos 2 y 4 con 46 y 18 sondas, respectivamente. El grupo más homogéneo es el 5, siendo el que más sondas contiene. Esto puede deberse a que todas las sondas están actuando para soportar el grupo formado.

# Conclusión

Considerando la naturaleza aleatoria de la submuestra utilizada, se esperaría que los resultados podrían cambiar acorde a la submuestra. Sería recomendable usar el conjunto completo de datos, con aquellas sondas que resulten significativas para en expresión. Es posible que así, se presenten clústeres mejor definidos.  	 



Llamas, B., Verdugo, R. A., Churchill, G. A., y Deschepper, C. F. 2009. Chromosome Y variants  form different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics, 10: 150.

McShane, L. M., Radmacher, M. D., Freidlin, B., Yu, R., Li, M. y Simon, R. 2002. Methods for assessing reproducibility of clustering patterns  observed in analyses of microarray data. Bioinformatics, 18: 1462-1469.
