# Use Node 20 (LTS) on Alpine
FROM node:20-alpine

# Create app dir
WORKDIR /usr/src/app

# Install deps using lockfile if present
COPY package*.json ./
#RUN npm ci --omit=dev || npm install --omit=dev
# If lockfile exists → npm ci; otherwise → npm install
RUN if [ -f package-lock.json ]; then \
      npm ci --omit=dev; \
    else \
      npm install --omit=dev; \
    fi

# Copy the rest of the app
COPY . .

# Runtime env
ENV NODE_ENV=production PORT=3000

# Container port (ALB forwards to this)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
