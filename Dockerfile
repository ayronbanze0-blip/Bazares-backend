FROM node:18-slim

WORKDIR /app

RUN apt-get update -y && apt-get install -y openssl ca-certificates && rm -rf /var/lib/apt/lists/*

COPY . .

RUN npm install

EXPOSE 3001

CMD ["sh", "-c", "npx prisma db push --accept-data-loss && npm run db:seed && node src/server.js"]
