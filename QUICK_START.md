# ⚡ 快速開始 - 5 分鐘部署指南

## 🎯 目標：將網站推送到 GitHub 並部署到 Firebase

---

## ⚠️ 前置檢查

### 檢查 Git 是否已安裝

在 PowerShell 中執行：
```powershell
git --version
```

**如果顯示錯誤**（例如："git is not recognized"），請先安裝 Git：
- 查看 `INSTALL_GIT.md` 獲取詳細安裝指南
- 或直接下載：https://git-scm.com/download/win
- 安裝完成後，**重新開啟 PowerShell**

### 不想使用 GitHub？

如果您只想部署到 Firebase，不需要 Git，請查看 `DEPLOY_FIREBASE_ONLY.md`

---

## 步驟 1️⃣：準備 GitHub 儲存庫

### 在 GitHub 上建立新儲存庫
1. 前往 https://github.com/new
2. 輸入儲存庫名稱（例如：`gcp-file-browser`）
3. 選擇 **Public** 或 **Private**
4. **不要**勾選 "Initialize this repository with a README"
5. 點擊 **Create repository**

### 連接本地代碼到 GitHub

在 PowerShell 或命令提示字元中執行：

```powershell
cd "C:\Users\e0987\Desktop\Capstone\GCP single page\gcp-demo-site"

# 初始化 Git（如果還沒有）
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: GCP File Browser Admin"

# 連接遠端儲存庫（替換 YOUR_USERNAME 和 YOUR_REPO_NAME）
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

---

## 步驟 2️⃣：設置 Firebase 部署

### 安裝 Firebase CLI（如果還沒有）

```powershell
npm install -g firebase-tools
```

### 登入 Firebase

```powershell
firebase login
```

這會開啟瀏覽器，請登入您的 Google 帳號。

---

## 步驟 3️⃣：部署到 Firebase

### 方法 A：使用部署腳本（最簡單）

```powershell
.\deploy.ps1
```

### 方法 B：手動部署

```powershell
firebase deploy --only hosting
```

---

## 步驟 4️⃣：設置自動部署（可選但推薦）

### 獲取 Firebase Token

```powershell
firebase login:ci
```

複製顯示的 token（很長的一串字元）

### 在 GitHub 設定 Secret

1. 前往您的 GitHub 儲存庫
2. **Settings** → **Secrets and variables** → **Actions**
3. 點擊 **New repository secret**
4. Name: `FIREBASE_TOKEN`
5. Value: 貼上剛才的 token
6. 點擊 **Add secret**

### 完成！

現在每次您執行 `git push`，GitHub 會自動部署到 Firebase。

---

## 📍 您的網站網址

部署完成後，網站會在這裡：
- **https://chatbot-with-ibm.web.app**
- **https://chatbot-with-ibm.firebaseapp.com**

---

## 🔄 更新網站

以後每次更新，只需：

```powershell
git add .
git commit -m "描述您的更改"
git push origin main
```

如果設置了自動部署，等待幾分鐘後網站就會更新！

---

## ❓ 需要幫助？

查看詳細文檔：
- `README.md` - 完整文檔
- `DEPLOY.md` - 部署詳細指南

