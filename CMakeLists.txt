cmake_minimum_required(VERSION 3.5)
project(tommy)
find_package(Vulkan REQUIRED)
include(FetchContent)

FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw.git
    GIT_TAG master
)
FetchContent_Declare(
    glm
    GIT_REPOSITORY https://github.com/g-truc/glm.git
    GIT_TAG master
)
FetchContent_Declare(
    assimp
    GIT_REPOSITORY https://github.com/assimp/assimp.git
    GIT_TAG master
)
FetchContent_MakeAvailable(glfw glm assimp)
set(FETCHCONTENT_QUIET OFF)
set(ASSIMP_BUILD_ZLIB OFF)
add_library(tommy_engine STATIC src/engine.cpp src/glfw_scene.cpp)
target_include_directories(tommy_engine PRIVATE include ${Vulkan_INCLUDE_DIRS})
target_link_libraries(tommy_engine PRIVATE glm glfw assimp ${Vulkan_LIBRARIES})