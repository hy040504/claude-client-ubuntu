# claude-client-ubuntu

Claude.ai CLI Client - Ubuntu Server 배포용 저장소입니다.

## 🛠️ 서버 환경 구축 (Setup)

1. **필수 패키지 설치**
   제공된 `setup-ubuntu.sh` 스크립트를 사용하여 Node.js, Chrome, 그리고 headless 실행에 필요한 라이브러리를 설치합니다.
   ```bash
   chmod +x setup-ubuntu.sh
   ./setup-ubuntu.sh
   ```

2. **환경 설정**
   `.env.example`을 `.env`로 복사하고 인증 정보를 입력합니다.
   ```bash
   cp .env.example .env
   nano .env
   ```

## 🚀 실행 및 관리

### 1. PM2 사용 (추천)
서버에서 무중단 실행을 위해 PM2 사용을 권장합니다.
```bash
npm install -g pm2
pm2 start background-login.js --name "claude-login"
```

### 2. Systemd Service 등록
`/etc/systemd/system/claude-client.service` 파일을 생성하고 프로젝트의 `claude-client.service` 내용을 복사합니다.
```bash
sudo systemctl enable claude-client
sudo systemctl start claude-client
```

## 🛡️ 보안 가이드 (UFW)
```bash
sudo ufw allow ssh
sudo ufw enable
```

## ⚠️ 주의 사항 (Headless Chrome)
Ubuntu 서버(GUI 없음)에서 실행 시 `background-login.js`가 `--no-sandbox` 옵션을 사용하여 원활하게 동작하도록 설정되어 있습니다.
