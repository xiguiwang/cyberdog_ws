# LCM CMake configuration file
find_path(LCM_INCLUDE_DIRS lcm/lcm.h PATHS /usr/include)
find_library(LCM_LIBRARIES lcm PATHS /usr/lib/x86_64-linux-gnu)

if(LCM_INCLUDE_DIRS AND LCM_LIBRARIES)
  set(LCM_FOUND TRUE)
  message(STATUS "Found LCM: ${LCM_LIBRARIES}")
  add_library(lcm::lcm SHARED IMPORTED)
  set_target_properties(lcm::lcm PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${LCM_INCLUDE_DIRS}"
    IMPORTED_LOCATION "${LCM_LIBRARIES}"
  )
else()
  set(LCM_FOUND FALSE)
  message(FATAL_ERROR "Could not locate LCM library or headers")
endif()
