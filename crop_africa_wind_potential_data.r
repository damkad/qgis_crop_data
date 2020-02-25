library(sf)
library(raster)
library(rgdal)


#road
road = read_sf(dsn = "C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/nigeria/nigeria.shp")
road_res = st_buffer(road, dist = 0.0909)
write_sf(road_res, "C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/nigeria/road/nigeria_road_dis_buffer.shp")

c_name = "C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/nigeria/nigeria.shp"
#wind potential
wind_potential = "C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/wind/gwa3_250_power-density_150m.tif"
capacity_factor = "C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/wind/gwa3_250_capacity-factor_IEC1.tif"
#land
land_use = "C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/africa_land/ESACCI_Africa.tif"

country  <- readOGR(c_name)

wp   <- raster(wind_potential)
cf  <- raster(capacity_factor)
lu <- raster(land_use)

wp_   <-crop (wp, country)
cf_  <-crop (cf, country)
lu_ <-crop (lu, country)

writeRaster(wp_, 
            file.path("C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/wind","cropped_wind_power.tif"), format="GTiff")

writeRaster(cf_, 
            file.path("C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/wind","cropped_capacity_factor.tif"), format="GTiff")

writeRaster(lu_, 
            file.path("C:/Users/kADIRI PC/Desktop/nigeria wind analysis/africa/africa_land","cropped_land_use.tif"), format="GTiff")





