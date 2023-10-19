# Collection of scripts for data pre-processing 


# 1. Tree cover from lpdaac_vcf
The NASA Making Earth System Data Records for Use in Research Environments (MEaSUREs) Vegetation Continuous Fields (VCF) Version 1 data product
> Reference: Song et al., 2018 (https://doi.org/10.1038/s41586-018-0411-9)
  1. download data from https://lpdaac.usgs.gov/products/vcf5kyrv001/
  2. change .tif to .nc, and compute vegetation/tree cover using tree.sh

# 2. SIF from GOSIF V2 
The global OCO-2 SIF data set with high spatial and temporal resolutions (0.05°, 8-day) over the period 2000-2020
> Reference: Li and Xiao, 2019 (https://doi.org/10.3390/rs11050517)
  1. download data from http://data.globalecology.unh.edu/data/GOSIF_v2/8day/
  2. change .tif to .nc, and regridded the data using gosif.sh
