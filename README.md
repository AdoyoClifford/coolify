# Express Hello World Server

A simple Express.js server that returns "Hello World" - optimized for production deployment with Coolify.

## 🚀 **Live Demo**
**Production URL**: [https://passport.abyauniversity.com](https://passport.abyauniversity.com)

## 📋 **Available Endpoints**

- `GET /` - Returns "Hello World!" as plain text
- `GET /api/hello` - Returns a JSON response with "Hello World!" message and timestamp
- `GET /health` - Health check endpoint for monitoring (returns app status)

## 🛠️ **Local Development**

### Installation

1. Install dependencies:
   ```bash
   npm install
   ```

### Running the Server

- **Production mode:**
  ```bash
  npm start
  ```

- **Development mode (with auto-restart):**
  ```bash
  npm run dev
  ```

The server will run on `http://localhost:3000`

## 🐳 **Docker Deployment**

### Local Docker

```bash
# Build and run with Docker Compose
docker-compose up --build

# Access at: http://localhost (via Nginx proxy)
```

### Production with Coolify

This application is configured for deployment with [Coolify](https://coolify.io) - see [COOLIFY.md](./COOLIFY.md) for detailed deployment instructions.

**Key Features:**
- ✅ Automatic SSL/HTTPS
- ✅ Health monitoring
- ✅ Zero-downtime deployments  
- ✅ Environment variable management
- ✅ Auto-scaling ready

## 📁 **Project Structure**

```
coolify/
├── server.js              # Main Express application
├── package.json           # Dependencies and scripts
├── Dockerfile             # Multi-stage container build
├── docker-compose.yml     # Coolify-optimized compose file
├── .env.example          # Environment variables template
├── .gitignore            # Git ignore rules
├── README.md             # This file
├── COOLIFY.md            # Coolify deployment guide
├── DOCKER.md             # Docker documentation
└── nginx/                # Nginx configuration (for local dev)
    ├── nginx.conf
    └── conf.d/
        └── default.conf
```

## Example Usage

```bash
curl http://localhost:3000/
# Returns: Hello World!

curl http://localhost:3000/api/hello
# Returns: {"message":"Hello World!","timestamp":"2025-08-19T..."}
```
