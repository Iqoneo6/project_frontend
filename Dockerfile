# Step 1: Use an official Node.js runtime as the base image to build the project
FROM node:18-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Step 2: Copy package.json and package-lock.json (or yarn.lock) first to take advantage of Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Step 3: Copy the rest of the application code
COPY . .

# Step 4: Build the Vite project for production
RUN npm run build

# Step 5: Use an official Nginx image to serve the production build
FROM nginx:alpine

# Step 6: Copy the build output from the build stage into Nginx's public directory
COPY --from=build /app/dist /usr/share/nginx/html

# Step 7: Copy the custom Nginx configuration (optional if you need to change settings)
# COPY nginx.conf /etc/nginx/nginx.conf

# Step 8: Expose port 80 for the web server
EXPOSE 80

# Step 9: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
