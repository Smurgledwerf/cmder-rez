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