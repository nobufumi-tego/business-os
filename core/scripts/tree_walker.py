"""フォルダ構造を走査するヘルパー.

ドキュメント棚卸しの初期把握に使う.
"""

from pathlib import Path


def walk(root: Path) -> list[dict]:
    """フォルダを再帰的に走査して、ファイル一覧をメタ情報付きで返す.

    Args:
        root: 走査対象のルートフォルダ

    Returns:
        ``[{"path": Path, "size": int, "mtime": float, "ext": str}, ...]``

    Note:
        対象拡張子: ``.pdf .xlsx .xls .docx .doc .pptx .csv .txt .md``
        サイズ単位: バイト
    """
    raise NotImplementedError("実装は Week 2 で行う")
