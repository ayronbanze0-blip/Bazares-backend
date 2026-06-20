FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3001

CMD ["sh", "-c", "npm run db:migrate:deploy && npm run db:seed && node src/server.js"]
