# GCP 檔案瀏覽器 - 管理員模式

這是一個單頁應用程式，用於瀏覽和管理 GCP Cloud Storage 中的檔案。

## 📋 前置需求

- Node.js (v14 或更高版本)
- Firebase CLI
- Git
- GitHub 帳號
- Firebase 專案

## 🚀 快速開始

### 1. 安裝 Firebase CLI

```bash
npm install -g firebase-tools
```

### 2. 登入 Firebase

```bash
firebase login
```

### 3. 初始化 Git 儲存庫（如果還沒有）

```bash
cd gcp-demo-site
git init
git add .
git commit -m "Initial commit"
```

### 4. 推送到 GitHub

#### 在 GitHub 上建立新儲存庫

1. 前往 [GitHub](https://github.com) 並建立新儲存庫
2. 複製儲存庫 URL

#### 連接本地儲存庫到 GitHub

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

### 5. 部署到 Firebase

#### 方法一：手動部署

```bash
firebase deploy --only hosting
```

#### 方法二：使用 GitHub Actions 自動部署（推薦）

見下方「自動部署設置」章節。

## 🔧 自動部署設置（GitHub Actions）

### 步驟 1：獲取 Firebase Token

```bash
firebase login:ci
```

這會產生一個 token，請複製它。

### 步驟 2：在 GitHub 設定 Secrets

1. 前往您的 GitHub 儲存庫
2. 點擊 **Settings** → **Secrets and variables** → **Actions**
3. 點擊 **New repository secret**
4. 新增以下 secret：
   - **Name**: `FIREBASE_TOKEN`
   - **Value**: 貼上步驟 1 獲取的 token

### 步驟 3：確認 Firebase 專案

確認 `.firebaserc` 檔案中的專案 ID 正確：

```json
{
  "projects": {
    "default": "chatbot-with-ibm"
  }
}
```

### 步驟 4：推送代碼

當您推送代碼到 `main` 分支時，GitHub Actions 會自動部署到 Firebase。

```bash
git add .
git commit -m "Update files"
git push origin main
```

## 📁 專案結構

```
gcp-demo-site/
├── public/
│   └── index.html          # 主頁面
├── .firebaserc             # Firebase 專案配置
├── firebase.json           # Firebase 部署配置
├── .gitignore              # Git 忽略檔案
└── README.md               # 本檔案
```

## 🔍 檢查部署狀態

### 查看部署歷史

```bash
firebase hosting:channel:list
```

### 查看網站 URL

部署完成後，Firebase 會提供一個 URL，格式如下：
```
https://YOUR_PROJECT_ID.web.app
或
https://YOUR_PROJECT_ID.firebaseapp.com
```

## 🛠️ 本地測試

在部署前，您可以使用 Firebase 本地伺服器測試：

```bash
firebase serve
```

然後在瀏覽器開啟 `http://localhost:5000`

## 📝 注意事項

1. **API URL 配置**：確保 `index.html` 中的 `ADMIN_API_URL` 設定正確
2. **Firebase 專案**：確認 `.firebaserc` 中的專案 ID 與您的 Firebase 專案一致
3. **公開目錄**：所有要部署的檔案都應該放在 `public/` 目錄中

## 🔄 更新網站

每次更新後，只需：

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

如果設置了 GitHub Actions，部署會自動進行。

## 📚 相關資源

- [Firebase Hosting 文檔](https://firebase.google.com/docs/hosting)
- [GitHub Actions 文檔](https://docs.github.com/en/actions)
- [Firebase CLI 參考](https://firebase.google.com/docs/cli)

## ⚠️ 疑難排解

### 部署失敗

1. 確認已登入 Firebase：`firebase login`
2. 確認專案 ID 正確：檢查 `.firebaserc`
3. 確認有部署權限

### GitHub Actions 失敗

1. 確認 `FIREBASE_TOKEN` secret 已正確設置
2. 檢查 Actions 日誌以查看詳細錯誤訊息
3. 確認 token 未過期（如果過期，重新執行 `firebase login:ci`）


