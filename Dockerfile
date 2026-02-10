# --- STAGE 1: Build APK ---
FROM runmymind/docker-android-sdk:latest AS builder

WORKDIR /app

# Chỉ copy những file cần thiết để tận dụng cache
COPY . .

# Xử lý lỗi xuống dòng của Windows (CRLF -> LF)
RUN sed -i 's/\r$//' gradlew

# Cấp quyền thực thi
RUN chmod +x gradlew

# Lệnh build (Thêm --no-daemon để chạy ổn định trong Docker)
RUN ./gradlew clean assembleDebug --no-daemon

# --- STAGE 2: Xuất file ---
FROM alpine:latest AS export
RUN mkdir /out
# Đại ca kiểm tra kỹ: Nếu app của đại ca nằm trong thư mục con, hãy sửa đường dẫn này
COPY --from=builder /app/build/outputs/apk/debug/app-debug.apk /out/app-debug.apk

CMD ["cp", "/out/app-debug.apk", "/delivery/"]
