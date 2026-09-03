FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache openssl libc6-compat

ENV PUPPETEER_SKIP_DOWNLOAD=true

COPY package*.json ./
COPY prisma ./prisma/

RUN npm install

COPY . .

RUN npm run build

EXPOSE 5000

CMD ["npm", "start"]