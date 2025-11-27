#!/bin/bash
# Firebase 部署腳本 (Bash)
# 使用方法: ./deploy.sh

echo "🚀 開始部署到 Firebase..."

# 檢查 Firebase CLI 是否安裝
if ! command -v firebase &> /dev/null; then
    echo "✗ Firebase CLI 未安裝"
    echo "請執行: npm install -g firebase-tools"
    exit 1
fi

echo "✓ Firebase CLI 已安裝"

# 檢查是否已登入
echo ""
echo "檢查 Firebase 登入狀態..."
if ! firebase projects:list &> /dev/null; then
    echo "⚠ 未登入 Firebase，正在登入..."
    firebase login
fi

# 部署
echo ""
echo "📦 開始部署..."
firebase deploy --only hosting

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo "您的網站已部署到: https://chatbot-with-ibm.web.app"
else
    echo ""
    echo "❌ 部署失敗，請檢查錯誤訊息"
    exit 1
fi




