# 백로그 — 지금 안 하고 다음 세션으로 미룬 것

## sync-rules.sh `.bak` 방지 수정
- 현재 `sync-rules.sh`가 배포 전 `.bak-YYYYMMDD-HHMMSS` 자동 생성 → 로컬에 쓰레기 쌓임
- 이제 git이 버전 관리하니까 `.bak` 불필요. `cp` 백업 로직 제거
- 전제: git 커밋 습관이 자리잡은 후에 (안전망 제거하는 거라 섣부르면 안 됨)

## MCP memory 서버 비활성화
- `memory.jsonl` 삭제했으니 MCP knowledge graph 서버도 쓸 이유 없음
- `~/.claude.json` 또는 `settings.json`에서 `@itseasy21/mcp-knowledge-graph` MCP 설정 제거
- Claude/Cursor/Gemini/Antigravity 각 도구별 MCP 설정도 정리
- 현재는 서버 돌고 있어도 memory.jsonl 재생성해도 git에 안 올라감 (gitignore)
- 진짜 정리는 설정 파일 손댈 때

## AI_JOURNAL 글로벌 승격
- 현재 AI_JOURNAL 규칙은 `Desktop/Netework_Manager_copy/UTM/CLAUDE.md` 에만
- 다른 프로젝트(티켓링크, IDEA_01, Baseball 등)는 실패 기록 장치 없음 → /clear 시 맥락 증발
- 글로벌 `~/.claude/CLAUDE.md`에 AI_JOURNAL 작성·조회 규칙 승격 필요
- **전제**: Network_Manager_copy에서 실제 2-3번 F 기록 + 작동 검증 후. 검증 전 승격은 과잉 설계

## CLAUDE.md 슬림화
- **제안**: 글로벌 `~/.claude/CLAUDE.md`에서 가끔 쓰는 규칙을 별도 파일로 분리, 필요할 때만 Read
- **예상 감량**: 50~80줄 (외부 조언은 "300~400줄"이라 했으나 과장. 현재 CLAUDE.md ≈ 240줄)
- **빼도 되는 것**: §6 Advisor 패턴, §5-1 컨텍스트 관리 상세, Memory Protocol 저장 기준 상세
- **빼면 안 되는 것**: §0 응답규칙, §1 요청분류, §4 CHANGELOG, §7.1~7.6 상황판(특히 §7.6 렌더 포맷)
- **전제**: 별도 파일 빼면 트리거(언제 Read 하는지)를 명확히 박아야 함. 안 그러면 발화 안 되고 무용지물
- **왜 지금 안 함**: 메타 인프라 과잉 투자 패턴 차단. 2026-04-16 세션에서 이미 결정 — "Step 3 끝내고 실제 프로젝트 복귀"
