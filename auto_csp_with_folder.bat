@echo off
setlocal enabledelayedexpansion

:: 解決中文亂碼問題
chcp 65001 >nul

:: 1. 讀取 config
for /f "usebackq tokens=1* delims==" %%A in ("config/config_csp_with_folder.txt") do (
    set "key=%%A"
    set "val=%%B"
    if not "!val!"=="" (
        for /f "tokens=* delims= " %%i in ("!val!") do set "%%A=%%i"
    )
)

:: 2. 穩定取得日期 (YYYYMMDD)
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do (
    set "dt=%%a"
)
set "DATE_STR=!dt:~0,8!"

:: 3. 路徑正規化
if not "%target:~-1%"=="\" set "target=%target%\"

:: 4. 檢查並建立目標資料夾
if not exist "%target%" (
    echo [系統] 資料夾已建立。
    mkdir "%target%"
)

:: 5. 設定目標檔名
:: 組合格式：[前綴][日期][後綴]
set "TARGET_BASE=%target%%prefix%!DATE_STR!%suffix%"
set "FILE=!TARGET_BASE!.clip"

:: 6. 自動加數字避免覆寫邏輯
set COUNT=1
:checkfile
if exist "!FILE!" (
    set /A COUNT+=1
    :: 若有重複，序號接在最後面
    set "FILE=!TARGET_BASE!_!COUNT!.clip"
    goto checkfile
)

:: 7. 複製與開啟
copy "%template%" "!FILE!" /Y >nul

if exist "!FILE!" (
    echo [系統] 檔案建立完成。
    start "" "!FILE!"
) else (
    echo [錯誤] 檔案建立失敗。
    pause
    exit /b
)

:: 8. 開啟目標資料夾 (依據 True/False 參數)
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

echo [完成] 檔名為: !FILE!
timeout /t
