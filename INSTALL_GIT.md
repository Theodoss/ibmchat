# 🔧 安裝 Git 指南

## 方法一：使用 Git for Windows（推薦）

### 下載並安裝

1. **下載 Git**
   - 前往：https://git-scm.com/download/win
   - 或直接下載：https://github.com/git-for-windows/git/releases/latest
   - 下載 `Git-x.x.x-64-bit.exe`（最新版本）

2. **安裝 Git**
   - 執行下載的安裝程式
   - 大部分選項使用預設值即可
   - 建議選擇：
     - ✅ "Git from the command line and also from 3rd-party software"
     - ✅ "Use bundled OpenSSH"
     - ✅ "Use the OpenSSL library"
     - ✅ "Checkout Windows-style, commit Unix-style line endings"
     - ✅ "Use MinTTY"

3. **驗證安裝**
   重新開啟 PowerShell，執行：
   ```powershell
   git --version
   ```
   應該會顯示版本號，例如：`git version 2.42.0`

---

## 方法二：使用 Winget（Windows 10/11）

如果您有 Windows 10/11，可以使用內建的包管理器：

```powershell
winget install --id Git.Git -e --source winget
```

---

## 方法三：使用 Chocolatey（如果已安裝）

```powershell
choco install git
```

---

## 安裝完成後

重新開啟 PowerShell，然後繼續部署流程：

```powershell
cd "C:\Users\e0987\Desktop\Capstone\GCP single page\gcp-demo-site"
git init
git add .
git commit -m "Initial commit"
```

---

## ⚠️ 如果暫時不想安裝 Git

您也可以直接部署到 Firebase，不需要 GitHub：

```powershell
# 安裝 Firebase CLI（如果還沒有）
npm install -g firebase-tools

# 登入
firebase login

# 直接部署
firebase deploy --only hosting
```

這樣網站會部署到 Firebase，但代碼不會保存到 GitHub。




