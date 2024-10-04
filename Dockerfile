# Use the slim version of Node 14 (or switch to a newer version if needed)
FROM node:14-slim

# Create a directory for our application in the container 
WORKDIR /usr/src/app

# Copy package.json and package-lock.json separately to leverage Docker layer caching
COPY package*.json ./

# Install all the node modules required by the React app
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Set the environment variable for the application's port
# Cloud Run dynamically assigns a port, so use the PORT environment variable
ENV PORT 8080

# Build the React app for production
RUN npm run build

# Use 'serve' to serve the static files from the 'build' directory
# Use the Cloud Run-provided $PORT environment variable to listen on the correct port
CMD ["npx", "serve", "-s", "build", "-l", "8080"]
