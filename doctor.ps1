# doctor.ps1
# 環境診断スクリプト
# 何かが動かなくなったときに、現状を確認するために使う

chcp 65001 | Out-Null

Write-Host ""
Write-Host "============================================"
Write-Host "  環境診断"
Write-Host "============================================"
Write-Host ""

function Check-Tool($name, $cmd) {
    try {
        $version = Invoke-Expression $cmd 2>&1 | Out-String
        if ($LASTEXITCODE -eq 0) {
            $line = ($version -split "`n")[0].Trim()
            Write-Host "  ✓ $name : $line"
            return
        }
    } catch { }
    Write-Host "  ✗ $name : 未導入"
}

Write-Host "[ツール]"
Check-Tool "Node.js"     "node --version"
Check-Tool "Git"         "git --version"
Check-Tool "uv"          "uv --version"
Check-Tool "Claude Code" "claude --version"

Write-Host ""
Write-Host "[Git]"
$gitName  = git config --global user.name
$gitEmail = git config --global user.email
Write-Host "  ユーザー: $gitName <$gitEmail>"

# リモート確認（あったら警告）
$remotes = git remote -v 2>&1
if ($remotes) {
    Write-Host "  ⚠ リモートが設定されています："
    Write-Host "    $remotes"
    Write-Host "    このスターターはローカル運用のみを想定しています。"
}

Write-Host ""
Write-Host "[フォルダ]"
foreach ($dir in @("core", "usecases", "inputs", "outputs", ".claude")) {
    if (Test-Path $dir) {
        Write-Host "  ✓ $dir"
    } else {
        Write-Host "  ✗ $dir （無い）"
    }
}

Write-Host ""
Write-Host "診断結果を Claude に貼り付けて相談すると、解決が早いです。"
Write-Host ""
