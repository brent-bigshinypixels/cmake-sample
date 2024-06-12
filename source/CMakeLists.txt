cmake_minimum_required(VERSION 3.27)

if(APPLE)
    set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64")
endif()

project(MyApp VERSION 1.0.0 LANGUAGES CXX)

add_executable(MyExe main.cpp)
