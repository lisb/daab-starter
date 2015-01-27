@echo off

rem installer bug. http://stackoverflow.com/a/25095327
mkdir "%APPDATA%\npm" > NUL 2>&1

set PATH=node_modules\.bin;node_modules\hubot\node_modules\.bin;%PATH%
if Defined HUBOT_DIRECT_TOKEN (
  npm install && node_modules\.bin\hubot.cmd -a direct %*
) else (
  npm install && forever start --minUptime 1000 --spinSleepTime 1000 -o hubot.log -a -w --watchDirectory scripts -c coffee node_modules\.bin\hubot.cmd -a direct %*
)
