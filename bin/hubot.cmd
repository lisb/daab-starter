@echo off

rem installer bug. http://stackoverflow.com/a/25095327
mkdir "%APPDATA%\npm" > NUL 2>&1

set PATH=node_modules\.bin;node_modules\hubot\node_modules\.bin;%PATH%
npm install && node_modules\.bin\hubot.cmd -d -a direct %*
