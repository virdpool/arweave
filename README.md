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
- CMake
- SQLite3 headers (libsqlite3-dev on Ubuntu)
- GNU MP (libgmp-dev on Ubuntu)

```sh
$ git clone --recursive https://github.com/virdpool/arweave
$ cd arweave
$ ./rebar3 as prod tar
```

for virdpool.testnet use
```
./rebar3 as virdpool_testnet tar
cd _build/virdpool_testnet/rel/arweave
./bin/start port 2984 peer 95.216.170.175:2984 peer 65.21.152.47:2984
```

You will then find the gzipped tarball at `_build/prod/rel/arweave/arweave-x.y.z.tar.gz`.

# Running a gateway

To run a gateway, consult the [gateway setup guide](doc/gateway_setup_guide.md).

# Contributing

Make sure to have the build requirements installed.

Clone the repo and initialize the Git submodules:
```sh
$ git clone --recursive https://github.com/ArweaveTeam/arweave.git
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
