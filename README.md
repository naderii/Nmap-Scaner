## مستندات اسکریپت Scan-Web.sh برای بررسی امنیت وب‌سایت

این اسکریپت برای اسکن وب و بررسی مشکلات امنیتی آن استفاده می‌شود. شامل تست‌های زیر است:

### 1. اسکن پورت‌های باز
**توضیح:** این اسکن برای شناسایی سیستم‌های پشت فایروال استفاده می‌شود. برخی از فایروال‌ها پینگ را مسدود می‌کنند، بنابراین این روش باعث می‌شود که Nmap بدون انجام پینگ، مستقیماً سراغ اسکن برود.

### 2. تشخیص سیستم‌عامل
**توضیح:** این اسکن تلاش می‌کند سیستم‌عامل سرور را شناسایی کند. Nmap این کار را با بررسی پاسخ‌های بسته‌های TCP/IP انجام می‌دهد.

### 3. اسکن کامل با اسکریپت‌های NSE
**توضیح:** این اسکن، سرویس‌های اجراشده روی سرور را همراه با نسخه‌های آن‌ها نمایش می‌دهد و برخی اسکریپت‌های پیش‌فرض را اجرا می‌کند.

### 4. بررسی نسخه سرویس‌ها
**توضیح:** این اسکن نسخه‌های سرویس‌هایی که روی سرور اجرا می‌شوند را شناسایی کرده و به یافتن آسیب‌پذیری‌های مرتبط کمک می‌کند.

### 5. بررسی آسیب‌پذیری‌های عمومی
**توضیح:** این اسکن مجموعه‌ای از اسکریپت‌های Nmap را اجرا می‌کند که برای بررسی آسیب‌پذیری‌های امنیتی شناخته‌شده طراحی شده‌اند.

### 6. اسکن با تشخیص فایروال (Aggressive Scan)
**توضیح:** در این روش، Nmap به‌صورت تهاجمی اطلاعاتی درباره‌ی فایروال و سایر جزئیات امنیتی جمع‌آوری می‌کند.

### 7. اسکن سریع و پنهان (Stealth Scan)
**توضیح:** این روش برای جلوگیری از شناسایی توسط سیستم‌های امنیتی و لاگ‌های شبکه استفاده می‌شود.

### 8. بررسی مسیرهای باز و فیلتر شده (Traceroute)
**توضیح:** مسیرهای شبکه برای بررسی وجود فیلترها و موانع احتمالی تحلیل می‌شود.

### 9. اسکن با بررسی DNS Enumeration
**توضیح:** اطلاعاتی درباره‌ی DNS و زیر دامنه‌های یک سایت جمع‌آوری می‌شود.

### 10. اسکن با استفاده از اسکریپت‌های مخصوص حملات Brute Force
**توضیح:** تست‌های مربوط به حملات بروت‌فورس روی سرویس‌های حساس اجرا می‌شود.

### 11. تشخیص CMS
**توضیح:** سیستم‌های مدیریت محتوا مانند وردپرس، جوملا و دروپال شناسایی می‌شوند.

### 12. بررسی آسیب‌پذیری‌های CMS
**توضیح:** نقاط ضعف و آسیب‌پذیری‌های مرتبط با CMS مورد بررسی قرار می‌گیرد.

### 13. اسکن برای اکسپلویت‌های شناخته‌شده با استفاده از Exploit-DB
**توضیح:** Nmap پایگاه داده اکسپلویت‌ها را بررسی کرده و آسیب‌پذیری‌های شناخته‌شده را شناسایی می‌کند.

### 14. بررسی ضعف‌های SSL/TLS
**توضیح:** مشکلات احتمالی در پیکربندی SSL/TLS شناسایی شده و توصیه‌های امنیتی ارائه می‌شود.

### 15. بررسی دیسکاوری دایرکتوری‌ها و فایل‌های مخفی
**توضیح:** فایل‌های پشتیبان، نسخه‌های قدیمی و مسیرهای حساس شناسایی می‌شوند.

### 16. بررسی آسیب‌پذیری تزریق SQL (SQL Injection)
**توضیح:** بررسی می‌شود که آیا وب‌سایت در برابر حملات SQL Injection آسیب‌پذیر است یا خیر.

