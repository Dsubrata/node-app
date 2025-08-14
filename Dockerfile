# Use an official Node.js runtime as a parent image.
# Using a specific version like node:18-alpine is recommended for stability and smaller image size.
FROM node:18-alpine

# Set the working directory inside the container.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if present) to the working directory.
# This allows npm install to run efficiently by only invalidating the layer when these files change.
COPY package*.json ./

# Install application dependencies.
RUN npm install

# Copy the rest of the application source code to the container.
COPY . .

# Expose the port your Node.js application listens on.
# Replace 3000 with the actual port your application uses.
EXPOSE 3000

# Define the command to run when the container starts.
# Replace 'server.js' with the entry point of your Node.js application.
CMD ["node", "app.js"]