@echo off
SET BASE=https://direct4b.com/ja/bot/dev/modules
if not exist node_modules\hubot\README_direct.md npm install %BASE%/hubot.tgz
npm install && node_modules\.bin\hubot.cmd -d -a direct %* 
