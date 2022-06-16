@echo off

REM initialize rez
REM NOTE: replace this with whatever rez-initialization script you use
call Z:\rez\init.bat
REM enable CmderRez plugin
REM NOTE: replace this with your rez plugin path
set REZ_PLUGIN_PATH=Z:\rez\plugins\cmder-rez;%REZ_PLUGIN_PATH%
set REZ_DEFAULT_SHELL=cmder_cmd

REM source custom aliases
call %USERPROFILE%\.cmder_aliases.cmd

REM disable the git status in the prompt, technically only needs to be run once
git config --global --replace-all cmder.status false

REM go to my home dir
cd %USERPROFILE%