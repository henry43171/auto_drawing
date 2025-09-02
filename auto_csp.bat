@echo off
setlocal enabledelayedexpansion

:: 讀取 config
for /f "usebackq tokens=1,2 delims==" %%A in ("config_csp.txt") do (
    set "%%A=%%B"
)

:: 取得當前日期時間，用於命名複製檔案
for /f "tokens=1-4 delims=/: " %%a in ("%date% %time%") do (
    set DATETIME=%%a%%b%%c
)

:: 設定目標檔名
set TARGET_FILE=%target%CSP_Work_!DATETIME!.clip

:: 複製模板
copy "%template%" "!TARGET_FILE!" /Y

:: 開啟複製後的檔案
start "" "!TARGET_FILE!"

endlocal
