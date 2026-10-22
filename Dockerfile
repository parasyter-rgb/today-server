# เซิร์ฟเวอร์เกม Today (Unity Linux Dedicated Server) สำหรับ Render (Docker · Free)
# Build/ มาจาก Unity: เมนู Today MMO → Build Linux Server
FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Build/ /app/
RUN chmod +x /app/TodayServer.x86_64

# Render ส่งพอร์ตมาทาง env PORT (เกมอ่านเอง) · ไม่มี = 7777
ENV PORT=7777
EXPOSE 7777

# -logfile - = พิมพ์ log ออกหน้าจอ (ดูได้ในหน้า Logs ของ Render)
CMD ["sh", "-c", "./TodayServer.x86_64 -batchmode -nographics -logfile - -port ${PORT}"]
