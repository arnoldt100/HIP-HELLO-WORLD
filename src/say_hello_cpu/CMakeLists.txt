# This CMakeLists.txt file creates the library libinvoker.a
# and its unit tests. To add source files, simply append the appropiate variable
# invoker_header_files or invoker_implementation_files.
#
# The target for the library is invoker.
#
# The following properties are set for the target invoker.
#
#   Property                            Value                                               Description
#----------------------------------------------------------------------------------------------------------------------------
#


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# CMake preamble section.                                         @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    #-----------------------------------------------------
    # Define the project.                                -
    #                                                    -
    #-----------------------------------------------------
    set(my_project_name "say_hello_cpu")
    project(${my_project_name})

    #-----------------------------------------------------
    # Define the target name.                            -
    #                                                    -
    #-----------------------------------------------------
    set(target ${my_project_name})

    #-----------------------------------------------------
    # Define the property name for the include directory.
    # 
    #-----------------------------------------------------
    set(my_target_include_property_name "say_hello_cpu_include")

    #-----------------------------------------------------
    # Get various dependent target properties.
    #
    #-----------------------------------------------------

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of CMake preamble section.                                  @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# Start of CMake build  and release section.                      @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    #-----------------------------------------------------
    # Here we define some variables.                     -
    # that are critical for building and deploying.      -
    #-----------------------------------------------------
    set(say_hello_cpu_cxx_standard "$ENV{HIPHELLOWORLD_CXX_STANDARD}")
    set(say_hello_cpu_cmake_cxx_compiler "$ENV{HIPHELLOWORLD_CMAKE_CXX_COMPILER}")
    set(say_hello_cpu_cmake_c_compiler "$ENV{HIPHELLOWORLD_CMAKE_C_COMPILER}")
    set(say_hello_cpu_install_prefix "$ENV{HIPHELLOWORLD_INSTALL_PREFIX}")
    set(say_hello_cpu_install_bin_directory "$ENV{HIPHELLOWORLD_INSTALL_BIN_DIRECTORY}")
    set(say_hello_cpu_install_include_directory "$ENV{HIPHELLOWORLD_INSTALL_INCLUDE_DIRECTORY}")
    set(say_hello_cpu_install_lib_directory "$ENV{HIPHELLOWORLD_INSTALL_LIB_DIRECTORY}")
    set(say_hello_cpu_minimum_cmake_version "$ENV{HIPHELLOWORLD_MINIMUM_CMAKE_VERSION}")

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of CMake build  and release section.                        @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# Here we define the sources and header files associated          @
# with the various targets.                                       @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    
    #-----------------------------------------------------
    # Here we define the variable                        -
    # say_hello_cpu_header_files.                        -
    # A list of header files is stored in                -
    # this variable.                                     -
    #                                                    -
    #-----------------------------------------------------
    set (say_hello_cpu_header_files
        header_files/say_hello_cpu.h )

    #-----------------------------------------------------
    # Here we define the variable                        -
    # say_hello_cpu_implementation_files.                -
    # A list of implementation files is stored in this   -
    # variable.                                          -
    #                                                    -
    #-----------------------------------------------------
    set (say_hello_cpu_implementation_files
         implementation_files/say_hello_cpu.cpp )

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of defining the sources and header files associated         @
# with the command_line_arguments targets.                        @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#-----------------------------------------------------
# Add the library associated with target             -
# command_line_arguments.                            -
#                                                    -
#-----------------------------------------------------
add_library( ${target} STATIC 
             "")

#-----------------------------------------------------
#                                                    -
# We associate the source files with the target.     -
#                                                    -
#-----------------------------------------------------
target_sources(${target}
               PRIVATE ${say_hello_cpu_header_files} ${say_hello_cpu_implementation_files} )

#-----------------------------------------------------
# Add the directory header_files to search for       -
# header files.                                      -
#                                                    -
#-----------------------------------------------------
target_include_directories(${target} 
                           PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/header_files )

#-----------------------------------------------------
# The libraries to use when linking to target.       -
#                                                    -
#-----------------------------------------------------

#-----------------------------------------------------
# Here we set the properties on target               -
#                                                    -
#-----------------------------------------------------
set_target_properties(${target} PROPERTIES
                      "${my_target_include_property_name}" ${CMAKE_CURRENT_SOURCE_DIR}/header_files
                      CXX_STANDARD "${say_hello_cpu_cxx_standard}"
                      PUBLIC_HEADER "${say_hello_cpu_header_files}" )

install( TARGETS ${target}
         ARCHIVE DESTINATION ${say_hello_cpu_install_lib_directory}
         PUBLIC_HEADER DESTINATION ${say_hello_cpu_install_include_directory} )
