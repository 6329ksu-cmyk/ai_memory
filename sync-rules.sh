#!/bin/bash
# SHARED_RULES.md 원본을 각 도구 설정 파일에 인라인 복사
# 사용법: bash /c/AI_Memory/sync-rules.sh

echo "Target user: $(whoami), Home: $HOME"

SOURCE="/c/AI_Memory/SHARED_RULES.md"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"
GEMINI_GLOBAL="$HOME/.gemini/GEMINI.md"
CURSOR_MDC="/c/dev-prompts/.cursor/rules/shared-rules.mdc"
GEMINI_TEMPLATE="/c/dev-prompts/GEMINI.md"

# Claude Code 전역 = SHARED_RULES 그대로 복사 (Memory Protocol은 SHARED_RULES 안에 포함됨)
cp "$SOURCE" "$CLAUDE_MD"
echo ">> Claude Code 전역 CLAUDE.md 동기화 완료"

# Gemini CLI 전역 (~/.gemini/GEMINI.md)
cp "$SOURCE" "$GEMINI_GLOBAL"
echo ">> Gemini CLI 전역 GEMINI.md 동기화 완료"

# Cursor 프로젝트 템플릿 (.cursor/rules/*.mdc 신규 포맷, alwaysApply 적용)
mkdir -p "$(dirname "$CURSOR_MDC")"
cat > "$CURSOR_MDC" << 'EOF'
---
description: AI 공용 지침서 (SHARED_RULES 기반)
alwaysApply: true
---

EOF
cat "$SOURCE" >> "$CURSOR_MDC"
echo ">> Cursor 프로젝트 템플릿 .cursor/rules/shared-rules.mdc 동기화 완료"

# Gemini CLI 프로젝트 템플릿
cp "$SOURCE" "$GEMINI_TEMPLATE"
echo ">> Gemini 프로젝트 템플릿 GEMINI.md 동기화 완료"

echo ""
echo "완료."
