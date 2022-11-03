set ERL_EPMD_ADDRESS=127.0.0.1
set NODE_NAME="arweave@127.0.0.1"
set PATH=erl_dist\bin;%PATH%

REM WARNING ensure no spaces after ^

REM peer 188.166.200.45 peer 188.166.192.169 peer 163.47.11.64 peer 139.59.51.59 peer 138.197.232.192

erl +MBas aobf +MBlmbcs 512 +A100 +SDio100 +Bi ^
  -pa _build/default/lib/rocksdb/ebin  _build/default/lib/ranch/ebin  _build/default/lib/prometheus_process_collector/ebin  _build/default/lib/prometheus_httpd/ebin  _build/default/lib/prometheus_cowboy/ebin  _build/default/lib/prometheus/ebin  _build/default/lib/jiffy/ebin  _build/default/lib/gun/ebin  _build/default/lib/graphql/ebin  _build/default/lib/cowlib/ebin  _build/default/lib/cowboy/ebin  _build/default/lib/b64fast/ebin  _build/default/lib/accept/ebin  _build/default/lib/arweave/ebin  _build/default/lib/ar_sqlite3/ebin ^
  -config config/sys.config ^
  -args_file config/vm.args.dev ^
  -run ar main ^
  data_dir blockchain_data_dir ^
  peer testnet-1.arweave.net peer testnet-3.arweave.net peer testnet-5.arweave.net
  
