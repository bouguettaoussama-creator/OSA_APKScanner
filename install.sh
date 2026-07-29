#!/bin/bash

echo "[+] جاري إعداد وتثبيت أداة OSA_APKScanner v5.2..."

# 1. تحديث وتثبيت الأدوات الأساسية من النظام
pkg update -y && pkg install python curl -y > /dev/null 2>&1

# 2. تثبيت وتحديث مكتبات Python الأساسية
echo "[+] جاري التحقق من مكتبات Python التابعة..."
python -m pip install --upgrade pip setuptools > /dev/null 2>&1

# 3. إنشاء المجلد الداخلي للأداة
mkdir -p ~/.osa_tool/OSA_APKScanner

# 4. تنزيل الملفات مباشرة من GitHub
echo "[+] جاري تنزيل ملفات الأداة..."
curl -sL "https://raw.githubusercontent.com/bouguettaoussama-creator/OSA_APKScanner/main/main.py" -o ~/.osa_tool/OSA_APKScanner/main.py
curl -sL "https://raw.githubusercontent.com/bouguettaoussama-creator/OSA_APKScanner/main/osa.so" -o ~/.osa_tool/OSA_APKScanner/osa.so

# 5. إنشاء الأمر المختصر osascanner
echo '#!/bin/bash' > $PREFIX/bin/osascanner
echo 'python ~/.osa_tool/OSA_APKScanner/main.py "$@"' >> $PREFIX/bin/osascanner
chmod +x $PREFIX/bin/osascanner

echo "------------------------------------------------"
echo "[✓] تم التثبيت بنجاح!"
echo "[+] المطور: Oussama (@oussakus)"
echo "[+] لتشغيل الأداة من أي مكان في Termux، اكتب فقط:"
echo "    osascanner"
echo "------------------------------------------------"
