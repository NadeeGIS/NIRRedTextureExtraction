# NIRRedTextureExtraction
This repository contains an R script designed to generate texture data for aerial images, specifically focusing on the Near Infrared (NIR) and Red bands. The script leverages the glcm (Gray Level Co-occurrence Matrix) package to compute various texture metrics

## How to Use
```
Rscript NIRRedTextureExtraction.R --nir "path_to_nir_file.tif" --red "path_to_red_file.tif" --wd "path_to_working_directory"
```
For my work,I used following values for arguments.
--nir naip_2020_nir.tif
--red naip_2020_red.tif

This will outputnir_tex_multi.tif and red_tex_multi.tif


