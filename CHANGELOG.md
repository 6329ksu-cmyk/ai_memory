# AI 작업 로그
> AI가 작업할 때마다 여기에 한 줄씩 남긴다.
> 이 파일은 **사람이 보고 싶을 때 보는 용도**. AI가 매 세션마다 읽지 마라.
> 사용자가 "로그 보여줘" 하면 그때만 읽어라.

## 2026-04

- [Claude Code] bus환승 Plan 1 Task 6: apps/mobile Expo SDK 51 스캐폴딩 (package.json, tsconfig.json, babel.config.js, app.config.ts). pnpm install 완료. 커밋 2개.
- [Claude Code] bus환승 Plan 1 Task 4: Hono /health 엔드포인트 TDD 구현 (app.ts, routes/health.ts, index.ts, test/health.test.ts). 커밋 2개.
- [Claude Code] install-kit 구축: G드라이브 AI_Memory/install-kit/ 아래 install.ps1, README.md, 검수-지시서.md 생성. 홈랩/회사 환경 자동 감지, dev-prompts 선택 복사, sync-rules.sh 자동 호출.
- [Claude Code] SHARED_RULES.md §5 멀티에이전트 위임 절차에 §0 헤더 포함 규칙 + Sonnet Agent 호출 시 §0 명시 규칙 추가. sync-rules.sh로 4개 도구 전체 동기화.

---

## 2026-04-14
- [Claude Code] sync-rules.sh 동적화: Kimsanul 하드코딩 2곳 → $HOME 치환, 디버그 echo 추가. SHARED_RULES.md Memory Protocol 섹션 추가 (뉴런 별칭, Known_Issues_Windows 조회 규칙). install-kit 동기화. 4개 도구 재배포 완료.
- [Claude Code] SHARED_RULES.md §0 응답 규칙(토큰 절약) 추가 + §6 Advisor 패턴 추가
  - §5 멀티에이전트 위임 섹션을 원본에 복원 (sync 시 유실 방지)
  - advisor-prototype.py 생성 (C:\dev-prompts\)
  - sync-rules.sh 실행 → 4개 도구 전체 배포 완료

## 2026-04-13
- [Cursor] Baseball: 설치 안내 단일화 — `Baseball-GoogleAI-README.txt` [1]~[7]만, CMD 문서는 그 파일 가리키게 정리
- [Cursor] Baseball: 설치용 .cmd ASCII-only + `Baseball-GoogleAI-README.txt`(ASCII 파일명) — CMD 한글 깨짐/명령 오인 실행 방지
- [Cursor] Baseball: 바탕화면 `Install-Baseball-GoogleAI.cmd` + README, `docs/GoogleAI-설치-완전초보.md`, repo 백업 런처
- [Cursor] Baseball: `install-all.cmd` — winget Node LTS + Gemini CLI 한 배치, 문서 반영
- [Cursor] Baseball: Google AI 설치 패키지 + `docs/AI-CONTEXT-HUB.md` 단일 맥락/TODO, Antigravity URL 자동 오픈 배치, GEMINI.md 허브 참조
- [Cursor] Baseball: HTTP `Date` 기반 서버시각 오프셋 — `server_time.py`, snipe 오픈 대기, book 동기, `main.py clock`
- [Cursor] Baseball: `docs/ticketlink-seat-selection-design.md` — 티켓링크 좌석·예매 버튼 설계 단일 원본(세션 공유)
- [Cursor] Baseball: `config.json` — `booking.game_url` 플랜 스케줄, `monitor.target_url` sports/137/58
- [Cursor] Baseball: 모니터 빈 URL 시 `target_url`/`game_url` 안내, CDP bat에 Chrome 완전 종료 힌트
- [Cursor] Baseball: `start_chrome_cdp.bat` — cmd 파싱/UTF-8 한글 레이블 깨짐 방지(ASCII 안내), goto+PF86 Chrome 탐색, `cd "%~dp0.."` 안내

