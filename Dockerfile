# Step 1: Use a Node.js image as the base image
FROM node:18-alpine as builder

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Step 4: Copy the rest of the application files
COPY . .

# Step 5: Expose the port for development (port 4000 as per your vite.config.ts)
EXPOSE 4000

# Step 6: Run the Vite development server
CMD ["npm", "run", "dev"]
