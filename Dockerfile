FROM node:16.16.0

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép package.json và package-lock.json vào container
COPY package*.json ./

# Cài đặt các dependencies của ứng dụng
RUN npm install

# Sao chép tất cả các tệp và thư mục từ thư mục nguồn vào container
COPY . .

# Xây dựng ứng dụng Angular
RUN npm run build
 
# Mở cổng 4200 để truy cập ứng dụng từ bên ngoài container
EXPOSE 4200

# Khởi chạy ứng dụng khi container được khởi động
CMD ["npm", "start"]