# setup.ps1
# 業務改善OS スターターの初期セットアップ
# 何度実行しても安全（冪等）

# 文字化け防止
chcp 65001 | Out-Null

Write-Host ""
Write-Host "============================================"
Write-Host "  業務改善OS スターター セットアップ"
Write-Host "============================================"
Write-Host ""

# 1. 依存ツールのインストール状況を確認
Write-Host "[1/5] 必要なツールを確認しています..."

$tools = @(
    @{Name="Node.js"; Cmd="node --version"; Winget="OpenJS.NodeJS.LTS"},
    @{Name="Git";     Cmd="git --version";  Winget="Git.Git"},
    @{Name="uv";      Cmd="uv --version";   Winget="astral-sh.uv"}
)

foreach ($tool in $tools) {
    $installed = $false
    try {
        Invoke-Expression $tool.Cmd 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) { $installed = $true }
    } catch { }

    if ($installed) {
        Write-Host "  ✓ $($tool.Name) は導入済み"
    } else {
        Write-Host "  → $($tool.Name) をインストールします..."
        winget install --id $tool.Winget --silent --accept-package-agreements --accept-source-agreements
    }
}

# 2. Claude Code の確認
Write-Host ""
Write-Host "[2/5] Claude Code を確認しています..."
$claudeOk = $false
try {
    claude --version 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { $claudeOk = $true }
} catch { }

if ($claudeOk) {
    Write-Host "  ✓ Claude Code は導入済み"
} else {
    Write-Host "  → Claude Code をインストールします..."
    npm install -g @anthropic-ai/claude-code
}

# 3. Git 設定（名前・メールが未設定なら聞く）
Write-Host ""
Write-Host "[3/5] Git の基本設定を確認しています..."
$gitName  = git config --global user.name
$gitEmail = git config --global user.email

if (-not $gitName) {
    $gitName = Read-Host "あなたの名前を入れてください（例: 山田太郎）"
    git config --global user.name $gitName
}
if (-not $gitEmail) {
    $gitEmail = Read-Host "メールアドレスを入れてください"
    git config --global user.email $gitEmail
}
Write-Host "  ✓ Git: $gitName <$gitEmail>"

# 4. Python 依存（uv で同期）
Write-Host ""
Write-Host "[4/5] Python 環境を準備しています..."
uv sync

# 5. Anthropic API キーの確認
Write-Host ""
Write-Host "[5/5] Anthropic API キーを確認しています..."
$apiKey = [System.Environment]::GetEnvironmentVariable("ANTHROPIC_API_KEY", "User")
if (-not $apiKey) {
    Write-Host ""
    Write-Host "  【重要】Anthropic API キーが設定されていません"
    Write-Host "  https://console.anthropic.com でキーを取得してから"
    Write-Host "  以下のコマンドを PowerShell で実行してください："
    Write-Host ""
    Write-Host '    [System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "sk-ant-...", "User")'
    Write-Host ""
    Write-Host "  設定後は PowerShell を開き直してから claude を起動してください。"
    Write-Host ""
} else {
    Write-Host "  ✓ API キー 設定済み"
}

# 完了メッセージ
Write-Host ""
Write-Host "============================================"
Write-Host "  準備完了です"
Write-Host "============================================"
Write-Host ""
Write-Host "次のコマンドで Claude が起動します:"
Write-Host ""
Write-Host "    claude"
Write-Host ""
Write-Host "困ったときは docs\困ったとき.md を見てください"
Write-Host ""
