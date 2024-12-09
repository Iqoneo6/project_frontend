# Step 1: Build the React app
FROM node:18 AS build

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the source code and build the app
COPY . ./
RUN npm run build

# Step 2: Set up the production environment with Nginx
FROM nginx:alpine

# Copy the build folder from the build stage to Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port Nginx is running on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
