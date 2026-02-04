# Setting Up a Development Environment with Docker Image on Windows

## 1. Install Docker Desktop

1. Download and install [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/).
2. After installation, open Docker Desktop and in **Settings → General**, enable the `Use the WSL 2 based engine` option.

---

## 2. Install WSL and Set Default Distribution

1. Open PowerShell as Administrator and run:

    ```powershell
    wsl --install
    ```

2. Check the list of installed distributions:

    ```powershell
    wsl -l -v
    ```

3. Set your preferred distribution (e.g., Ubuntu) as the default:

    ```powershell
    wsl --set-default <distribution_name>
    ```

4. Access WSL:

    ```powershell
    wsl
    ```

---

## 3. Initial WSL Setup

1. Update and upgrade package lists:

    ```bash
    sudo apt update -y && sudo apt upgrade -y
    ```

2. Verify basic development tools (git, make are usually pre-installed):

    ```bash
    git --version
    make --version
    ```

---

## 4. Install VS Code Extensions

1. Open VS Code.
2. Go to **Extensions (Ctrl+Shift+X)** and install:

    - **Remote - WSL**
    - **Dev Containers**

---

## 5. Connect VS Code to WSL

1. Click the **><** icon in the bottom-left corner of VS Code.
2. Select `Connect to WSL` and choose your installed distribution.

---

## 6. Register Git SSH Key

1. Generate an SSH key:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

2. View your public key:

    ```bash
    cat ~/.ssh/id_rsa.pub
    ```

3. Add the key to your GitHub/GitLab account.

---

## 7. Clone Git Repository

```bash
git clone https://gitlab.com/Wooklogy/dev-containers.git
```

---

## 8. Run the Project (Docker Compose)

> **Note:** Docker Desktop must be running, and this command should be executed in the directory containing the `Makefile`.

```bash
make up
```

-   On the first run, Docker will download images and build containers.

---

## 9. Open Project in VS Code

-   From the **root folder** of each project:

    ```bash
    code .
    ```

    Example:

    ```bash
    code app/react
    ```

---

## 10. Open in Dev Container

-   When VS Code prompts **"Reopen in Container"**, click it.
-   Or open **Command Palette (Ctrl+Shift+P)**, type `Reopen in Container`, and run it.

---

## ✅ Setup Complete

Following these steps will set up a **Windows-based development environment using Docker images**.
