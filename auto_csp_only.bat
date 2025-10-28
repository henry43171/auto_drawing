@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 讀取 config_only_csp.txt
for /f "usebackq tokens=1* delims==" %%A in ("config/config_csp_only.txt") do (
    set "%%A=%%B"
)

:: 去掉前後空格（防止 config 有空格）
set "template=!template:~0!"

:: 開啟模板檔案（支援中文路徑）
start "" "!template!"
