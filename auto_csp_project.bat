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

:: 開啟 Clip Studio 檔案
if defined template (
    start "" "!template!"
)

:: 如果有設定範例資料夾就開啟
if defined sample_folder (
    if not "!sample_folder!"=="" (
        start "" "!sample_folder!"
    )
)

timeout /t 1 >nul

:: 如果有設定作業資料夾就開啟
if defined homework_folder (
    if not "!homework_folder!"=="" (
        start "" "!homework_folder!"
    )
)