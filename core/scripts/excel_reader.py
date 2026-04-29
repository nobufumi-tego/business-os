"""Excel から構造化データを抽出するヘルパー.

方眼紙 Excel を解読する処理は Claude 側（指示書）で行うため、
ここではシート/セルの素朴な読み取りのみ提供する.
"""

from pathlib import Path


def read_workbook(xlsx_path: Path) -> dict:
    """Excel ファイルの全シートを辞書として返す.

    Args:
        xlsx_path: 対象 Excel ファイルのパス

    Returns:
        ``{シート名: [[行][行]...]}`` 形式の辞書

    Note:
        値はすべて str に統一。空セルは空文字列.
        結合セルの判定はここでは行わない（Claude 側で扱う）.
    """
    raise NotImplementedError("実装は Week 1 で行う")
