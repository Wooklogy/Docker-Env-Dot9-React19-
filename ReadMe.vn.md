# Thiết lập môi trường phát triển với Docker Image trên Windows

## 1. Cài đặt Docker Desktop

1. Tải và cài đặt [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/).
2. Sau khi cài đặt, mở Docker Desktop và trong **Settings → General**, bật tùy chọn `Use the WSL 2 based engine`.

---

## 2. Cài đặt WSL và đặt bản phân phối mặc định

1. Mở PowerShell với quyền Administrator và chạy:

    ```powershell
    wsl --install
    ```

2. Kiểm tra danh sách các bản phân phối đã cài:

    ```powershell
    wsl -l -v
    ```

3. Đặt bản phân phối mong muốn (ví dụ: Ubuntu) làm mặc định:

    ```powershell
    wsl --set-default <tên_bản_phân_phối>
    ```

4. Truy cập WSL:

    ```powershell
    wsl
    ```

---

## 3. Thiết lập ban đầu cho WSL

1. Cập nhật và nâng cấp gói:

    ```bash
    sudo apt update -y && sudo apt upgrade -y
    ```

2. Kiểm tra các công cụ phát triển cơ bản (git, make thường được cài sẵn):

    ```bash
    git --version
    make --version
    ```

---

## 4. Cài đặt tiện ích mở rộng của VS Code

1. Mở VS Code.
2. Vào **Extensions (Ctrl+Shift+X)** và cài:

    - **Remote - WSL**
    - **Dev Containers**

---

## 5. Kết nối VS Code với WSL

1. Nhấn vào biểu tượng **><** ở góc trái dưới của VS Code.
2. Chọn `Connect to WSL` và chọn bản phân phối đã cài.

---

## 6. Đăng ký SSH Key cho Git

1. Tạo SSH key:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

2. Xem public key:

    ```bash
    cat ~/.ssh/id_rsa.pub
    ```

3. Thêm key vào tài khoản GitHub/GitLab.

---

## 7. Clone kho Git

```bash
git clone https://gitlab.com/Wooklogy/dev-containers.git
```

---

## 8. Chạy dự án (Docker Compose)

> **Lưu ý:** Docker Desktop phải đang chạy và lệnh này phải được thực thi trong thư mục chứa file `Makefile`.

```bash
make up
```

-   Lần chạy đầu tiên, Docker sẽ tải image và build container.

---

## 9. Mở từng dự án trong VS Code

-   Từ **thư mục gốc** của từng dự án:

    ```bash
    code .
    ```

    Ví dụ:

    ```bash
    code app/react
    ```

---

## 10. Mở trong Dev Container

-   Khi VS Code hiển thị thông báo **"Reopen in Container"**, nhấn vào.
-   Hoặc mở **Command Palette (Ctrl+Shift+P)**, gõ `Reopen in Container` và chạy.

---

## ✅ Hoàn tất thiết lập

Thực hiện các bước trên sẽ giúp bạn thiết lập **môi trường phát triển trên Windows sử dụng Docker image**.
