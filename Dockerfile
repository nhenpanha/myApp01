FROM node:20-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN (npm ci --omit=dev) || (npm install --omit=dev)
COPY . .
EXPOSE 3000
HEALTHCHECK --interval=10s --timeout=3s --retries=5 \
  CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node", "server.js"]
