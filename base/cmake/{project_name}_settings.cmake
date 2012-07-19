## This cmake file contains different settings for the project

# Should the examples be built?
option({project_name_caps}_BUILD_EXAMPLES "Build the examples?" ON)

# Should the tests be built?
option({project_name_caps}_BUILD_TESTS "Build the tests?" OFF)

# Set the default path for built executables to the "bin" directory
# if(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
    set(EXECUTABLE_OUTPUT_PATH ../bin)
# endif(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
# set the default path for built libraries to the "lib" directory
# if(NOT DEFINED LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH ../lib)
# endif(NOT DEFINED LIBRARY_OUTPUT_PATH)

# Uncomment the line below to set the build type
# set(CMAKE_BUILD_TYPE DEBUG)
