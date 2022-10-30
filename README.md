# Arweave Server

This is the repository for the official Erlang implementation of the Arweave
protocol and a gateway implementation.

Arweave is a distributed, cryptographically verified permanent archive built
on a cryptocurrency that aims to, for the first time, provide feasible data
permanence. By leveraging our novel Blockweave datastructure, data is stored
in a decentralised, peer-to-peer manner where miners are incentivised to
store rare data.

# Getting Started

Download and extract the latest archive for your platform on the release
page, then run the included `bin/start` script to get started.

For more information, refer to the [mining guide](https://docs.arweave.org/info/mining/mining-guide).

# Building from source

## Requirements

- Erlang OTP v23+, with OpenSSL support
- GCC or Clang
- GNU Make
- CMake (CMake version > 3.10.0)
- SQLite3 headers (libsqlite3-dev on Ubuntu)
- GNU MP (libgmp-dev on Ubuntu)

```sh
$ git clone --recursive https://github.com/ArweaveTeam/arweave.git
$ cd arweave
$ ./rebar3 as prod tar
```

You will then find the gzipped tarball at `_build/prod/rel/arweave/arweave-x.y.z.tar.gz`.

# Contributing

Make sure to have the build requirements installed.

Clone the repo and initialize the Git submodules:
```sh
$ git clone --recursive https://github.com/ArweaveTeam/arweave.git
```

## Building on Windows

Still experimental (currently works only with 2.5 master)

### Requirements

- otp_win64_24.3.4.6.exe (https://www.erlang.org/downloads OTP 25 will not work)
- Git-2.38.0-64-bit.exe (https://git-scm.com/download/win)
- vs_BuildTools.exe VS 2019 (https://aka.ms/vs/16/release/vs_buildtools.exe)
- Open Visual Studio installer, select
  - Visual C++ Build Tools (main screen)
  - In second tab (ensure selected):
    - Universal CRT
    - SDK for Windows 10
    - Cmake
  
### Build

```bat
git clone --recursive https://github.com/erlang/rebar3 rebar3
cd rebar3
set PATH=%PATH%;c:\Program Files\erl-24.3.4.6\bin
bootstrap.bat
cd ..

git clone https://github.com/microsoft/vcpkg
cd vcpkg
bootstrap-vcpkg.bat
# WIN7 ONLY
# go download
# https://github.com/nalexandru/api-ms-win-core-path-HACK/releases
# https://github.com/nalexandru/api-ms-win-core-path-HACK/releases/download/0.3.1/api-ms-win-core-path-blender-0.3.1.zip
# unpack
# copy as api-ms-win-core-path-HACK recommends (admin required)
# copy x64\api-ms-win-core-path-l1-1-0.dll C:\Windows\System32
# copy x86\api-ms-win-core-path-l1-1-0.dll C:\Windows\SysWOW64
# WIN7 ONLY
vcpkg install zlib:x64-windows
vcpkg install zlib:x86-windows
# (as admin)
copy installed\x64-windows\bin\zlib1.dll C:\Windows\System32
copy installed\x86-windows\bin\zlib1.dll C:\Windows\SysWOW64
vcpkg install python3[deprecated-win7-support]

vcpkg install gmp:x64-windows
vcpkg install openssl:x64-windows
cd ..


git clone --recursive https://github.com/virdpool/arweave.git arweave
cd arweave
git checkout miner_experimental_2.5.2.0_win
git submodule update

# if needed go arweave/apps/arweave/c_src/CMakeLists.txt
# patch this line with your path to erlang includes
# include_directories("c:/Program Files/erl-24.3.4.6/usr/include")
# Also you need patch vcpkg dir if your installation folder is somewhere else then recommended path before
# include_directories("../../../../vcpkg/buildtrees/gmp/x64-windows-rel")
# include_directories("../../../../vcpkg/buildtrees/openssl/x64-windows-rel/include")

# look win_build.bat
# Ensure ERL, GIT, MSVC_CMAKE, MSVC_TOOLS are correct in win_build.bat (script will autodetect if not exists)
win_build.bat
# Ensure ERL is correct in win_dist.bat (script will autodetect if not exists)
win_dist.bat

```

## Running a node locally

```sh
$ bin/start-dev
```

## Running the tests

```sh
$ bin/test
```

## Running a shell

```sh
$ bin/shell
```

`bin/test` and `bin/shell` launch two connected Erlang VMs in distributed mode. The
master VM runs an HTTP server on the port 1984. The slave VM uses the
port 1983. The data folders are `data_test_master` and `data_test_slave`
respectively. The tests that do not depend on two VMs are run against the
master VM.

See [CONTRIBUTING.md](CONTRIBUTING.md) for more information.

# HTTP API

You can find documentation regarding our HTTP interface [here](http_iface_docs.md).

# Contact

If you have questions or comments about Arweave you can get in touch by
finding us on [Twitter](https://twitter.com/ArweaveTeam/), [Reddit](https://www.reddit.com/r/arweave), [Discord](https://discord.gg/DjAFMJc) or by
emailing us at team@arweave.org.


For more information about the Arweave project visit [https://www.arweave.org](https://www.arweave.org/)
or have a look at our [yellow paper](https://www.arweave.org/files/arweave-yellowpaper.pdf).

# License

The Arweave project is released under GNU General Public License v2.0.
See [LICENSE](LICENSE.md) for full license conditions.

# Arweave Bug Bounty Program

Arweave core team has initiated an Arweave bug bounty program, with a maximum bounty of up to USD `1,000,000`. The program is focused on discovering potential technical vulnerabilities and strengthening Arweave core protocol security.

The Arweave core team puts security as its top priority and has dedicated resources to ensure high incentives to attract the community at large to evaluate and safeguard the ecosystem. Whilst building Arweave, the team has engaged with industry-leading cybersecurity audit firms specializing in Blockchain Security to help secure the codebase of Arweave protocol.

We encourage developers, whitehat hackers to participate, evaluate the code base and hunt for bugs, especially on issues that could potentially put users’ funds or data at risk. In exchange for a responsibly disclosed bug, the bug bounty program will reward up to USD `1,000,000` (paid in `$AR` tokens) based on the vulnerability severity level, at the discretion of the Arweave team. Please email us at team@arweave.org to get in touch.
