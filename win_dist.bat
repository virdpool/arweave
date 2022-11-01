set ERL=c:\Program Files\erl-24.3.4.6

if exist "%ERL%\" (
  echo ERL check OK
) else (
  echo ERL "%ERL%" doesn't exists
  exit /b 1
)

rd /s /q win_dist
del win_dist.zip

mkdir win_dist\arweave\_build
mkdir win_dist\arweave\config
mkdir win_dist\arweave\data
mkdir win_dist\arweave\erl_dist

xcopy /E config win_dist\arweave\config
xcopy /E data win_dist\arweave\data
xcopy /E _build win_dist\arweave\_build
xcopy /E "%ERL%" win_dist\arweave\erl_dist
copy scripts\start.bat win_dist\arweave
copy scripts\stop.bat win_dist\arweave

mkdir win_dist\arweave\apps\ar_sqlite3\priv
copy apps\ar_sqlite3\priv\ar_sqlite3_driver.exe win_dist\arweave\apps\ar_sqlite3\priv\ar_sqlite3_driver.exe

copy ..\vcpkg\buildtrees\gmp\x64-windows-rel\.libs\gmp-10.dll win_dist\arweave
copy ..\vcpkg\buildtrees\openssl\x64-windows-rel\libcrypto-3-x64.dll win_dist\arweave

CScript _win_dist.vbs win_dist win_dist.zip
