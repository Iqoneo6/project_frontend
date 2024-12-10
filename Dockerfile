# Step 1: Use a Node.js image as the base image
FROM node:18-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Step 2: Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Step 3: Copy the rest of the application files
COPY . .

# Step 4: Expose the port for development (port 4000 as per your vite.config.ts)
EXPOSE 4000

# Step 5: Run the Vite development server
CMD ["npm", "run", "dev"]
