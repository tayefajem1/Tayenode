# Use a specific version of Node.js for consistency
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the port (adjust if needed)
EXPOSE 3000

# Start the application
CMD ["node", "service.js"]

