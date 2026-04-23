FROM node:25 AS builder
WORKDIR /apps

COPY docker-multi-stage-nodejs/package*.json ./
RUN npm install
COPY docker-multi-stage-nodejs/ ./

# Stage 2: Production
FROM node:25-slim
WORKDIR /apps

COPY --from=builder /apps ./

CMD ["npm", "start"]
