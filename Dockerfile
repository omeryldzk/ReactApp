# Use the slim version of Node 14 as our base
FROM node:14-slim

# Create a directory for our application in the container 
RUN mkdir -p /usr/src/app

# Set this new directory as our working directory for subsequent instructions
WORKDIR /usr/src/app

# Copy all files in the current directory into the container
COPY . .

# Set the PYTHONPATH environment variable, which is occasionally necessary for certain node packages
# 'PWD' is an environment variable that stores the path of the current working directory
ENV PYTHONPATH=${PYTHONPATH}:${PWD}

# Set the environment variable for the application's port
# Change from 4200 to 8080 for Cloud Run
ENV PORT 3000

# Install 'serve', a static file serving package globally in the container
RUN npm install -g serve

# Install all the node modules required by the React app
RUN npm install

# Build the React app
RUN npm run build

# Serve the 'build' directory on port 8080 using 'serve'
CMD ["serve", "-s", "-l", "3000", "./build"]
