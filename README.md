
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AKmarineareas

<!-- badges: start -->
<!-- badges: end -->

I created the AKmarineareas package to make mapping and spatial analysis
of Alaska marine management and ecosystem areas easier in R. This
package imports areas of interest as sf polygons and also includes an
Alaskan basemap. I previously pulled area boundaries into R by reading a
locally stored ESRI filegeodatabase. This package simplifies using these
data across numerous R projects for me and promotes easier sharing of
these boundaries.

## Installation

You can install the development version of AKmarineareas from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MattCallahan-NOAA/AKmarineareas")
```

## Functions

**AK_marine_area()** is the primary function in this package. It accepts
area and projection arguments. Area options include NMFS reporting areas
(default), Ecosystem boundaries, ADFG Stat Areas, and BSIERP regions.
Projection options are “dd” for WGS-1984 (default) and “prj” for NAD
1983 Alaska Albers.

``` r
library(AKmarineareas)
library(tidyverse)
library(sf)
## plot NMFS areas
AK_marine_area()%>%
  st_shift_longitude()%>% #centers on the Pacific
  ggplot()+
  geom_sf()+
  geom_sf_label(aes(label=NMFS_REP_AREA))+
  theme_void()
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
##plot ecosystem subregions, projected version
AK_marine_area(area="Ecosystem Subarea", prj="prj")%>%
  ggplot()+
  geom_sf(aes(fill=Ecosystem_Subarea))+
  theme_void()
```

<img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" />

**AK_basemap()** This function imports a basemap of the Alaska
coastline.

``` r
## plot AK basemap
AK_basemap()%>%
  st_shift_longitude()%>%
  ggplot()+
  geom_sf()+
  theme_void()
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

**remove_dateline()** These polygons have a line through them at the
international dateline that does not reflect an area boundary. Other
data have this artifact too (e.g. Siberia from the rnaturalearth
package). I wrote this function to remove the dateline from data for
mapping.

``` r
## Unfortunately it is a pretty slow function
AK_marine_area(area="Ecosystem Area", prj="prj")%>%
  remove_dateline()%>%
  ggplot()+
  geom_sf(aes(fill=Ecosystem_Area))+
  theme_void()
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />
