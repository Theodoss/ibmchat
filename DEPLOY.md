# 🚀 快速部署指南

## 方法一：使用命令行部署（最簡單）

### 第一次設置

1. **安裝 Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **登入 Firebase**
   ```bash
   firebase login
   ```

3. **初始化 Git（如果還沒有）**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

4. **推送到 GitHub**
   ```bash
   # 在 GitHub 建立新儲存庫後
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git branch -M main
   git push -u origin main
   ```

### 每次更新後部署

```bash
# 方法 1: 直接部署到 Firebase
firebase deploy --only hosting

# 方法 2: 先推送到 GitHub，然後部署
git add .
git commit -m "Update"
git push origin main
firebase deploy --only hosting
```

---

## 方法二：使用 GitHub Actions 自動部署（推薦）

### 設置步驟

1. **獲取 Firebase Token**
   ```bash
   firebase login:ci
   ```
   複製顯示的 token（類似：`1//xxx...`）

2. **在 GitHub 設定 Secret**
   - 前往您的 GitHub 儲存庫
   - 點擊 **Settings** → **Secrets and variables** → **Actions**
   - 點擊 **New repository secret**
   - Name: `FIREBASE_TOKEN`
   - Value: 貼上剛才複製的 token
   - 點擊 **Add secret**

3. **確認專案配置**
   檢查 `.firebaserc` 檔案，確認專案 ID 正確：
   ```json
   {
     "projects": {
       "default": "chatbot-with-ibm"
     }
   }
   ```

4. **推送代碼**
   ```bash
   git add .
   git commit -m "Add GitHub Actions deployment"
   git push origin main
   ```

### 完成！

現在每次您推送代碼到 `main` 分支時，GitHub Actions 會自動部署到 Firebase。

---

## 📍 查看部署結果

部署完成後，您的網站會在這裡：
- `https://chatbot-with-ibm.web.app`
- `https://chatbot-with-ibm.firebaseapp.com`

---

## 🔍 檢查部署狀態

### 在命令行
```bash
firebase hosting:channel:list
```

### 在 GitHub
- 前往 **Actions** 標籤頁
- 查看最新的工作流執行狀態

---

## ⚠️ 常見問題

**Q: 部署失敗怎麼辦？**
A: 
1. 確認已登入：`firebase login`
2. 確認專案 ID 正確
3. 檢查錯誤訊息

**Q: GitHub Actions 失敗？**
A:
1. 確認 `FIREBASE_TOKEN` secret 已設置
2. 檢查 Actions 日誌
3. 如果 token 過期，重新執行 `firebase login:ci` 並更新 secret

**Q: 如何回滾到之前的版本？**
A:
```bash
firebase hosting:channel:list
firebase hosting:rollback
```


