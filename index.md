# Apktool for Termux

A professional, auto-updating installer and configuration script to run the latest version of **Apktool** natively in the **Termux** terminal on Android. 

No need to wait for package updates—this script pulls the newest official releases directly from the source and configures your environment automatically.

---

## 🚀 Key Features

* **Auto-Update System:** Always fetches and installs the latest version of Apktool directly from the official iBotPeaches release API.
* **Smart Native Dependencies:** Automatically checks, installs, and configures all required tools (`openjdk-17`, `aapt`, `lolcat`, `wget`, `curl`).
* **Environment Compatibility:** Configures and patches the wrapper shebang so that Apktool runs flawlessly within Termux's environment.
* **Beginner Friendly:** Menu-driven interface that lets you install Apktool, configure Java, or exit with a single keystroke.

---

## 📥 Installation

Open your Termux terminal and execute the following commands to install:

```bash
# Update and upgrade your Termux repositories
apt-get update -y && apt-get upgrade -y

# Install git
pkg install git -y

# Clone the installer repository
git clone https://github.com/h4ck3r0/Apktool-termux

# Navigate to the repository directory
cd Apktool-termux

# Grant execution permissions
chmod +x *

# Run the setup script to install dependencies
bash setup.sh

# Run the installer menu script
bash apktool.sh
```

---

## 🛠️ How to Use

After successful installation, you can open a new Termux session and use `apktool` directly:

### 1. Decode an APK
To extract and decode the resources of an APK file:
```bash
apktool d app.apk
```

### 2. Rebuild an APK
To compile your modified project folder back into an APK file:
```bash
apktool b app_folder
```

---

## 🔧 Troubleshooting

### 1. Exec Format / Rebuild Errors
If you run into errors while rebuilding an APK, ensure that Termux's native `aapt` package is installed:
```bash
pkg install aapt -y
```
*Apktool-termux installs this by default to ensure you don't run into standard binary errors.*

### 2. Android 8+ / Permission Issues
On newer Android versions, if you encounter Java permission errors, execute your commands inside a `proot` environment:
```bash
# Install and run proot
pkg install proot -y
proot -0

# Now run your apktool commands
apktool d app.apk
```

---

## 👤 Credits and Support

* **Script Developed by:** H4Ck3R (Raj Aryan)
* **Apktool Core Project:** iBotPeaches ([Apktool Github](https://github.com/iBotPeaches/Apktool))
* **Need Help?** Watch the YouTube tutorial or visit the website guides for advanced usage:
  * [Full Installation Guide & Tutorials](https://www.h4ck3r.me/how-to-install-apktool-in-termux/)
  * [Advanced Usage & Commands](https://www.h4ck3r.me/the-power-of-apktool-apktool-usage/)
