

## Build ROS Node

# Set the ROS source files, ROS deps, and link libs, then build the node
set({project_name_caps}_ROS_SRCS src/{project_name}_node.cc)
set({project_name_caps}_ROS_DEPS roscpp)
set({project_name_caps}_ROS_LINK_LIBS {project_name})
{project_name}_build_ros_node()