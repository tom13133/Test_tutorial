cmake_minimum_required(VERSION 2.8.3)
project(esr_driver)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  socketcan_interface
  visualization_msgs
  message_generation
  std_msgs
  esr_msgs
)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

generate_messages(
  DEPENDENCIES
    std_msgs
    visualization_msgs
)

catkin_package(
  INCLUDE_DIRS
    include
  LIBRARIES
    esr_can_to_topic
  CATKIN_DEPENDS
    roscpp
    socketcan_interface
    message_runtime
    std_msgs
    esr_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_library(esr_can_to_topic
  src/socketcan_to_topic.cpp
)
target_link_libraries(esr_can_to_topic
  ${catkin_LIBRARIES}
)
add_dependencies(esr_can_to_topic
  ${catkin_EXPORTED_TARGETS}
)

add_executable(esr_can_to_topic_node
  src/socketcan_to_topic_node.cpp
)
target_link_libraries(esr_can_to_topic_node
  esr_can_to_topic
  ${catkin_LIBRARIES}
)

install(
  TARGETS
    esr_can_to_topic
    esr_can_to_topic_node
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(
  DIRECTORY
    include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)
