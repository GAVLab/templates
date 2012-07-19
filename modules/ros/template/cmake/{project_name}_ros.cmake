# This cmake file contains ROS specific build settings

set({project_name_caps}_ROS_SUPPORT ON CACHE BOOL "Build {project_name} with ROS support")

find_package(catkin)
if(catkin_FOUND)
  catkin_stack()
endif(catkin_FOUND)

##########
# {project_name}_build_ros_node
# 
# Expected CMake Variables:
#  - {project_name_caps}_ROS_DEPS
#  - {project_name_caps}_ROS_SRCS
#  - {project_name_caps}_ROS_LINK_LIBS
##########
macro({project_name}_build_ros_node)
  if({project_name_caps}_ROS_SUPPORT)
    # Find ROS
    find_package(ROS COMPONENTS ${{{project_name_caps}_ROS_DEPS}})
    if(ROS_FOUND)
      message("-- Building ROS support")
      # Add the ROS include directories
      include_directories(${{ROS_INCLUDE_DIRS}})
      # Add the ROS node
      add_executable({project_name}_node ${{{project_name_caps}_ROS_SRCS}})
      # Link libs
      target_link_libraries(
        {project_name}_node 
        ${{{project_name_caps}_ROS_LINK_LIBS}}
        ${{ROS_LIBRARIES}}
      )
      # Declare a catkin project
      catkin_project(
        ${{PROJECT_NAME}}
        INCLUDE_DIRS include
        LIBRARIES ${{PROJECT_NAME}}
      )
    else(ROS_FOUND)
      message("-- Skipping ROS support - ROS not found")
    endif(ROS_FOUND)
  endif({project_name_caps}_ROS_SUPPORT)
endmacro({project_name}_build_ros_node)
