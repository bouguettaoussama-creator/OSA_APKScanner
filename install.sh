#!/bin/bash

echo "[+] جاري إعداد وتثبيت أداة OSA_APKScanner..."

# 1. تحديث وتثبيت الأدوات الأساسية
pkg update -y && pkg install python unzip curl -y > /dev/null 2>&1

# 2. إنشاء المجلد الداخلي للأداة
mkdir -p ~/.osa_tool

# 3. تنزيل ملف الأداة المضغوط من حسابك في GitHub
echo "[+] جاري تنزيل الملفات..."
curl -sL "https://github.com/bouguettaoussama-creator/OSA_APKScanner/raw/main/OSA_APKScanner.zip" -o ~/.osa_tool/tool.zip

# 4. فك الضغط تلقائياً وتنظيف الملفات الزائدة
unzip -o ~/.osa_tool/tool.zip -d ~/.osa_tool/ > /dev/null 2>&1
rm ~/.osa_tool/tool.zip

# 5. إنشاء أمر مختصر في Termux (مثلاً: osa)
echo '#!/bin/bash' > $PREFIX/bin/osa
echo 'python ~/.osa_tool/OSA_APKScanner/main.py "$@"' >> $PREFIX/bin/osa
chmod +x $PREFIX/bin/osa

echo "------------------------------------------------"
echo "[✓] تم التثبيت بنجاح!"
echo "[+] لتشغيل الأداة من أي مكان، فقط اكتب:"
echo "    osa /path/to/app.apk"
echo "------------------------------------------------"

