import os
import time

# 1. مسح شاشة الترمكس لتنظيف أي شيء سابق
os.system('clear')

# 2. طباعة حقوقك والواجهة الخاصة بك بتنسيق فخم
print("""
╔══════════════════════════════════════════════════════════╗
║                   OSA APKScanner                         ║
║                                                          ║
║  👑 Developer : Oussama Bouguetta                         ║
║  📢 Telegram  : @YourTelegram                            ║
║  🎵 TikTok    : @YourTikTok                              ║
║  💬 Channel   : t.me/YourChannel                         ║
╚══════════════════════════════════════════════════════════╝
""")

print("[+] جاري تحميل محرك الفحص...")
time.sleep(1) # وقفة قصيرة لإعطاء مظهر احترافي

# 3. استدعاء الكốt أو الملف الأصلي للأداة ليبدأ العمل
import sq_core

if __name__ == "__main__":
    sq_core.main()
