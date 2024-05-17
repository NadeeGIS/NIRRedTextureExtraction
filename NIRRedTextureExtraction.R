# calculating texture data for single bands
# created by Nadeesha Illeperuma
####################################################################################################
library(raster)
library(RStoolbox)
library(glcm)      

# set working directory
 #setwd("C:/Users/nadee/Desktop/cottonwood/NAIP_classification/texture")


# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if the correct number of arguments is provided
if (length(args) != 5) {
  stop("Usage: Rscript script_name.R --nir <nir_file> --red <red_file> --wd <working_directory>")
}

# Parse arguments
nir_file <- NULL
red_file <- NULL
working_directory <- NULL

for (i in 1:length(args)) {
  if (args[i] == "--nir") {
    nir_file <- args[i + 1]
  } else if (args[i] == "--red") {
    red_file <- args[i + 1]
  } else if (args[i] == "--wd") {
    working_directory <- args[i + 1]
  }
}

# Check if arguments are provided
if (is.null(nir_file) || is.null(red_file) || is.null(working_directory)) {
  stop("Error: Missing argument(s). Please provide NIR file, red file, and working directory.")
}

# Set working directory
setwd(working_directory)

# Read NIR and red bands
nir <- raster(nir_file)
red <- raster(red_file)

# Generate texture bands for NIR
texture_nir <- glcm(nir,
                    window = c(3, 3),
                    shift = list(c(0,1), c(1,1), c(1,0), c(1,-1)), 
                    statistics = c("mean", "variance", "homogeneity", "contrast", 
                                   "entropy", "dissimilarity", "second_moment", "correlation"))

# Save texture files developed for NIR band as a multi-layer
writeRaster(texture_nir, filename = "nir_tex_multi.tif", bylayer = FALSE, overwrite = TRUE, format = "GTiff")

# Generate texture bands for red
texture_red <- glcm(red,
                    window = c(3, 3),
                    shift = list(c(0,1), c(1,1), c(1,0), c(1,-1)), 
                    statistics = c("mean", "variance", "homogeneity", "contrast", 
                                   "entropy", "dissimilarity", "second_moment", "correlation"))

# Save texture files developed for red band as a multi-layer
writeRaster(texture_red, filename = "red_tex_multi.tif", bylayer = FALSE, overwrite = TRUE, format = "GTiff")






