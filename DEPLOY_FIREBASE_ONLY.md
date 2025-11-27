# 🚀 僅部署到 Firebase（不需要 Git/GitHub）

如果您只想將網站部署到 Firebase，不需要使用 Git 或 GitHub，請按照以下步驟：

---

## 步驟 1️⃣：安裝 Firebase CLI

在 PowerShell 中執行：

```powershell
npm install -g firebase-tools
```

如果沒有 Node.js，請先安裝：
- 下載：https://nodejs.org/
- 安裝後重新開啟 PowerShell

---

## 步驟 2️⃣：登入 Firebase

```powershell
firebase login
```

這會開啟瀏覽器，請：
1. 登入您的 Google 帳號
2. 允許 Firebase CLI 存取
3. 回到 PowerShell，應該會顯示 "Success! Logged in as..."

---

## 步驟 3️⃣：確認專案

確認您在正確的目錄：

```powershell
cd "C:\Users\e0987\Desktop\Capstone\GCP single page\gcp-demo-site"
```

檢查 Firebase 配置：

```powershell
firebase projects:list
```

應該會看到 `chatbot-with-ibm` 專案。

---

## 步驟 4️⃣：部署！

### 方法 A：使用部署腳本（推薦）

```powershell
.\deploy.ps1
```

### 方法 B：手動部署

```powershell
firebase deploy --only hosting
```

---

## ✅ 完成！

部署成功後，您的網站會在這裡：
- **https://chatbot-with-ibm.web.app**
- **https://chatbot-with-ibm.firebaseapp.com**

---

## 🔄 更新網站

以後每次更新網站，只需：

```powershell
# 確保在正確的目錄
cd "C:\Users\e0987\Desktop\Capstone\GCP single page\gcp-demo-site"

# 部署
firebase deploy --only hosting
```

或使用腳本：

```powershell
.\deploy.ps1
```

---

## 📋 常用命令

### 查看部署歷史

```powershell
firebase hosting:channel:list
```

### 查看當前專案

```powershell
firebase use
```

### 登出 Firebase

```powershell
firebase logout
```

---

## ⚠️ 注意事項

1. **代碼備份**：不使用 Git 意味著代碼只存在本地，建議定期備份
2. **版本控制**：如果需要版本控制，建議還是安裝 Git 並使用 GitHub
3. **多人協作**：如果多人協作，建議使用 Git/GitHub

---

## 🆘 遇到問題？

### 錯誤：未登入
```powershell
firebase login
```

### 錯誤：專案不存在
檢查 `.firebaserc` 檔案中的專案 ID 是否正確

### 錯誤：權限不足
確認您有 Firebase 專案的管理權限




