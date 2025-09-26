:: === 開啟每日練習檔案 ===
:: 取得年月日
for /f "tokens=1-3 delims=/- " %%a in ("%date%") do (
    set YYYY=%%a
    set MM=%%b
    set DD=%%c
)

:: 設定每日練習資料夾與檔名
set PRACTICE_FOLDER=D:\csp\Hundred-Day Form Practice\%YYYY%%MM%
set PRACTICE_FILE=%PRACTICE_FOLDER%\FormPractice_%YYYY%%MM%%DD%.clip

if exist "%PRACTICE_FILE%" (
    echo Opening daily practice file: %PRACTICE_FILE%
    start "" "%PRACTICE_FILE%"
) else (
    echo Daily practice file not found: %PRACTICE_FILE%
)
