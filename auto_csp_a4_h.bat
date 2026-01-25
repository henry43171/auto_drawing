@echo off
setlocal enabledelayedexpansion

:: 讀取 config
for /f "usebackq tokens=1* delims==" %%A in ("config/config_csp_a4_h.txt") do (
    set "%%A=%%B"
)

:: 檢查目標資料夾是否存在，不存在則建立
if not exist "%target%" (
    echo Target folder does not exist, creating it: %target%
    mkdir "%target%"
)

:: 取得日期，用於命名複製檔案
for /f "tokens=1-3 delims=/- " %%a in ("%date%") do (
    set DATE=%%a%%b%%c
)

:: 設定初始目標檔名
set TARGET_FILE=%target%%prefix%!DATE!.clip

:: 如果檔案存在，自動加數字避免覆寫
set COUNT=1
set FILE=!TARGET_FILE!
:checkfile
if exist "!FILE!" (
    set /A COUNT+=1
    set FILE=%target%%prefix%!DATE!_!COUNT!.clip
    goto checkfile
)

:: 複製模板
copy "%template%" "!FILE!" /Y

:: 開啟複製後的檔案
start "" "!FILE!"

echo materials_folder=!materials_folder!

