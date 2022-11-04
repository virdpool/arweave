# RandomX works? So copypaste stuff from there

cmake_minimum_required(VERSION 2.8.7)

project(arweave)

set(arweave_sources
ar_mine_randomx.c
randomx_long_with_entropy.cpp
feistel_msgsize_key_cipher.cpp)

add_library(arweave SHARED ${arweave_sources})
include_directories("c:/Program Files/erl-24.3.4.6/usr/include")
include_directories("../../../../vcpkg/buildtrees/gmp/x64-windows-rel")
include_directories("../../../../vcpkg/buildtrees/openssl/x64-windows-rel/include")
include_directories("../lib/RandomX/src")

target_link_libraries(arweave PUBLIC "../../../../../vcpkg/buildtrees/gmp/x64-windows-rel/.libs/gmp")
target_link_libraries(arweave PUBLIC "../../../../../vcpkg/buildtrees/openssl/x64-windows-rel/libcrypto")
target_link_libraries(arweave PUBLIC "../../lib/RandomX/build/Release/randomx")
