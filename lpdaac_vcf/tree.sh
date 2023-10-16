#!/bin/bash
#set -e
#export cdo=/usr/local/bin/cdo-1.4.6

#data download from https://lpdaac.usgs.gov/products/vcf5kyrv001/
 > Access Data > NASA Earthdata Search/Download Data > Download All > Download Script (.sh)
 
#variables 
#Layer 1: Percent Tree cover
#Layer 2: Percent Non-Tree
#Layer 3: Percent Bare Ground

gdal_translate -of netCDF VCF5KYR_2016001_001_2018224210310.tif VCF5KYR_2016001_001_2018224210310.nc
gdal_translate -of netCDF VCF5KYR_2015001_001_2018224210248.tif VCF5KYR_2015001_001_2018224210248.nc
gdal_translate -of netCDF VCF5KYR_2014001_001_2018224210222.tif VCF5KYR_2014001_001_2018224210222.nc
gdal_translate -of netCDF VCF5KYR_2013001_001_2018224210156.tif VCF5KYR_2013001_001_2018224210156.nc
gdal_translate -of netCDF VCF5KYR_2012001_001_2018224210128.tif VCF5KYR_2012001_001_2018224210128.nc
gdal_translate -of netCDF VCF5KYR_2011001_001_2018224210105.tif VCF5KYR_2011001_001_2018224210105.nc
gdal_translate -of netCDF VCF5KYR_2010001_001_2018224210033.tif VCF5KYR_2010001_001_2018224210033.nc
gdal_translate -of netCDF VCF5KYR_2009001_001_2018224210002.tif VCF5KYR_2009001_001_2018224210002.nc
gdal_translate -of netCDF VCF5KYR_2008001_001_2018224205932.tif VCF5KYR_2008001_001_2018224205932.nc
gdal_translate -of netCDF VCF5KYR_2007001_001_2018224205909.tif VCF5KYR_2007001_001_2018224205909.nc
gdal_translate -of netCDF VCF5KYR_2006001_001_2018224205841.tif VCF5KYR_2006001_001_2018224205841.nc
gdal_translate -of netCDF VCF5KYR_2005001_001_2018224205812.tif VCF5KYR_2005001_001_2018224205812.nc
gdal_translate -of netCDF VCF5KYR_2004001_001_2018224205736.tif VCF5KYR_2004001_001_2018224205736.nc
gdal_translate -of netCDF VCF5KYR_2003001_001_2018224205710.tif VCF5KYR_2003001_001_2018224205710.nc
gdal_translate -of netCDF VCF5KYR_2002001_001_2018224205629.tif VCF5KYR_2002001_001_2018224205629.nc
gdal_translate -of netCDF VCF5KYR_2001001_001_2018224205557.tif VCF5KYR_2001001_001_2018224205557.nc 

#yearly average over the period 2001 to 2016 (ensavg: n/a is not ignored)
cdo ensavg VCF5KYR* VCF5KYR.ensavg.2001.2016.nc
#the percentage of tree cover divided by the sum of the percentages of short vegetation and tree cover
cdo expr,'veg=Band1/(Band1+Band2);' VCF5KYR.ensavg.2001.2016.nc VCF5KYR.ensavg.tree.2001.2016.nc
#regrdding 
cdo gridboxmean,10,10 VCF5KYR.ensavg.tree.2001.2016.nc VCF5KYR.ensavg.tree.d50.2001.2016.nc
