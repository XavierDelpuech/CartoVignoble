### script exemple carte vignobles fr
library(raster)
library(geojsonio)
library(ggplot2)
library(sf)

BV <- geojson_read("BassinsViticolesFranceAOP.geojson",  what = "sp")
regionsVins <- st_as_sf(BV)
dpt<-shapefile("dept2021.shp")
dpt <- st_as_sf(dpt)


ggplot() +
  geom_sf() +
  geom_sf(data=dpt, aes(),fill = "white") +
  geom_sf(data=regionsVins, aes(fill= Bassin), alpha=0.4, show.legend = F) +
  geom_sf_label(data=regionsVins,aes(label=Bassin),size=2) +
  labs(x="longitude",y="latitude")


