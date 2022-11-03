set ERL=c:\Program Files\erl-24.3.4.6
set ERL_BIN=%ERL%\bin
set MSVC_CMAKE=c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin
set MSVC_TOOLS=c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64
set MSVC_IDE=c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\IDE

if exist "%ERL_BIN%\" (
  echo ERL_BIN check OK
) else (
  echo ERL_BIN "%ERL_BIN%" doesn't exists
  exit /b 1
)

if exist "%MSVC_CMAKE%\" (
  echo MSVC_CMAKE check OK
) else (
  echo MSVC_CMAKE "%MSVC_CMAKE%" doesn't exists
  exit /b 1
)

if exist "%MSVC_TOOLS%\" (
  echo MSVC_TOOLS check OK
) else (
  echo MSVC_TOOLS "%MSVC_TOOLS%" doesn't exists
  exit /b 1
)

if exist "%MSVC_IDE%\" (
  echo MSVC_IDE check OK
) else (
  echo MSVC_IDE "%MSVC_IDE%" doesn't exists
  exit /b 1
)

rd /s /q _build

set PATH=%ERL_BIN%;%MSVC_CMAKE%;%MSVC_TOOLS%;%MSVC_IDE%;%PATH%
echo "%PATH%"
set DIAGNOSTIC=1
REM enable this and disable next line if you want bug report
REM ..\rebar3\rebar3 compile > compile.log
..\rebar3\rebar3 compile
if %errorlevel% neq 0\ (
  echo "BUILD FAILED"
  exit /b %errorlevel%
)
