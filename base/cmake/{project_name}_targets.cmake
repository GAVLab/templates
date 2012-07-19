## This file setups the targets like install and uninstall

# If the {project_name_caps}_NO_INSTALL variable is not set or it is false
if (NOT {project_name_caps}_DO_NOT_CONFIGURE_INSTALL)
  # Configure make install
  if (NOT CMAKE_INSTALL_PREFIX)
    set(CMAKE_INSTALL_PREFIX /usr/local)
  endif(NOT CMAKE_INSTALL_PREFIX)

  install(TARGETS {project_name}
          RUNTIME DESTINATION bin
          LIBRARY DESTINATION lib
          ARCHIVE DESTINATION lib
  )

  install(FILES include/{project_name}/{project_name}.h
          DESTINATION include/{project_name})

  if (NOT CMAKE_FIND_INSTALL_PATH)
    set(CMAKE_FIND_INSTALL_PATH ${{CMAKE_ROOT}})
  endif(NOT CMAKE_FIND_INSTALL_PATH)

  install(FILES Find{project_name}.cmake
          DESTINATION ${{CMAKE_FIND_INSTALL_PATH}}/Modules/)

  # Configure make uninstall
  add_custom_target(uninstall @echo uninstall package)

  if (UNIX)
    add_custom_command(
      COMMENT "uninstall package"
      COMMAND xargs ARGS rm < install_manifest.txt

      TARGET  uninstall
    )
  else(UNIX)
    add_custom_command(
      COMMENT "uninstall only implemented in unix"
      TARGET  uninstall
    )
  endif(UNIX)
endif(NOT {project_name_caps}_DO_NOT_CONFIGURE_INSTALL)
