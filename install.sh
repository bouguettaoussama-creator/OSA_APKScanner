#!/bin/bash

echo "[+] جاري إعداد وتثبيت أداة OSA_APKScanner..."

# 1. تحديث وتثبيت الأدوات الأساسية
pkg update -y && pkg install python curl -y > /dev/null 2>&1

# 2. إنشاء المجلد الداخلي للأداة
mkdir -p ~/.osa_tool/OSA_APKScanner

# 3. تنزيل الملفات مباشرة من GitHub
echo "[+] جاري تنزيل ملفات الأداة..."
curl -sL "https://raw.githubusercontent.com/bouguettaoussama-creator/OSA_APKScanner/main/main.py" -o ~/.osa_tool/OSA_APKScanner/main.py
curl -sL "https://raw.githubusercontent.com/bouguettaoussama-creator/OSA_APKScanner/main/sq_core.so" -o ~/.osa_tool/OSA_APKScanner/sq_core.so

# 4. إنشاء الأمر المختصر osa
echo '#!/bin/bash' > $PREFIX/bin/osa
echo 'python ~/.osa_tool/OSA_APKScanner/main.py "$@"' >> $PREFIX/bin/osa
chmod +x $PREFIX/bin/osa

echo "------------------------------------------------"
echo "[✓] تم التثبيت بنجاح!"
echo "[+] لتشغيل الأداة من أي مكان، فقط اكتب:"
echo "    osa /path/to/app.apk"
echo "------------------------------------------------"
