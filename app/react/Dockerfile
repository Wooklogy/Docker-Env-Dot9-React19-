# 안정적인 LTS 버전을 권장합니다.
FROM node:22-bookworm

WORKDIR /app

# 개발에 필요한 최소 도구 설치
RUN apt-get update && apt-get install -y \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm pm2

EXPOSE 5173 24678

ENV CHOKIDAR_USEPOLLING=true
ENV VITE_DEV_SERVER_HOST=0.0.0.0

CMD ["sleep", "infinity"]