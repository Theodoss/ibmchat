# Firebase 部署腳本 (PowerShell)
# 使用方法: .\deploy.ps1

Write-Host "🚀 開始部署到 Firebase..." -ForegroundColor Green

# 檢查 Firebase CLI 是否安裝
try {
    $firebaseVersion = firebase --version
    Write-Host "✓ Firebase CLI 已安裝 (版本: $firebaseVersion)" -ForegroundColor Green
} catch {
    Write-Host "✗ Firebase CLI 未安裝" -ForegroundColor Red
    Write-Host "請執行: npm install -g firebase-tools" -ForegroundColor Yellow
    exit 1
}

# 檢查是否已登入
Write-Host "`n檢查 Firebase 登入狀態..." -ForegroundColor Cyan
$loginStatus = firebase projects:list 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠ 未登入 Firebase，正在登入..." -ForegroundColor Yellow
    firebase login
}

# 部署
Write-Host "`n📦 開始部署..." -ForegroundColor Cyan
firebase deploy --only hosting

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ 部署成功！" -ForegroundColor Green
    Write-Host "您的網站已部署到: https://chatbot-with-ibm.web.app" -ForegroundColor Cyan
} else {
    Write-Host "`n❌ 部署失敗，請檢查錯誤訊息" -ForegroundColor Red
    exit 1
}


