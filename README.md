# CmderRez

Rez plugin for Cmder to retain the linux-like commands in a rez environment.

Set Up Cmder on windows
----------------------

### Cmder Settings

1. Go to the [Cmder site](https://cmder.app/)
1. Download Cmder (full), unzip, and launch it
1. Optional but recommended to install Notepad++
1. Open the menu on the bottom right and go to Settings > Startup > Tasks
1. Click on {cmd::Cmder} and then Clone
1. Name it "cmd::custom" or something
1. Edit the commands text box to read `cmd /k ""%ConEmuDir%\..\init.bat" & "%USERPROFILE%\.cmderrc.bat" "`
1. Go to Startup in the Settings and select your custom task in the dropdown

### Startup File

Copy the `.cmderrc.bat` file to your home directory, which should look like:
```bat
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
```

### Aliases

Copy the `.cmder_aliases.cmd` file to your home directory, which should look like:
```bat
;= @echo off
;= REM Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= REM In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here

;= REM quick alias for editing the aliases
aliases="C:\Program Files (x86)\Notepad++\notepad++.exe" %USERPROFILE%\.cmder_aliases.cmd

;= REM a "which" that looks in aliases first
which=doskey /MACROS | grep -P "^$1=" || which $1

;= REM optional, add whatever additional aliases you want
home=cd %USERPROFILE%

;= REM ******************************************************************
;= REM * EOF - Don't Remove the following line. It clears out the ';'
;= REM * macro. We're using it because there is no support for comments
;= REM * in a DOSKEY macro file.
;= REM ******************************************************************
;=
```

### Test Run

1. Start a new Cmder process
1. ``renv python-3``
1. ``ls``
1. It should list your home directory contents

## TODO

1. Inject [clink](https://mridgers.github.io/clink/) into new processes

Contributing
------------

To contribute, submit a pull request to the "develop" branch and submit to code review.

Release
-------

1. Make sure this README is up-to-date.
1. Make a `"[REL] <version number>"` release commit.
1. Go to `Z:\rez\plugins\cmder-rez` (or wherever you deploy it)
1. `git pull upstream main`
