# Docker Setup for Express Hello World App

This project includes a complete Docker setup with Nginx reverse proxy for production deployment.

## 🐳 Docker Files Overview

### 1. **Dockerfile** (Multi-stage build)
- **Base stage**: Common dependencies
- **Development stage**: For local development with hot reload
- **Production stage**: Optimized for production with security best practices

### 2. **docker-compose.yml**
- **Production services**: App + Nginx reverse proxy
- **Development profile**: For local development
- **Network isolation**: Containers communicate via internal network

### 3. **Nginx Configuration**
- **Reverse proxy**: Routes traffic to Node.js app
- **Load balancing**: Ready for multiple app instances
- **Security headers**: XSS protection, frame options, etc.
- **Rate limiting**: API protection
- **Gzip compression**: Better performance

## 🚀 Quick Start

### Production Deployment
```bash
# Build and start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### Development Mode
```bash
# Start in development mode with hot reload
docker-compose --profile development up app-dev

# Or build and run development container
docker build --target development -t express-app-dev .
docker run -p 3001:3000 -v $(pwd):/app express-app-dev
```

## 📋 Available Services

| Service | Port | Description |
|---------|------|-------------|
| Nginx Proxy | 80 | Production reverse proxy |
| Express App | 3000 | Internal app port (via Nginx) |
| Development App | 3001 | Direct access for development |

## 🛠️ Docker Commands

### Build specific stages
```bash
# Production build
docker build --target production -t express-app:prod .

# Development build
docker build --target development -t express-app:dev .
```

### Health checks
```bash
# Check container health
docker ps
docker inspect express-hello-world | grep Health

# Manual health check
curl http://localhost/api/hello
```

### Scaling
```bash
# Scale app to 3 instances
docker-compose up -d --scale app=3
```

## 🔧 Configuration

### Environment Variables
- `NODE_ENV`: Set to 'production' or 'development'
- `PORT`: App port (default: 3000)

### Nginx Features
- **Rate limiting**: 10 req/s for API, 1 req/s for login
- **Security headers**: XSS, CSRF, clickjacking protection
- **Gzip compression**: Automatic compression for text content
- **Health checks**: Built-in health endpoint monitoring
- **Static file caching**: 1-year cache for assets

### Docker Best Practices Implemented
- ✅ Multi-stage builds for smaller images
- ✅ Non-root user for security
- ✅ Health checks for container monitoring
- ✅ .dockerignore for smaller build context
- ✅ Alpine Linux for minimal base image
- ✅ Production-only dependencies in final stage
- ✅ Proper signal handling

## 🚨 Security Features

1. **Container Security**:
   - Non-root user (nodeapp:nodejs)
   - Minimal Alpine Linux base
   - No unnecessary packages

2. **Nginx Security**:
   - Security headers (XSS, CSRF protection)
   - Rate limiting
   - Hidden file access denied
   - Custom error pages

3. **Network Security**:
   - Internal Docker network
   - Only necessary ports exposed

## 🔍 Monitoring & Debugging

### View logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f app
docker-compose logs -f nginx
```

### Enter container
```bash
# App container
docker-compose exec app sh

# Nginx container
docker-compose exec nginx sh
```

### Performance monitoring
```bash
# Container stats
docker stats

# Resource usage
docker system df
```

## 🔄 Development Workflow

1. **Local Development**:
   ```bash
   docker-compose --profile development up app-dev
   ```

2. **Test Production Build**:
   ```bash
   docker-compose up --build
   ```

3. **Deploy to Production**:
   ```bash
   docker-compose -f docker-compose.yml up -d
   ```

## 📚 Additional Resources

- [Docker Best Practices for Node.js](https://snyk.io/blog/10-best-practices-to-containerize-nodejs-web-applications-with-docker/)
- [Nginx Configuration Guide](https://nginx.org/en/docs/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
