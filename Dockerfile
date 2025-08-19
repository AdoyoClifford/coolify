# Multi-stage Dockerfile for Node.js Express App
# Stage 1: Base stage with dependencies
FROM node:18-alpine AS base

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci && npm cache clean --force

# Stage 2: Development stage
FROM base AS development
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]

# Stage 3: Production build
FROM node:18-alpine AS production

# Create app directory
WORKDIR /app

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeapp -u 1001

# Copy package files and install production dependencies only
COPY package*.json ./

# Install production dependencies using npm install --production
RUN npm ci --production && \
    npm cache clean --force && \
    rm -rf /tmp/*

# Copy application code
COPY --chown=nodeapp:nodejs . .

# Switch to non-root user
USER nodeapp

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3000/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Start application
CMD ["node", "server.js"]
