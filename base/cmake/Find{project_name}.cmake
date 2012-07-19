find_path({project_name}_INCLUDE_DIRS {project_name}/{project_name}.h /usr/include 
          /usr/local/include "$ENV{{NAMER_ROOT}}")

find_library({project_name}_LIBRARIES {project_name} /usr/lib /usr/local/lib
             "$ENV{{NAMER_ROOT}}")

if(NOT {project_name}_INCLUDE_DIRS OR NOT {project_name}_LIBRARIES)
  set({project_name}_FOUND on)
else(NOT {project_name}_INCLUDE_DIRS OR NOT {project_name}_LIBRARIES)
  set({project_name}_FOUND off)
endif(NOT {project_name}_INCLUDE_DIRS OR NOT {project_name}_LIBRARIES)
