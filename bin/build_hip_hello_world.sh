#!  /usr/bin/env bash

#-----------------------------------------------------
# Define the Anansi buld directory.                  -
#                                                    -
#-----------------------------------------------------
declare -r hiphelloworld_cmake_build_dir="build"

#-----------------------------------------------------
# The number of make threads.                        -
#                                                    -
#-----------------------------------------------------
declare -r -i NM_MAKE_THREADS=1

#-----------------------------------------------------
# Define a log file                                  -
#                                                    -
#-----------------------------------------------------
declare -r log_file="${HIPHELLOWORLD_TOP_LEVEL}/hiphelloworld_log.txt"

#-----------------------------------------------------
# No edits should be needed below this line.         -
#                                                    -
#-----------------------------------------------------

if [ -f ${log_file} ]
then
    rm -f ${log_file}
fi

if [ -d ${hiphelloworld_cmake_build_dir} ]
then
    rm -rf ${hiphelloworld_cmake_build_dir}
fi
mkdir ${hiphelloworld_cmake_build_dir}

cd ${hiphelloworld_cmake_build_dir}

cmake ${HIPHELLOWORLD_TOP_LEVEL}/src \
      -DCMAKE_CXX_COMPILER=${HIPHELLOWORLD_CMAKE_CXX_COMPILER} \
      -DCMAKE_C_COMPILER=${HIPHELLOWORLD_CMAKE_C_COMPILER} \
      -DCMAKE_INSTALL_PREFIX=${HIPHELLOWORLD_INSTALL_PREFIX} \
      -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=1

make -j ${NM_MAKE_THREADS}

make install
