@echo off
setlocal enabledelayedexpansion

:: 設定 config 檔路徑
set CONFIG=urls.txt

:: 讀取 config 檔，每行一個網址
for /f "usebackq tokens=*" %%A in ("%CONFIG%") do (
    set LINE=%%A
    :: 忽略空行或註解
    if not "!LINE!"=="" if "!LINE:~0,1!" NEQ "#" (
        start msedge "!LINE!"
    )
)

endlocal