### 17. بررسی اجرای کد از راه دور (Remote Code Execution)
**توضیح:** بررسی می‌شود که آیا اجرای کد مخرب از راه دور روی سرور امکان‌پذیر است یا خیر.

---

### نحوه استفاده:
برای اجرای اسکریپت، کافی است دسترسی اجرا (execute) به آن بدهید و سپس آن را اجرا کنید.


----

## **توضیح اسکریپت بررسی امنیتی با Auto-scan.sh ** 
این اسکریپت یک ابزار خودکار برای اسکن امنیتی و جمع‌آوری اطلاعات درباره سرورهای هدف با استفاده از **Nmap** است. این اسکن شامل بررسی پورت‌های باز، سرویس‌های فعال، آسیب‌پذیری‌های شناخته‌شده و امنیت ارتباطات SSL می‌شود.  



### 1️⃣ **ورودی دامنه یا آدرس IP**  
- کاربر یک **دامنه** یا **آدرس IP** را وارد می‌کند تا فرآیند اسکن آغاز شود.  
- نام فایل خروجی بر اساس دامنه و زمان اسکن تنظیم می‌شود.  

### 2️⃣ **اسکن پورت‌های باز و تشخیص نسخه سرویس‌ها**  
- این بخش از اسکریپت تمام **پورت‌های باز** روی سرور را شناسایی کرده و **نسخه سرویس‌های فعال** را مشخص می‌کند.  
- این اطلاعات برای شناسایی آسیب‌پذیری‌های مربوط به نسخه‌های قدیمی سرویس‌ها مفید است.  

### 3️⃣ **بررسی آسیب‌پذیری‌های شناخته‌شده**  
- از اسکریپت‌های امنیتی **Nmap** برای شناسایی آسیب‌پذیری‌های موجود روی سرور استفاده می‌شود.  
- این مرحله بررسی می‌کند که آیا سرویس‌های فعال دارای **نقاط ضعف شناخته‌شده** هستند یا خیر.  

### 4️⃣ **بررسی امنیت ارتباطات SSL/TLS**  
- وضعیت امنیتی پروتکل‌های **SSL/TLS** سرور هدف تحلیل می‌شود.  
- بررسی می‌شود که آیا سرور از **الگوریتم‌های رمزنگاری ضعیف** استفاده می‌کند یا خیر.  

### 5️⃣ **شناسایی سیستم‌های مدیریت محتوا (CMS)**  
- اسکریپت‌های مربوط به **CMSها** اجرا می‌شوند تا مشخص شود آیا سرور از وردپرس، جوملا یا دروپال استفاده می‌کند.  
- این بخش می‌تواند اطلاعات مهمی درباره امنیت و ساختار سایت ارائه دهد.  

### 6️⃣ **تحلیل مسیر شبکه (Traceroute)**  
- مسیر **دست‌یابی به سرور هدف** بررسی می‌شود تا مشخص شود داده‌ها از چه مسیری عبور می‌کنند.  
- این فرآیند می‌تواند به شناسایی **فایروال‌ها** و **مسیریاب‌های بین راه** کمک کند.  

### 7️⃣ **بررسی امنیت سرویس‌های مهم (FTP, SMB, SSH)**  
- بررسی می‌شود که آیا سرور **FTP، SMB و SSH** دارای ضعف‌های امنیتی شناخته‌شده هستند یا نه.  
- این اسکن به‌خصوص برای بررسی **دسترسی ناشناس (Anonymous Access)** در سرویس‌های FTP و SMB مفید است.  

### 8️⃣ **ذخیره‌سازی و نمایش نتایج اسکن**  
- نتایج نهایی در یک فایل لاگ ذخیره شده و مسیر آن نمایش داده می‌شود.  

---

## **نتیجه‌گیری**  
✅ این اسکریپت یک ابزار **خودکار و کاربردی** برای تست امنیتی سرورهاست که اطلاعات کاملی درباره سرویس‌ها، آسیب‌پذیری‌ها و مسیرهای ارتباطی ارائه می‌دهد.
