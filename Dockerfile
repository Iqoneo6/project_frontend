# Step 1: Use an official Node.js runtime as the base image
FROM node:18-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (or yarn.lock) first to take advantage of Docker layer caching
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code (including vite.config.ts)
COPY . .

# Step 6: Expose the Vite dev server port (default: 5173)
EXPOSE 4000

# Step 7: Start the Vite development server
CMD ["npm", "run", "dev"]
