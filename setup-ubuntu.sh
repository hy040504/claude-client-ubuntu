#!/bin/bash
# Ubuntu Server 환경 구축 스크립트

echo "1. 시스템 업데이트 및 필수 라이브러리 설치"
sudo apt-get update
sudo apt-get install -y xvfb libgbm-dev libnss3 libatk-bridge2.0-0 libgtk-3-0 libasound2

echo "2. NVM 및 Node.js 설치"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 20

echo "3. Google Chrome 설치 (Puppeteer용)"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

echo "4. 의존성 설치"
npm install

echo "설정 완료! .env 파일을 생성하고 실행하세요."