## 2026-04-12
- [Cursor] Baseball: `cdp_auto_launch` — CDP 없으면 Chrome 자동 기동(.chrome-cdp-profile), main만 실행
- [Cursor] Baseball: PROJECT/CDP 안내 — 일반 크롬 미지원 이유, 매번 인증 아님, 바로가기 팁
- [Cursor] Baseball: `cdp_endpoint` + `start_chrome_cdp.bat` — 본인 Chrome 로그인 세션에 Playwright CDP로 붙어 예매/모니터
- [Cursor] Baseball: `use_system_chrome` + `save_session --use-chrome` — WAF/비정상 접근 시 설치 Chrome으로 Playwright 실행
- [Antigravity] "AI 작업 시스템 - 공용 규칙" KI 등록 및 MCP memory 동기화
- [Claude Code] CLAUDE.md §5+§6 통합 → 멀티 에이전트 위임 우선순위(Opus→타AI→Sonnet) 자동 적용으로 변경
- [Cursor] Baseball(티켓링크): Canvas 좌석 가능성 반영(SEAT_CANVAS), test_booking_dom `--pause-stdin`/`--wait-after-booking-ms`, booking 구역·좌석 단계 로그 보강
- [Cursor] Baseball: `page_content_stable`, 스냅샷은 저장 HTML 기준 셀렉터 집계, `snapshot_product_page.py` 추가
- [Cursor] Baseball: `scripts/open_setup.py` — config 편집기 + 로그인 URL 브라우저 동시 오픈
- [Cursor] Baseball: `playwright_browser.py` 스텔스 컨텍스트 — 로그인 무한 새로고침 완화
- [Cursor] Baseball: 내장 브라우저로 `/sports` 로드·헤더 로그인 vs `/auth/login` PAYCO 진입 검증(DEVLOG 기록)
- [Cursor] Baseball: `goto_payco_oauth_login`, `wait_for_sports_cards`, open_setup `--next`, save_session home 힌트, PROJECT 로그인 절
- [Cursor] Baseball: `use_saved_session_only` 기본 true — 쿠키만 복원 후 book/monitor 바로 URL, `is_logged_in_fast`
- [Cursor] Baseball: `try_resume_from_saved_cookies` — save_session/open_setup 가 PAYCO 전에 저장 세션 시도

## 2026-04-10
- [Claude Code] 멀티에이전트 오케스트레이션(context-rot 방지) 시스템 구축 및 적용
  - 이관명세서(Desktop/context-rot-이관명세서) 분석 → 전체 적용 결정
  - 글로벌 CLAUDE.md: §5-1 컨텍스트 관리(토큰 위생) + §6 오케스트레이터 모드 추가
  - dev-prompts 템플릿 추가: .context/rules.md, .cursor/rules/context-protocol.mdc
  - dev-prompts/GEMINI.md: §5-1(세션 관리) + §6(작업 프로토콜) 추가
  - dev-prompts/.context/rules.md: 토큰 절약 섹션 추가
  - init-project.sh 업데이트: .context/ + archive/ + rules.md + context-protocol.mdc 자동 세팅 추가
  - 설정 백업: Desktop/ai-config-20260410-context-rot-orchestration-claude
  - 홈랩 데스크탑 배포 패키지: Desktop/homelab-ai-config/ (지시서.md + 전체 템플릿, Gemini 3.1 Pro용)
  - 미완: Antigravity KI 등록 (사용자 수동)
- [Claude Code] AI agent 플러그인 3종 전역 설치 (gstack, superpowers, gsd)
  - gstack v0.16.2.0: 구버전 gstack-* 래퍼 26개 + .agents/skills/gstack 본체 제거 후 공식 git clone → ~/.claude/skills/gstack → `./setup --prefix` 실행 (36개 skill 정상 링크)
  - superpowers v5.0.7: `claude plugin marketplace add obra/superpowers-marketplace` → 자동 설치됨
  - gsd v1.33.0: `claude plugin marketplace add jnuyens/gsd-plugin` → `claude plugin install gsd@gsd-plugin`
  - settings.json에 enabledPlugins / extraKnownMarketplaces 자동 등록 확인
  - 중복 symlink 24개 정리: ~/.claude/skills/에서 플러그인과 겹치는 brainstorming, context-*, executing-plans, gsd-*, using-superpowers, writing-plans 등 제거 (실체는 ~/.agents/skills/에 백업으로 유지)
  - 자동 업데이트 설정: 사용자가 "수동" 선택 → 필요 시 `claude plugin update <name>` / `/gstack-upgrade` 직접 호출
- [Claude Code] Desktop/AI_Mastery_Setup_Kit 전체 업데이트 (회사 PC 배포용)
  - Templates/SHARED_RULES.md: 구버전 minimal → 현재 master(§1~5 전체) 동기화
  - Templates/sync-rules.sh: 하드코딩된 /c/Users/Kimsanul 경로 → `$HOME` 기반 portable 버전으로 교체, `$MEMORY_PATH` 환경변수로 Cloud/Local 모드 분기 지원
  - Templates/ 신규: DEVLOG.md, PROJECT.md, init-project.sh (dev-prompts 시딩용)
  - 신규 Install-Skills-Plugins.ps1: gstack(git clone + setup) + superpowers + gsd 3종 일괄 설치 (의존성 체크, 멱등성 보장)
  - Setup-Local-Only.ps1 / Setup-Cloud-Sync.ps1 재작성: 6단계 구조 + dev-prompts 템플릿 배포 + 플러그인 설치 Y/N 프롬프트
  - 신규 SKILLS_LIST.md: 3 소스 72개 스킬/에이전트 참조 (gstack 37 + superpowers 14 + gsd 21), 업데이트/설치확인/중복정리 가이드 포함
  - README_SELECT_MODE.md: 키트 구조 다이어그램, 사전 필수(bun/claude CLI 추가), 3단계 실행 플로우, 문제 해결 표
