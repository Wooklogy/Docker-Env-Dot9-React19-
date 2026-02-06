include compose/.env
export

# Docker Compose 기본 명령어 설정
# --env-file을 명시적으로 추가하여 .env 파일의 변경사항을 도커가 즉각 인지하도록 강제합니다.
COMPOSE_CMD = docker compose -p $(PROJECT_NAME) --env-file compose/.env -f compose/docker-compose.yml -f compose/dev-net.yml

# ───────────────────────────────
# ✅ common (전체 서비스 제어)
# ───────────────────────────────

up: 
	$(COMPOSE_CMD) up --build -d --remove-orphans

stop:
	$(COMPOSE_CMD) stop

down:
	$(COMPOSE_CMD) down

restart:
	$(COMPOSE_CMD) restart

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
# ✅ 서비스별 스마트 갱신 (환경변수 즉각 반영)
# ───────────────────────────────

re-api:
	$(COMPOSE_CMD) up --build -d api

re-hub:
	$(COMPOSE_CMD) up --build -d hub

re-react:
	$(COMPOSE_CMD) up --build -d react

re-db:
	$(COMPOSE_CMD) up --build -d postgres

# ───────────────────────────────
# ✅ Clean Up
# ───────────────────────────────

clean:
	$(COMPOSE_CMD) down -v