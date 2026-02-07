include compose/.env
export

# Docker Compose 기본 명령어 설정
COMPOSE_CMD = docker compose -p $(PROJECT_NAME) --env-file compose/.env -f compose/docker-compose.yml -f compose/dev-net.yml

.PHONY: up stop down restart logs clean open-api open-hub open-react open-postgres re-api re-hub re-react re-db

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
# ✅ 서비스별 스마트 갱신 (환경변수 즉각 반영 및 강제 재생성)
# ───────────────────────────────

re-api:
	$(COMPOSE_CMD) up --build -d --force-recreate api

re-hub:
	$(COMPOSE_CMD) up --build -d --force-recreate hub

re-react:
	$(COMPOSE_CMD) up --build -d --force-recreate react

re-db:
	$(COMPOSE_CMD) up --build -d --force-recreate postgres

# ───────────────────────────────
# ✅ Clean Up
# ───────────────────────────────

clean:
	$(COMPOSE_CMD) down -v