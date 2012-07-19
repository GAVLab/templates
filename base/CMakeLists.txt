## Project Setup
cmake_minimum_required(VERSION 2.4.6)

project({project_name})

## Configurations

include(cmake/{project_name}_settings.cmake)
{include_hook}

## Configure the build system

# Add the include folder to the include path
include_directories(${{PROJECT_SOURCE_DIR}}/include)

# Add default source files
set({project_name_caps}_SRCS src/{project_name}.cc)
# Add default header files
set({project_name_caps}_HEADERS include/{project_name}/{project_name}.h)
# Set link libraries
set({project_name_caps}_LINK_LIBS )

## Build the Serial Library

# Compile the Library
add_library({project_name} ${{{project_name_caps}_SRCS}})
target_link_libraries({project_name} ${{{project_name_caps}_LINK_LIBS}})

## Build Examples

set({project_name_caps}_EXAMPLE_SRCS examples/{project_name}_example.cc)
set({project_name_caps}_EXAMPLE_LINK_LIBS {project_name})
include(cmake/{project_name}_examples.cmake)

## Build Tests

set({project_name_caps}_TEST_SRCS tests/{project_name}_tests.cc)
set({project_name_caps}_TEST_LINK_LIBS {project_name})
include(cmake/{project_name}_tests.cmake)

## Setup Install/Uninstall Targets

include(cmake/{project_name}_targets.cmake)
