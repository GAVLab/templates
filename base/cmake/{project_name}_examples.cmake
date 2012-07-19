# If asked to and there are some example src files
if({project_name_caps}_BUILD_EXAMPLES AND DEFINED {project_name_caps}_EXAMPLE_SRCS)
  message("-- Build {project_name} Examples")
  # Compile the {project_name} examples
  add_executable({project_name}_example ${{{project_name_caps}_EXAMPLE_SRCS}})
  # Link the examples to link libs
  target_link_libraries({project_name}_example ${{{project_name_caps}_EXAMPLE_LINK_LIBS}})
endif({project_name_caps}_BUILD_EXAMPLES AND DEFINED {project_name_caps}_EXAMPLE_SRCS)
