#stage-1 --> Build Stage

FROM node:25 AS builder
WORKDIR /apps
COPY docker-multi-stage-nodejs/package*.json /apps/
RUN npm install
COPY . .
RUN npm run build

#stage-2 --> Prod Stage

FROM node:25-slim
WORKDIR /apps
COPY --from=builder /apps ./
CMD ["npm", "start"]
