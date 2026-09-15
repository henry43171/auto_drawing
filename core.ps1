param([string]$ConfigPath = "config/config_csp.txt")

# 1. 讀取設定檔 (自動處理 UTF-8 與格式)
$config = @{}
Get-Content $ConfigPath -Encoding UTF8 | Where-Object { $_ -match '=' -and -not ($_ -match '^\s*[:;]') } | ForEach-Object {
    $key, $val = $_.Split('=', 2)
    $config[$key.Trim()] = $val.Trim()
}

# 2. 乾淨取得日期 (永遠不會壞)
$dateStr = Get-Date -Format "yyyyMMdd"

# 3. 組合路徑與自動遞增數字
$targetDir = $config['target']
if (-not (Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir }

$baseName = $config['prefix'] + $dateStr + $config['suffix']
$filePath = Join-Path $targetDir "$baseName.clip"

$count = 1
while (Test-Path $filePath) {
    $filePath = Join-Path $targetDir "${baseName}_${count}.clip"
    $count++
}

# 4. 複製檔並開啟
Copy-Item -Path $config['template'] -Destination $filePath -Force
Invoke-Item $filePath

# 5. 開啟資料夾
if ($config['open_target_folder'] -eq 'True') { Invoke-Item $targetDir }
if ($config['materials_folder'] -and (Test-Path $config['materials_folder'])) { Invoke-Item $config['materials_folder'] }