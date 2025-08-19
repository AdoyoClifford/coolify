# Express Hello World Server

A simple Express.js server that returns "Hello World".

## Installation

1. Install dependencies:
   ```bash
   npm install
   ```

## Running the Server

- **Production mode:**
  ```bash
  npm start
  ```

- **Development mode (with auto-restart):**
  ```bash
  npm run dev
  ```

The server will run on `http://localhost:3000`

## Routes

- `GET /` - Returns "Hello World!" as plain text
- `GET /api/hello` - Returns a JSON response with "Hello World!" message and timestamp

## Example Usage

```bash
curl http://localhost:3000/
# Returns: Hello World!

curl http://localhost:3000/api/hello
# Returns: {"message":"Hello World!","timestamp":"2025-08-19T..."}
```
