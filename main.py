import os
import time

# مسح الشاشة لتنظيف أي بقايا سابقة
os.system('clear')

# ألوان Terminal ANSI للتجميل
CYAN = "\033[1;36m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"
PURPLE = "\033[1;35m"
RESET = "\033[0m"

# طباعة الواجهة الاحترافية الملونة
print(f"""
{CYAN}╔══════════════════════════════════════════════════════════╗
║             {YELLOW}APK URL & API Deep Scanner v3.0{CYAN}             ║
║     {PURPLE}DEX | Native .so | Assets | XML | Configs{CYAN}            ║
╠══════════════════════════════════════════════════════════╝{RESET}
{GREEN} 👑 Developer :{RESET} @oussakus
{GREEN} 🎵 TikTok    :{RESET} o_sa.m_
{GREEN} 📢 Channel   :{RESET} https://t.me/Dark_Osaa
{CYAN}╚══════════════════════════════════════════════════════════╝{RESET}
""")

print(f"{YELLOW}[+] جاري تحميل محرك الأداة وفحص البيئة...{RESET}")
time.sleep(0.8) # حركة جمالية بسيطة

# استدعاء ملف النواة الأساسي لتشغيل الأداة
import sq_core

if __name__ == "__main__":
    sq_core.main()
