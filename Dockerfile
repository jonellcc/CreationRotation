# Use lightweight Node.js image
FROM node:20-alpine AS base

# Set working directory
WORKDIR /server

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies (prod only)
RUN npm install --omit=dev

# Copy the entire project
COPY . .

# Build TypeScript
RUN npm run build

# Expose port (Express default 3000, change if needed)
EXPOSE 3000

# Start the server
CMD ["node", "out/main.js"]
