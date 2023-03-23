#! /usr/bin/env bash

#-----------------------------------------------------
# Define the top level directory of anansi           -
#                                                    -
#-----------------------------------------------------
if [ -z ${HIPHELLOWORLD_TOP_LEVEL+x} ]
then
    export HIPHELLOWORLD_TOP_LEVEL=${HOME}/HIP-HELLO-WORLD
fi

#-----------------------------------------------------
# Define the c++ compiler.                           -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_CMAKE_CXX_COMPILER=hipcc

# ----------------------------------------------------
# Define the c++ compiler standard.
# 
# ----------------------------------------------------
export HIPHELLOWORLD_CXX_STANDARD=20

#-----------------------------------------------------
# Define the c compiler.                             -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_CMAKE_C_COMPILER=hipcc

#-----------------------------------------------------
# Define the install prefix.                         -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_INSTALL_PREFIX="${HOME}/sw/HIPHelloWorld"

#-----------------------------------------------------
# Define the anansi bin directory.                   -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_INSTALL_BIN_DIRECTORY="${HIPHELLOWORLD_INSTALL_PREFIX}/bin"

#-----------------------------------------------------
# Define the anansi include directory.               -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_INSTALL_INCLUDE_DIRECTORY="${HIPHELLOWORLD_INSTALL_PREFIX}/include"

#-----------------------------------------------------
# Define the anansi include directory.               -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_INSTALL_LIB_DIRECTORY="${HIPHELLOWORLD_INSTALL_PREFIX}/lib"

#-----------------------------------------------------
# Define the anansi boost root path.                 -
#                                                    -
#-----------------------------------------------------
export HIPHELLOWORLD_BOOST_TOP_LEVEL=${BOOST_TOP_LEVEL}

#-----------------------------------------------------
# This anansi core configuration must be sourced.    -
#                                                    -
#-----------------------------------------------------
source "${HIPHELLOWORLD_TOP_LEVEL}/configurations/hiphelloworld_core_configurations.sh"

