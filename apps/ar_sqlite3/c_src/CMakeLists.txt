# RandomX works? So copypaste stuff from there

cmake_minimum_required(VERSION 2.8.7)

project(ar_sqlite3_driver)

set(arweave_sources
erl_comm.c
sqlite3.c
sqlite3_driver.c)

include_directories("c:/Program Files/erl-24.3.4.6/usr/include")
include_directories("c:/Program Files/erl-24.3.4.6/usr/lib")
# credits https://github.com/georgegerdin/nuklear-examples-vcpkg/blob/master/unistd.h
include_directories("win")

add_executable(ar_sqlite3_driver ${arweave_sources})
set_property(TARGET ar_sqlite3_driver PROPERTY C_STANDARD 99)
target_link_libraries(ar_sqlite3_driver PUBLIC "c:/Program Files/erl-24.3.4.6/usr/lib/ei.lib")
target_link_libraries(ar_sqlite3_driver PUBLIC "c:/Program Files/erl-24.3.4.6/usr/lib/ei_md.lib")

# fix ei.h
add_definitions(-D__WIN32__)
