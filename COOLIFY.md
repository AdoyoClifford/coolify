# Coolify Deployment Guide

This document provides instructions for deploying the Express Hello World application to Coolify using the domain `https://passport.abyauniversity.com`.

## 🚀 Quick Deploy

### 1. **Repository Setup**
- Push this repository to GitHub
- Ensure all files are committed and pushed to the `main` branch

### 2. **Coolify Project Setup**
1. Log into your Coolify dashboard
2. Create a new project
3. Select "Docker Compose" as the deployment method
4. Connect your GitHub repository
5. Set the branch to `main`
6. Set the build path to `/` (root directory)

### 3. **Domain Configuration**
1. In Coolify project settings, set:
   - **Domain**: `passport.abyauniversity.com`
   - **Protocol**: HTTPS (Coolify will handle SSL automatically)
   - **Port**: 3000 (internal container port)

### 4. **Environment Variables**
Configure these variables in Coolify's environment section:

#### **Required Variables:**
```bash
NODE_ENV=production
PORT=3000
APP_SECRET=your-secure-app-secret-key
API_KEY=your-api-key-for-authentication
```

#### **Optional Variables (for future features):**
```bash
DATABASE_URL=postgresql://user:pass@host:5432/db
REDIS_URL=redis://host:6379
JWT_SECRET=your-jwt-secret
SESSION_SECRET=your-session-secret
```

### 5. **Deploy**
1. Click "Deploy" in Coolify
2. Monitor the build logs
3. Wait for deployment to complete
4. Test the application at `https://passport.abyauniversity.com`

## 📋 Application Endpoints

After deployment, these endpoints will be available:

- **Homepage**: `https://passport.abyauniversity.com/`
  - Returns: "Hello World!"
  
- **API Endpoint**: `https://passport.abyauniversity.com/api/hello`
  - Returns: JSON with message and timestamp
  
- **Health Check**: `https://passport.abyauniversity.com/health`
  - Returns: Application health status (used by Coolify for monitoring)

## 🔧 Coolify Configuration Features

### **Automatic Features:**
- ✅ SSL/TLS certificates (via Let's Encrypt)
- ✅ HTTPS redirect
- ✅ Load balancing (Traefik proxy)
- ✅ Health monitoring
- ✅ Auto-restart on failure
- ✅ Zero-downtime deployments

### **Health Monitoring:**
- Health check endpoint: `/health`
- Check interval: 30 seconds
- Timeout: 10 seconds
- Retries: 3 attempts
- Start period: 40 seconds

### **Container Configuration:**
- Base image: `node:18-alpine`
- Runtime user: `nodeapp` (non-root for security)
- Resource optimization: Multi-stage build
- Network: Isolated Docker network

## 🛠️ Development vs Production

### **Development:**
```bash
# Run locally with Docker Compose
docker-compose --profile development up app-dev

# Access at: http://localhost:3001
```

### **Production (Coolify):**
- Uses production-optimized Dockerfile stage
- Environment variables managed by Coolify
- SSL termination handled by Traefik
- Health checks and monitoring enabled

## 🔒 Security Features

### **Container Security:**
- Non-root user execution
- Minimal Alpine Linux base
- No unnecessary packages
- Secure environment variable handling

### **Network Security:**
- Isolated Docker networks
- Only necessary ports exposed
- HTTPS enforcement
- Security headers via Traefik

## 🔄 CI/CD Integration

### **Automatic Deployments:**
1. Push to `main` branch
2. Coolify detects changes
3. Automatic build and deployment
4. Health check verification
5. Traffic routing to new version

### **Rollback Support:**
- Coolify maintains deployment history
- One-click rollback to previous versions
- Database migration compatibility

## 🚨 Troubleshooting

### **Common Issues:**

#### 1. **Build Failures:**
```bash
# Check build logs in Coolify dashboard
# Verify Dockerfile syntax
# Ensure all dependencies are in package.json
```

#### 2. **Health Check Failures:**
```bash
# Verify /health endpoint responds with 200
# Check container logs for errors
# Ensure app binds to 0.0.0.0:3000 (not localhost)
```

#### 3. **Environment Variables:**
```bash
# Verify all required env vars are set in Coolify
# Check for typos in variable names
# Ensure sensitive values are not in code
```

### **Monitoring Commands:**
```bash
# View application logs
docker logs express-hello-world

# Check container health
docker inspect express-hello-world | grep Health

# Test health endpoint
curl https://passport.abyauniversity.com/health
```

## 📊 Performance Optimization

### **Current Optimizations:**
- Multi-stage Docker build (smaller image size)
- Alpine Linux (minimal footprint)
- Production-only dependencies
- Health check optimization

### **Future Optimizations:**
- Redis for session storage
- Database connection pooling
- CDN integration for static assets
- Horizontal scaling support

## 📞 Support

If you encounter issues during deployment:

1. Check Coolify deployment logs
2. Verify environment variables
3. Test health endpoint manually
4. Review Docker container logs
5. Contact Coolify support if needed

---

**Deployment Target**: `https://passport.abyauniversity.com`  
**Repository**: `AdoyoClifford/coolify`  
**Branch**: `main`  
**Dockerfile**: Multi-stage production build  
**Health Check**: `/health` endpoint
