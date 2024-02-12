# Use an official Node.js runtime as the base image
FROM --platform=linux/amd64 node:lts-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Install an old version of the request package that has known vulnerabilities  
# RUN npm install request@2.68.0  

# Copy the rest of the application code to the working directory
COPY . ./

# Expose a port (if your application listens on a specific port)
EXPOSE 3000

# Define the command to run your application
CMD [ "npm", "start" ]