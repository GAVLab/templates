# If asked to and there are some test src files
if({project_name_caps}_BUILD_TESTS AND DEFINED {project_name_caps}_TEST_SRCS)
  # If GTest is avialable
  find_package(GTest)
  if(GTEST_FOUND)
    message("-- Building {project_name} Tests")
    # Add GTest to the include path
    include_directories(${{GTEST_INCLUDES}})
    # Compile the {project_name} tests
    add_executable({project_name}_tests ${{{project_name_caps}_TEST_SRCS}})
    # Link the tests to the {project_name} library
    target_link_libraries({project_name}_tests ${{{project_name_caps}_TEST_LINK_LIBS}}
                                               ${{GTEST_LIBRARIES}})
  else(GTEST_FOUND)
    message("-- Skipping {project_name} Tests - GTest not Found!")
  endif(GTEST_FOUND)
endif({project_name_caps}_BUILD_TESTS AND DEFINED {project_name_caps}_TEST_SRCS)
