@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 讀取 config_csp_project.txt
for /f "usebackq tokens=1* delims==" %%A in ("config/config_csp_project.txt") do (
    set "%%A=%%B"
)

:: 去掉前後空格（防止 config 有空格）
set "template=!template:~0!"
set "sample_folder=!sample_folder:~0!"
set "homework_folder=!homework_folder:~0!"
set "pdf_ref=!pdf_ref:~0!"

:: 開啟 Clip Studio 檔案
if defined template (
    if not "!template!"=="" (
        if exist "!template!" (
            start "" "!template!"
        ) else (
            echo .clip 檔案不存在或路徑錯誤，跳過。
        )
    )
)

:: 開啟 PDF 參考
if defined pdf_ref (
    if not "!pdf_ref!"=="" (
        if exist "!pdf_ref!" (
            start "" "!pdf_ref!"
        ) else (
            echo PDF 檔案不存在或路徑錯誤，跳過。
        )
    )
)

:: 開啟範例資料夾（僅在不為空時）
if defined sample_folder if not "!sample_folder!"=="" (
    if exist "!sample_folder!\" (
        dir /a /b "!sample_folder!" | findstr . >nul && (
            start "" "!sample_folder!"
        ) || (
            echo 範例資料夾為空，跳過。
        )
    )
)

timeout /t 1 >nul

:: 開啟作業資料夾（僅在不為空時）
if defined homework_folder if not "!homework_folder!"=="" (
    if exist "!homework_folder!\" (
        dir /a /b "!homework_folder!" | findstr . >nul && (
            start "" "!homework_folder!"
        ) || (
            echo 作業資料夾為空，跳過。
        )
    )
)