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

# Step 6: Build the Vite project (if you want to build it before serving)
RUN npm run build

# Step 7: Expose the port that the Vite development server or production server will run on
EXPOSE 4000

# Step 8: Start the application (either for development or production)
CMD ["npm", "run", "dev"]
