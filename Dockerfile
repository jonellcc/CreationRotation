FROM node:20-alpine AS base

# Set working directory
WORKDIR /server

# Copy package files from /server
COPY server/package*.json ./

# Install all dependencies (needed to run tsc)
RUN npm install

# Copy the rest of the project
COPY server/ ./

# Build TypeScript
RUN npm run build

# Expose app port (change if your server uses a different one)

# Run compiled code
CMD ["node", "out/main.js"]
