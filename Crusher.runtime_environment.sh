#! /usr/bin/env bash

#-----------------------------------------------------
# Define the path to the Anansi top level.           -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_TOP_LEVEL="$(pwd)"

#-----------------------------------------------------
#                                                    -
#                                                    -
#-----------------------------------------------------
module load PrgEnv-gnu
module load amd-mixed
module load doxygen/latest
module load cmake
module load boost/1.81.0_built_with_gnu_11.2.0
# source env/bin/activate

#-----------------------------------------------------
# This stops Allinea DDT in the main function.       -
#                                                    -
#-----------------------------------------------------
export ALLINEA_STOP_AT_MAIN=1

#-----------------------------------------------------
# Load the configs for Anansi for RuyLopexz.         -
#                                                    -
#-----------------------------------------------------
cd ${HIPHELLOWORLD_TOP_LEVEL}
source configurations/Crusher.sh

