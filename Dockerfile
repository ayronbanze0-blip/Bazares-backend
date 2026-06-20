FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
# Note: prisma (the CLI) is a devDependency but is required both at build
# time (prisma generate) and at container start (prisma migrate deploy),
# so we cannot use --omit=dev here.
RUN npm install

COPY . .

RUN npx prisma generate

EXPOSE 3001

CMD ["sh", "-c", "npm run db:migrate:deploy && npm run db:seed && node src/server.js"]
