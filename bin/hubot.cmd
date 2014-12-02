@echo off

if not exist node_modules\hubot\README_direct.md npm install node_modules_pack\*
npm install && node_modules\.bin\hubot.cmd %* 
