#!/bin/bash

echo "[+] جاري إعداد وتثبيت أداة OSA_APKScanner v5.2..."

# 1. التحقق من البيئة (Termux أو Linux/Kali)
if command -v pkg >/dev/null 2>&1; then
    # نظام Termux
    BIN_DIR="$PREFIX/bin"
    pkg update -y && pkg install python curl -y > /dev/null 2>&1
else
    # نظام Kali / Debian Linux
    BIN_DIR="/usr/local/bin"
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update -y && sudo apt-get install -y python3 python3-pip curl > /dev/null 2>&1
    fi
fi

# 2. إنشاء المجلد الداخلي للأداة
mkdir -p ~/.osa_tool/OSA_APKScanner

# 3. تنزيل الملفات مباشرة من GitHub
echo "[+] جاري تنزيل ملفات الأداة..."
curl -sL "https://raw.githubusercontent.com/bouguettaoussama-creator/OSA_APKScanner/main/main.py" -o ~/.osa_tool/OSA_APKScanner/main.py
curl -sL "https://raw.githubusercontent.com/bouguettaoussama-creator/OSA_APKScanner/main/osa.so" -o ~/.osa_tool/OSA_APKScanner/osa.so

# 4. إنشاء الأمر المختصر osascanner في المسار المناسب
echo '#!/bin/bash' | sudo tee $BIN_DIR/osascanner > /dev/null 2>&1 || echo '#!/bin/bash' > $BIN_DIR/osascanner
echo 'python3 ~/.osa_tool/OSA_APKScanner/main.py "$@"' | sudo tee -a $BIN_DIR/osascanner > /dev/null 2>&1 || echo 'python3 ~/.osa_tool/OSA_APKScanner/main.py "$@"' >> $BIN_DIR/osascanner
sudo chmod +x $BIN_DIR/osascanner 2>/dev/null || chmod +x $BIN_DIR/osascanner

echo "------------------------------------------------"
echo "[✓] تم التثبيت بنجاح!"
echo "[+] المطور: Oussama (@oussakus)"
echo "[+] لتشغيل الأداة، اكتب فقط:"
echo "    osascanner"
echo "------------------------------------------------"
