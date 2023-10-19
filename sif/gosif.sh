#!/bin/bash
#set -e
#export cdo=/usr/local/bin/cdo-1.4.6

timesteps=($(seq 2001 1 2020 ))
cnt=${#timesteps[@]}

##### main
for ((i=0;i<cnt;i++)); do
   echo ${timesteps[$i]}

   for j in {001..361..8}; do
 
      echo GOSIF_${timesteps[$i]}${j}.tif.gz
      ##### download data
      #wget http://data.globalecology.unh.edu/data/GOSIF_v2/8day/GOSIF_${timesteps[$i]}${j}.tif.gz
      #gunzip GOSIF_${timesteps[$i]}${j}.tif.gz
      ##### .tif to .nc
      #gdal_translate -of netCDF GOSIF_${timesteps[$i]}${j}.tif GOSIF_${timesteps[$i]}${j}.nc
      #mv GOSIF_${timesteps[$i]}${j}.nc ./down/

      ##### regridded 0.05 to 0.25 deg 
      #cdo gridboxmean,5,5 ./down/GOSIF_${timesteps[$i]}${j}.nc ./down/GOSIF.m25.${timesteps[$i]}${j}.nc
      cdo remapbil,targetgrid ./down/GOSIF_${timesteps[$i]}${j}.nc ./down/GOSIF.r25.${timesteps[$i]}${j}.nc
   done


done
echo done.
#####

