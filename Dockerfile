FROM node:22-alpine

WORKDIR /app

# Copy package config and install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Copy application files
COPY . .

# Run the build script to generate the dist/ directory. 
# We use the generic linux base/web build, not the railway/mysql specific ones 
# since docker-compose will handle env vars and db instantiation.
RUN npm run build:linux:base
RUN npm run build:linux:web
# Copy the Railway configuration which relies purely on environment variables
RUN cp svc/config/Railway/* dist/

# Expose the port from the MVSF LAN configuration
EXPOSE 2000

# Start from the generated distribution directory
WORKDIR /app/dist

CMD ["node", "server.js"]
