# Use a specific version of Node.js for consistency
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy only the package files to leverage Docker cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on (optional, but good practice)
EXPOSE 3000

# Define the command to run your app
CMD ["node", "service.js"]

