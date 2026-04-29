"""PDF からテキストを抽出するヘルパー.

Phase 1: テキスト PDF のみ対応。画像 PDF は対応外（Adobe Acrobat の OCR で前処理してもらう）.
"""

from pathlib import Path


def extract_text(pdf_path: Path) -> str:
    """PDF ファイルからテキストを抽出する.

    Args:
        pdf_path: 対象 PDF ファイルのパス

    Returns:
        抽出されたテキスト（改ページは ``\\n\\n`` で表現）

    Raises:
        ValueError: 画像 PDF や暗号化 PDF など、テキスト抽出できない場合

    Note:
        画像 PDF（スキャン文書）は対応外。
        必要なら Adobe Acrobat の OCR を先にかけてもらう。
    """
    raise NotImplementedError("実装は Week 1 で行う")
