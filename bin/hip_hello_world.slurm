#!/bin/bash
#SBATCH -A stf006
#SBATCH -J hello_world_gpu_cmake_test
#SBATCH -o %x-%j.out
#SBATCH -t 00:05:00
#SBATCH -p batch
#SBATCH -N 1

#-----------------------------------------------------
# Function:                                          -
#    create_empty_dir                                -
#                                                    -
# Synopsis:                                          -
#   Creates an empty directory.                      -
#                                                    -
# Positional parameters:                             -
#                                                    -
#-----------------------------------------------------
function create_empty_dir () {
    local -r my_dir=${1}
    rm -rf "${my_dir}"
    mkdir -p "${my_dir}"
}


#-----------------------------------------------------
# Function:                                          -
#    copy_binary_to_run_dir                          -
#                                                    -
# Synopsis:                                          -
#   Copies binary to the run directory.              -
#                                                    -
# Positional parameters:                             -
#                                                    -
#-----------------------------------------------------
function copy_binary_to_run_dir () {
    local -r my_run_dir=${1}
    local -r my_fully_qual_path_to_bin=${2} 
    cp -f ${my_fully_qual_path_to_bin} ${my_run_dir}
}

#-----------------------------------------------------
# Function:                                          -
#    run_binary                                      -
#                                                    -
# Synopsis:                                          -
#   Runs the binary with srun.                       -
#                                                    -
# Positional parameters:                             -
#                                                    -
#-----------------------------------------------------
function run_binary () {
    local -r my_run_dir=${1}
    local -r my_binary=${2} 
    cd ${my_run_dir}
    srun -n 1 --gpus 1 ${my_binary} 
}

declare -r run_dir="${MEMBERWORK}"/stf006/HIP-HELLO-WORLD
declare -r path_to_binary="${HOME}/sw/HIPHelloWorld/bin/hiphelloworld"
declare -r binary=$(basename "${HOME}/sw/HIPHelloWorld/bin/hiphelloworld")

create_empty_dir "${run_dir}"
copy_binary_to_run_dir "${run_dir}" "${path_to_binary}"
run_binary "${run_dir}" "${binary}"