- [Claude Code] AI 동기화 사각지대 보강 (Cursor 검증 후 아키텍처 개선)
  - sync-rules.sh: ~/.gemini/GEMINI.md 전역 동기화 추가 (기존 빵꾸 메움)
  - sync-rules.sh: Cursor 출력을 .cursorrules → .cursor/rules/shared-rules.mdc (alwaysApply: true)로 전환
  - C:\dev-prompts\init-project.sh 신규 작성 (DEVLOG.md + .cursor/rules/ + GEMINI.md 일괄 시딩)
  - 잔존 레거시 C:\dev-prompts\.cursorrules 삭제 완료
- [Claude Code] cursor.com/docs/rules 공식 대조 검증
  - 현 아키텍처 docs 기준 유효 확인 (.mdc + alwaysApply: true = Always Apply 타입)
  - 우선순위 공식 확정: 팀 규칙 → 프로젝트 규칙 → 사용자 규칙 (충돌 시 앞선 출처 승)
  - 신규 발견: Cursor는 AGENTS.md 네이티브 지원, Remote Rules(GitHub) 자동 동기화 가능
  - Cursor User Rules GUI 텍스트 최종안 사용자에게 전달 (수동 적용 대기)

## 2026-04-07
- [Claude Code] 홈랩 AI 인프라 구축
  - C:\AI_Memory\SHARED_RULES.md 생성 (공용 규칙 원본)
  - C:\AI_Memory\sync-rules.sh 생성 (규칙 배포 스크립트)
  - C:\dev-prompts\DEVLOG.md 생성 (프로젝트 이력 템플릿, 경량화 4섹션)
  - C:\dev-prompts\PROJECT.md 생성 (프로젝트 메타데이터 템플릿)
  - ~/.claude/CLAUDE.md 업데이트 (SHARED_RULES + Memory Protocol)
  - dev-prompts\.cursorrules, GEMINI.md 동기화 완료
- [Claude Code] MCP memory 통일
  - 4개 도구 전부 @itseasy21/mcp-knowledge-graph로 통일
  - Antigravity mcp_config.json 설정 완료
- [Claude Code] 그래프 엔티티 정리
  - HomeLab_AI_Infra, Claude_Code, Cursor, Gemini_CLI 엔티티 등록
  - Kimsanul → 도구 간 관계(uses, part_of) 설정
- [Claude Code] CHANGELOG.md 규칙 추가 (SHARED_RULES에 §4 신설, 용량관리/분석 규칙)
- [Claude Code] skills 54개 → G:\내 드라이브\AI_Memory\skills\ 복사 (다른 AI 도구 참조용)
- [Claude Code] 기기/환경 엔티티 등록 (Laptop_Main, Desktop_Home, Company_Env + 관계)
- [Claude Code] 회사 환경 현황 파악 및 세팅 지원
  - Claude Code, Antigravity MCP memory 연결
  - SHARED_RULES.md, sync-rules.sh, CHANGELOG.md, DEVLOG.md 생성/동기화
  - 회사/홈랩 memory.jsonl 완전 분리 확인
- [Claude Code] AI Agent Helper v1 설계 (/gstack-office-hours)
  - Desktop/AI_AGENT_HELPER/DESIGN.md 생성 (설계 문서 14섹션)
  - Desktop/IDEA_01/PROJECT_STATE.md 생성 (숙제용 빈 템플릿 + 사용자 피드백)
  - Desktop/IDEA_01/DEVLOG.md 생성 (프로젝트 이력)
  - 핵심 결정 4개: 노드 자동 이름 / AI선언→승인→기록 / git 올림 / 5회 반복 경고(AI 루프 탈출용)
  - 발견: AI는 사용자 모를 용어에 쉬운 말 병기 의무 (용어 번역 규칙)
  - TODO: CLAUDE.md §5 (멀티 AI 위임) — Max 플랜 전환으로 불필요, 다음 세션에서 정리
