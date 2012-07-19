## This cmake file contains different settings for the project

# Should the examples be built?
option({project_name_caps}_BUILD_EXAMPLES "Build the examples?" ON)

# Should the tests be built?
option({project_name_caps}_BUILD_TESTS "Build the tests?" OFF)

# Should the (un)install targets NOT be setup?
option({project_name_caps}_DO_NOT_CONFIGURE_INSTALL "Do not configure install?" OFF)

# Set the default path for built executables to the "bin" directory
if(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
    set(EXECUTABLE_OUTPUT_PATH ${{PROJECT_SOURCE_DIR}}/bin)
endif(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
# set the default path for built libraries to the "lib" directory
if(NOT DEFINED LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH ${{PROJECT_SOURCE_DIR}}/lib)
endif(NOT DEFINED LIBRARY_OUTPUT_PATH)

# Uncomment the line below to set the build type
# set(CMAKE_BUILD_TYPE DEBUG)
