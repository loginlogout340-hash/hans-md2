FROM node:22-alpine
RUN apk add --no-cache \
    git \
    ffmpeg \
    libwebp-tools \
    python3 \
    make \
    g++
ADD https://api.github.com/repos/loginlogout340-hash/hans-md2/git/refs/heads/main version.json
RUN git clone -b main https://github.com/loginlogout340-hash/hans-md2 /rgnk
WORKDIR /rgnk
RUN mkdir -p temp
ENV TZ=Africa/Accra
RUN npm install -g --force yarn pm2
RUN yarn install
CMD ["npm", "start"]
