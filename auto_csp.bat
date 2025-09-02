@echo off
setlocal enabledelayedexpansion

:: 讀取 config
for /f "usebackq tokens=1,2 delims==" %%A in ("config_csp.txt") do (
    set "%%A=%%B"
)

:: 取得日期，用於命名複製檔案
for /f "tokens=1-3 delims=/- " %%a in ("%date%") do (
    set DATE=%%a%%b%%c
)

:: 設定目標檔名
set TARGET_FILE=%target%%prefix%!DATE!.clip

:: 複製模板
copy "%template%" "!TARGET_FILE!" /Y

:: 開啟複製後的檔案
start "" "!TARGET_FILE!"

endlocal
