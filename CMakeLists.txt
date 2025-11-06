CMAKE_MINIMUM_REQUIRED(VERSION 3.30)

project(pbcount VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/cudd EXCLUDE_FROM_ALL)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/cxxopts EXCLUDE_FROM_ALL)

find_package(Boost REQUIRED)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/interface)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cudd/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cxxopts/include)
include_directories(${Boost_INCLUDE_DIRS})

add_library(core STATIC
  src/implementation/counter.cpp
  src/implementation/formula.cpp
  src/implementation/graph.cpp
  src/implementation/interactive.cpp
  src/implementation/join.cpp
  src/implementation/pbformula.cpp
  src/implementation/util.cpp
  src/implementation/visual.cpp
)

add_executable(pbcount src/implementation/main.cpp)

target_link_libraries(pbcount core cudd::cudd cxxopts::cxxopts)

install(TARGETS pbcount)
