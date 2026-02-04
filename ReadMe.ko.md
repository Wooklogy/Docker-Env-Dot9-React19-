# 윈도우 환경에서 Docker Image로 개발환경 구축하기

## 1. Docker Desktop 설치

1. [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/) 다운로드 및 설치.
2. 설치 후 Docker Desktop 실행, **Settings → General**에서 `Use the WSL 2 based engine` 옵션 활성화.

---

## 2. WSL 설치 및 기본 배포판 설정

1. PowerShell(관리자 권한)에서 실행:

    ```powershell
    wsl --install
    ```

2. 설치된 배포판 목록 확인:

    ```powershell
    wsl -l -v
    ```

3. 원하는 배포판(예: Ubuntu)으로 기본값 설정:

    ```powershell
    wsl --set-default <배포판이름>
    ```

4. WSL 접속:

    ```powershell
    wsl
    ```

---

## 3. WSL 초기 설정

1. 패키지 목록 업데이트 및 업그레이드:

    ```bash
    sudo apt update -y && sudo apt upgrade -y
    ```

2. 기본 개발 도구 확인 (git, make는 기본 포함됨):

    ```bash
    git --version
    make --version
    ```

---

## 4. VS Code 확장 설치

1. VS Code 실행.
2. \*\*Extensions (Ctrl+Shift+X)\*\*에서 다음 확장 설치:

    - **Remote - WSL**
    - **Dev Containers**

---

## 5. VS Code와 WSL 연결

1. VS Code 좌측 하단의 **><** 아이콘 클릭.
2. `Connect to WSL` 선택 후 설치한 배포판 연결.

---

## 6. Git SSH Key 등록

1. SSH Key 생성:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

2. 공개 키 확인:

    ```bash
    cat ~/.ssh/id_rsa.pub
    ```

3. GitHub/GitLab 계정에 등록.

---

## 7. Git 저장소 클론

```bash
git clone https://gitlab.com/Wooklogy/dev-containers.git
```

---

## 8. 프로젝트 실행 (Docker Compose)

> **주의:** Docker Desktop이 실행 중이어야 하며, 해당 명령은 `Makefile`이 있는 디렉토리에서 실행해야 함.

```bash
make up
```

-   첫 실행 시 Docker Image 다운로드 및 컨테이너 빌드 진행.

---

## 9. VS Code에서 프로젝트 열기

-   각 프로젝트 **루트 폴더**에서:

    ```bash
    code .
    ```

    예시:

    ```bash
    code app/react
    ```

---

## 10. Dev Container로 열기

-   VS Code에서 **"Reopen in Container"** 알림이 뜨면 클릭.
-   또는 **Command Palette (Ctrl+Shift+P)** 열고 `Reopen in Container` 입력 후 실행.

---

## ✅ 개발환경 구축 완료

위 절차를 완료하면 **윈도우 환경에서 Docker Image 기반 개발환경**이 구축됩니다.
