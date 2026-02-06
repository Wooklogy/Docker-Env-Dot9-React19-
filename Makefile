include compose/.env
export

# Docker Compose 기본 명령어 설정
COMPOSE_CMD = docker compose -p $(PROJECT_NAME) -f compose/docker-compose.yml -f compose/dev-net.yml

# ───────────────────────────────
# ✅ common (전체 서비스 제어)
# ───────────────────────────────

# 환경변수 변경 시 전체 재시작 (가장 권장되는 방식)
# --remove-orphans: 정의되지 않은 컨테이너 제거
up: 
	$(COMPOSE_CMD) up --build -d --remove-orphans

# 서비스 중지 (데이터 볼륨은 유지됨)
stop:
	$(COMPOSE_CMD) stop

# 전체 삭제 (데이터 볼륨은 보존, 컨테이너만 제거)
down:
	$(COMPOSE_CMD) down

# 강제 재시작
restart:
	$(COMPOSE_CMD) restart

# 로그 확인
logs:
	$(COMPOSE_CMD) logs -f

# ───────────────────────────────
# ✅ exec (컨테이너 내부 접속)
# ───────────────────────────────
open-api:
	$(COMPOSE_CMD) exec api sh

open-hub:
	$(COMPOSE_CMD) exec hub sh

open-react:
	$(COMPOSE_CMD) exec react sh

open-postgres:
	$(COMPOSE_CMD) exec postgres sh

# ───────────────────────────────
# ✅ 서비스별 스마트 갱신 (환경변수 반영 전문)
# ───────────────────────────────

# API 서비스 갱신 (환경변수/코드 변경 시 사용)
re-api:
	$(COMPOSE_CMD) up --build -d api

# HUB 서비스 갱신
re-hub:
	$(COMPOSE_CMD) up --build -d hub

# REACT 서비스 갱신
re-react:
	$(COMPOSE_CMD) up --build -d react

# DB 서비스 갱신 (데이터 유실 방지를 위해 stop-up 방식 사용)
re-db:
	$(COMPOSE_CMD) up --build -d postgres

# ───────────────────────────────
# ✅ Clean Up (주의해서 사용)
# ───────────────────────────────

# 볼륨까지 완전히 삭제 (데이터가 모두 날아갑니다)
clean:
	$(COMPOSE_CMD) down -v