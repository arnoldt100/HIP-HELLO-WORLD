#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# CMake preamble section.                                         @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    #-----------------------------------------------------
    # Check that the cmake minimum version is            -
    # satisfied.                                         -
    #                                                    -
    #-----------------------------------------------------
    cmake_minimum_required(VERSION "$ENV{HIPHELLOWORLD_MINIMUM_CMAKE_VERSION}")

    #-----------------------------------------------------
    # Define the project.                                -
    #                                                    -
    #-----------------------------------------------------
    set(my_project_name "hiphelloworld")
    project("${my_project_name}")

    #-----------------------------------------------------
    # Define the target name.                            -
    #                                                    -
    #-----------------------------------------------------
    set(target "${my_project_name}")

    #-----------------------------------------------------
    # Get various dependent target properties.
    #
    #-----------------------------------------------------
    get_target_property(my_say_hello_cpu_include say_hello_cpu say_hello_cpu_include)
    get_target_property(my_say_hello_gpu_include say_hello_gpu say_hello_gpu_include)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of CMake preamble section.                                  @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# Start of C++ build and release section                          @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    #-----------------------------------------------------
    # Here we define some variables.                     -
    # that are critical for building and deploying.      -
    #-----------------------------------------------------
    set(hiphelloworld_cxx_standard "$ENV{HIPHELLOWORLD_CXX_STANDARD}")
    set(hiphelloworld_top_level "$ENV{HIPHELLOWORLD_TOP_LEVEL}") 
    set(hiphelloworld_cmake_cxx_compiler "$ENV{HIPHELLOWORLD_CMAKE_CXX_COMPILER}")
    set(hiphelloworld_cmake_c_compiler "$ENV{HIPHELLOWORLD_CMAKE_C_COMPILER}")
    set(hiphelloworld_install_prefix "$ENV{HIPHELLOWORLD_INSTALL_PREFIX}")
    set(hiphelloworld_install_bin_directory "$ENV{HIPHELLOWORLD_INSTALL_BIN_DIRECTORY}")
    set(hiphelloworld_install_include_directory "$ENV{HIPHELLOWORLD_INSTALL_INCLUDE_DIRECTORY}")
    set(hiphelloworld_install_lib_directory "$ENV{HIPHELLOWORLD_INSTALL_LIB_DIRECTORY}")
    set(hiphelloworld_minimum_cmake_version "$ENV{HIPHELLOWORLD_MINIMUM_CMAKE_VERSION}")


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of C++ build and release section                            @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

                   
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# Here we define the sources and header files associated          @
# with the various targets.                                       @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    #-----------------------------------------------------
    # Here we define the variable
    # hiphelloworld_public_headers that stores header
    # files associated with the hiphelloworld target.
    #  
    #-----------------------------------------------------
    set(hiphelloworld_public_header_files 
        header_files/HIP-Hello-World.h )

    #-----------------------------------------------------
    # Here we define the variable hiphelloworld_public_implementation that
    # stores implementation files associated with the hiphelloworld target.
    # 
    #
    #-----------------------------------------------------
    set(hiphelloworld_public_implementation_files
        implementation_files/HIP-Hello-World.cpp )

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of defining the sources and header files associated         @
# with the hip-hello-world target.                                @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# Start of section that adds the main binary target.              @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    add_executable( "${target}"
                    "" )

    target_sources("${target}"
                   PRIVATE "${hiphelloworld_public_implementation_files}" 
                   PRIVATE "${hiphelloworld_public_header_files}" )

    target_include_directories( "${target}" 
                                PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/header_files"
                                PRIVATE ${my_say_hello_cpu_include}
                                PRIVATE ${my_say_hello_gpu_include})

    #-----------------------------------------------------
    # The libraries to use when linking to target.       -
    #                                                    -
    #-----------------------------------------------------
    target_link_libraries( ${target}
                       PUBLIC say_hello_cpu
                       PUBLIC say_hello_gpu)

    set_target_properties("${target}" PROPERTIES
                          CXX_STANDARD "${hiphelloworld_cxx_standard}" )

    install( TARGETS "${target}" 
             RUNTIME DESTINATION "${hiphelloworld_install_bin_directory}" )
