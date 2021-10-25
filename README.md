
# mapsPERU <img src="imgs/hex_mapsPERU.png" align="right" width="120"/>

<!-- badges: start -->

[![Project-Status:Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

<!-- badges: end -->

[**mapsPERU**](https://github.com/musajajorge/mapsPERU/) is a package that provides datasets with information about the departmental and regional boundaries of Peru.

## Installation

Install **mapsPERU** with

``` r
library(remotes)
install_github("musajajorge/mapsPERU")
```

## Usage

**mapsPERU** will provide you with departmental or regional boundaries, but you must use ggplot2 to plot the maps.

### Use departmental boundaries of Peru in a map with ggplot2

``` r
library(mapsPERU)
boundaries <- boundaries_DEP

library(ggplot2)
ggplot(data=boundaries)+
aes(x=long, y=lat, group=group)+
geom_polygon(aes(fill=DEPARTAMENTO))+
coord_equal()+
geom_path(color="black")
```

In this example we are using the name of the departments as a categorical variable in the graph. You can combine the **mapsPERU** data sets with other categorical or numeric variables that you want to plot.

<img src="imgs/ex_map_dep_1.png" width="100%" />

### Use departmental boundaries of Peru and centroids in a map with ggplot2

Note that **mapsPERU** also provides geographic information of the centroids, so you can include the names of the departments as labels.

``` r
library(mapsPERU)
boundaries <- boundaries_DEP
centroids <- centroids_DEP

library(ggplot2)
ggplot(data=boundaries)+
aes(x=long, y=lat, group=group)+
geom_polygon(aes(fill=DEPARTAMENTO))+
coord_equal()+
geom_path(color="black")+
geom_text(data=centroids, aes(long, lat, group=NULL, label=DEPARTAMENTO), size=2)
```

<img src="imgs/ex_map_dep_2.png" width="100%" />



