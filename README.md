# 業務改善OS スターター

日本の DX担当者向け、業務改善のための Claude Code スターター。
Windows 11 / PowerShell 未経験から、5分で最初の棚卸しを始められます。

## まず動かしてみる（5分）

### 1. 必要なものをインストール（初回だけ）

PowerShell を「管理者として実行」で開いて、以下をコピペ：

```powershell
winget install OpenJS.NodeJS.LTS Git.Git astral-sh.uv
npm install -g @anthropic-ai/claude-code
```

### 2. このスターターを取得

```powershell
git clone https://github.com/nobufumi-tego/business-os.git
cd business-os
.\setup.ps1
```

### 3. Claude を起動

```powershell
claude
```

メニューが出るので、番号で選んでください。
3問答えれば、最初の棚卸しシートが完成します。

## 何ができるか

| コマンド | 用途 |
|---|---|
| `/業務棚卸し` | 業務の中身を対話で構造化する |
| `/ドキュメント棚卸し` | フォルダの中のファイルを整理する |
| `/システム棚卸し` | 既存システムを整理して改造案を作る |
| `/カスタマイズ` | 自社用の専用コマンドを Claude と一緒に作る |
| `/保存` `/履歴` `/巻き戻し` | Git をシンプルに使う |

## このあと

- もっと詳しく試したい → [docs/5分で試す.md](docs/5分で試す.md)
- 仕組みを知りたい → [docs/しくみ.md](docs/しくみ.md)
- 困ったときは → [docs/困ったとき.md](docs/困ったとき.md)
