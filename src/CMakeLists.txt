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
    set(my_project_name "hello_world")
    project(${my_project_name})

    #-----------------------------------------------------
    # Make available the project cmake modules.          -
    #                                                    -
    #-----------------------------------------------------
    include( "${CMAKE_CURRENT_SOURCE_DIR}/cmake_macros_and_functions/hiphelloworld_boost.cmake" )

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#                                                                 @
# End of CMake preamble section.                                  @
#                                                                 @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/say_hello_cpu")
# add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/say_hello_gpu")
# add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/hello_world_main")

