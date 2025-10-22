# syntax=docker/dockerfile:1
FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy source
COPY src ./src

# Expose port and run
EXPOSE 3000
ENV NODE_ENV=production
CMD ["node", "src/index.js"]
