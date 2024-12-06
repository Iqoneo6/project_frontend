# Use the official Node.js image for building the React app
FROM node:16-alpine as build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to install dependencies
COPY frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the React code into the container
COPY frontend/ ./

# Build the React app for production
RUN npm run build

# Now use a lightweight Nginx image to serve the production build
FROM nginx:alpine

# Copy the React build files from the previous build stage to the Nginx server
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for serving the app
EXPOSE 80

# Start Nginx to serve the React app
CMD ["nginx", "-g", "daemon off;"]
