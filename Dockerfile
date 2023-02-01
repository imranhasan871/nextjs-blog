# Create a Docker image with the latest version of the Nextjs app

# Use the official Node.js 14 image.
# https://hub.docker.com/_/node
FROM node:14 AS build 

# Create and change to the app directory.
WORKDIR /usr/src/app 

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

# Build a release artifact.
RUN npm run build


