@echo off

rem installer bug. http://stackoverflow.com/a/25095327
mkdir "%APPDATA%\npm" > NUL 2>&1

set PATH=node_modules\.bin;node_modules\lisb-hubot\node_modules\.bin;%PATH%
call npm install

for /f "delims=\" %%i in ("%CD%") do set UID=%%i

for /f "tokens=1,2 delims==" %%i in (.env) do set %%i=%%j

if "%REDIS_URL%" == "" (
  set REDIS_URL=redis://localhost:6379/%UID%
)

if "%1" == "start" (
  forever start ^
    --uid "%UID%" ^
    --minUptime 10000 --spinSleepTime 600000 ^
    -o hubot.log -a ^
    -w --watchDirectory scripts ^
    -c coffee node_modules\.bin\hubot.cmd -a direct %*
) else if "%1" == "stop" (
  forever stop "%UID%"
) else if "%1" == "restart" (
  forever restart "%UID%"
) else if "%1" == "status" (
  forever list | find "] %UID% "
) else if "%1" == "logs" (
  cat hubot.log | more
) else (
  node_modules\.bin\hubot.cmd -a direct %*
)

