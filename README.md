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

### Patch system PATH variable

Ensure you have
- c:\Program Files\erl-24.3.4.6\bin\
- c:\Program Files\Git\cmd
- c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\
- c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64\

String for copypaste
```bat
c:\Program Files\erl-24.3.4.6\bin\;c:\Program Files\Git\cmd;c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\;c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64\
```

Ensure you DON'T have any other cmake in path. E.g. c:\Program Files\CMake
  
```bat
git clone --recursive https://github.com/ArweaveTeam/arweave.git arweave
git clone --recursive https://github.com/erlang/rebar3 rebar3
cd rebar3
bootstrap.bat
cd arweave
..\rebar3\rebar3 tar as prod
```

### Bug reports for windows build

Before posting any bug report please relaunch build from scratch with
```bat
set DIAGNOSTIC=1
```

Build log is important so redirrect it to file
```bat
..\rebar3\rebar3 tar as prod > log
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
