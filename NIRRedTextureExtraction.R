# calculating texture data for single bands
# created by Nadeesha Illeperuma
####################################################################################################
# loading required packages
library (raster)        
library(rasterVis)        
library(sp)             
library(rgdal)        
library(RStoolbox)    
library(ggplot2) 
library(glcm)        

# set working directory
setwd("C:/Users/nadee/Desktop/cottonwood/NAIP_classification/texture")

# read nir and red bands
nir<- raster("naip_2020_nir.tif")
red<- raster("naip_2020_red.tif")

#####################################################################################################
# generate texture bands for nir
texture_nir <- glcm(nir,
                 window = c(3, 3),
                 shift=list(c(0,1), c(1,1), c(1,0), c(1,-1)), 
                 statistics = c("mean",
                                "variance",
                                "homogeneity",
                                "contrast",
                                "entropy", 
                                "dissimilarity",
                                "second_moment", 
                                "correlation"
                                ))

texture_nir

# plot texture images
##plot(texture.nir)

# save textture files developed for nir band as a multi layer
writeRaster(texture_nir, filename="nir2020_tex_multi.tif", bylayer=F, overwrite=TRUE, format="GTiff")

#####################################################################################################
# generate texture bands for red
texture_red <- glcm(red,
                    window = c(3, 3),
                    shift=list(c(0,1), c(1,1), c(1,0), c(1,-1)), 
                    statistics = c("mean",
                                   "variance",
                                   "homogeneity",
                                   "contrast",
                                   "entropy", 
                                   "dissimilarity",
                                   "second_moment", 
                                   "correlation"
                    ))

texture_red

# plot texture images
##plot(texture.red)

# save textture files developed for red band as a multi layer
writeRaster(texture_red, filename="red2020_tex_multi.tif", bylayer=F, overwrite=TRUE, format="GTiff")





