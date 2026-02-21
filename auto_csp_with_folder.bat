@echo off
setlocal enabledelayedexpansion

:: 1. 解決中文亂碼問題 (建議將 config 存為 UTF-8)
chcp 65001 >nul

:: 2. 讀取 config
for /f "usebackq tokens=1* delims==" %%A in ("config/config_csp_with_folder.txt") do (
    set "%%A=%%B"
)

:: 3. 穩定取得日期 (格式為 YYYYMMDD，不含星期)
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do (
    set "dt=%%a"
)
set "DATE_STR=!dt:~0,8!"

:: 4. 路徑正規化 (確保結尾有反斜線)
if not "%target:~-1%"=="\" set "target=%target%\"

:: 5. 檢查並建立目標資料夾 (加雙引號支援中文)
if not exist "%target%" (
    echo [系統] 建立資料夾: "%target%"
    mkdir "%target%"
)

:: 6. 設定初始目標檔名 (使用剛剛抓到的 DATE_STR)
set "TARGET_BASE=%target%%prefix%!DATE_STR!"
set "FILE=!TARGET_BASE!.clip"

:: 7. 自動加數字避免覆寫邏輯
set COUNT=1
:checkfile
if exist "!FILE!" (
    set /A COUNT+=1
    set "FILE=!TARGET_BASE!_!COUNT!.clip"
    goto checkfile
)

:: 8. 複製與開啟 (務必加雙引號)
echo [系統] 正在準備檔案: "!FILE!"
copy "%template%" "!FILE!" /Y >nul

if exist "!FILE!" (
    start "" "!FILE!"
) else (
    echo [錯誤] 檔案建立失敗，請檢查路徑是否有誤。
    pause
    exit /b
)

:: 9. 開啟素材資料夾
if exist "%materials_folder%" (
    start "" "%materials_folder%"
)

echo [完成] 祝創作愉快！
timeout /t 3