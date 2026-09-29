FROM node:24-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install --production

FROM node:24-alpine AS runtime

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/node_modules ./node_modules

COPY . .

EXPOSE 8080

USER node 

CMD ["npm", "start"]