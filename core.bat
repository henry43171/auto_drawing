@echo off
setlocal enabledelayedexpansion

:: 解決中文亂碼問題
chcp 65001 >nul

:: --- [核心重構點] ---
:: 如果外部有給參數（%1），就用參數當設定檔路徑
:: 如果沒有（直接點 core.bat），就預設用原本的 config
if "%~1"=="" (
    set "CONFIG_PATH=config/config_csp_with_folder.txt"
) else (
    set "CONFIG_PATH=%~1"
)

:: 1. 讀取 config (這裡改用 !CONFIG_PATH!)
if not exist "!CONFIG_PATH!" (
    echo [錯誤] 找不到設定檔: !CONFIG_PATH!
    pause
    exit /b
)

for /f "usebackq tokens=1* delims==" %%A in ("!CONFIG_PATH!") do (
    set "key=%%A"
    set "val=%%B"
    if not "!val!"=="" (
        for /f "tokens=* delims= " %%i in ("!val!") do set "%%A=%%i"
    )
)

:: --- 以下邏輯維持不變 ---

:: 2. 穩定取得日期 (YYYYMMDD)
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do (
    set "dt=%%a"
)
set "DATE_STR=!dt:~0,8!"

:: 3. 路徑正規化
if not "%target:~-1%"=="\" set "target=%target%\"

:: 4. 檢查並建立目標資料夾
if not exist "%target%" (
    echo [系統] 正在建立目標資料夾...
    mkdir "%target%"
)

:: 5. 設定目標檔名
set "TARGET_BASE=%target%%prefix%!DATE_STR!%suffix%"
set "FILE=!TARGET_BASE!.clip"

:: 6. 自動加數字避免覆寫邏輯
set COUNT=1
:checkfile
if exist "!FILE!" (
    set /A COUNT+=1
    set "FILE=!TARGET_BASE!_!COUNT!.clip"
    goto checkfile
)

:: 7. 複製與開啟
copy "%template%" "!FILE!" /Y >nul

if exist "!FILE!" (
    echo [系統] 檔案建立完成: !FILE!
    start "" "!FILE!"
) else (
    echo [錯誤] 檔案建立失敗。
    pause
    exit /b
)

:: 8. 開啟目標資料夾
if /i "%open_target_folder%"=="True" (
    if exist "%target%" (
        echo [系統] 開啟目標資料夾...
        start "" "%target%"
        timeout /t 1 >nul
    )
)

:: 9. 開啟素材資料夾
if exist "%materials_folder%" (
    echo [系統] 開啟素材資料夾...
    start "" "%materials_folder%"
)

echo [完成] 祝創作愉快！
timeout /t 3