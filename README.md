# today-server

เซิร์ฟเวอร์เกม Today (Unity · Netcode for GameObjects · WebSocket) รันบน Render

## อัปเดตเซิร์ฟเวอร์
1. Unity → เมนู **Today MMO → Build Linux Server** (build ลง `Build/` ของ repo นี้ให้เอง)
2. GitHub Desktop → Commit → Push
3. Render deploy ใหม่เอง (ถ้าเปิด Auto-Deploy)

## ตั้ง Render ครั้งแรก
1. render.com → **New → Web Service** → เลือก repo `today-server`
2. Language/Runtime: **Docker** (Render เจอ `Dockerfile` เอง) · Branch: `main` · Instance type: **Free**
3. ไม่ต้องตั้ง Environment Variable (Render ใส่ `PORT` ให้เอง เกมอ่านค่านี้)
4. Health Check Path: เว้นว่าง
5. Create → รอ deploy เสร็จ → ได้ที่อยู่ เช่น `https://today-server.onrender.com`
6. ถ้าชื่อไม่ใช่ `today-server.onrender.com` → แก้ `Assets/TodayMMO/Resources/Data/server.json` (ช่อง `host`) ในโปรเจกต์ Unity แล้ว build เกมเว็บใหม่

## หมายเหตุ
- ผู้เล่นต่อ `wss://<host>:443` (Render ทำ HTTPS ให้ · เซิร์ฟเวอร์ฟังแบบ ws ธรรมดาที่พอร์ต `PORT`)
- Free: ไม่มีคนเล่น 15 นาที = เซิร์ฟเวอร์หลับ · ปลุกครั้งแรกรอ ~1 นาที
- Free ไม่มีดิสก์ถาวร → **เซฟผู้เล่นหายเมื่อ deploy ใหม่ / เซิร์ฟเวอร์หลับ** (ช่วงทดสอบ)
- RAM 512 MB · build ใช้ Dedicated Server optimizations (ตัดภาพ/เสียงออก)
- ดู log: หน้า service บน Render → Logs (บรรทัด `Today MMO: dedicated server started on port ...`)
