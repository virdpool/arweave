set ERL_EPMD_ADDRESS=127.0.0.1
set PATH=erl_dist\bin;%PATH%

erl ^
  -pa _build/default/lib/rocksdb/ebin  _build/default/lib/ranch/ebin  _build/default/lib/prometheus_process_collector/ebin  _build/default/lib/prometheus_httpd/ebin  _build/default/lib/prometheus_cowboy/ebin  _build/default/lib/prometheus/ebin  _build/default/lib/jiffy/ebin  _build/default/lib/gun/ebin  _build/default/lib/graphql/ebin  _build/default/lib/cowlib/ebin  _build/default/lib/cowboy/ebin  _build/default/lib/b64fast/ebin  _build/default/lib/accept/ebin  _build/default/lib/arweave/ebin  _build/default/lib/ar_sqlite3/ebin ^
  -noshell ^
  -config config/sys.config ^
  -name stopper@127.0.0.1 ^
  -setcookie arweave ^
  -s ar shutdown arweave@127.0.0.1 ^
  -s init stop
