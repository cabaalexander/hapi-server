FROM mhart/alpine-node:8 as builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production

FROM alpine:3.6
COPY --from=builder /usr/bin/node /usr/bin/
COPY --from=builder /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
WORKDIR /app
COPY --from=builder /app .
COPY . .
EXPOSE 8128
CMD ["node", "server.js"]

