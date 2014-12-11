@echo off
setlocal

rem installer bug. http://stackoverflow.com/a/25095327
mkdir "%APPDATA%\npm" > NUL 2>&1

set BASE=https://direct4b.com/ja/bot/dev/modules
if not exist node_modules\hubot\README_direct.md call npm install %BASE%/hubot.tgz

set PATH=node_modules\.bin;node_modules\hubot\node_modules\.bin;%PATH%
call npm install
call node_modules\.bin\hubot.cmd -d -a direct %*
