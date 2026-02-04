include compose/.env
export

COMPOSE_CMD = docker compose -p $(PROJECT_NAME) -f compose/docker-compose.yml -f compose/dev-net.yml

# ───────────────────────────────
# ✅ common (전체 서비스 제어)
# ───────────────────────────────
up: 
	$(COMPOSE_CMD) up --build -d

stop:
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
# ✅ 개별 서비스 관리 (Up / Restart / Stop / RM)
# ───────────────────────────────
up-api:
	$(COMPOSE_CMD) up --build -d api

restart-api:
	$(COMPOSE_CMD) restart api

stop-api:
	$(COMPOSE_CMD) stop api

rm-api:
	$(COMPOSE_CMD) rm -f api

# ───────────────────────────────
# ✅ Re-build (완전 삭제 후 재시작)
# ───────────────────────────────
reup-api:
	$(COMPOSE_CMD) stop api && $(COMPOSE_CMD) rm -f api && $(COMPOSE_CMD) up --build -d api

reup-hub:
	$(COMPOSE_CMD) stop hub && $(COMPOSE_CMD) rm -f hub && $(COMPOSE_CMD) up --build -d hub

reup-react:
	$(COMPOSE_CMD) stop react && $(COMPOSE_CMD) rm -f react && $(COMPOSE_CMD) up --build -d react