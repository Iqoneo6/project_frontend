FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (if present)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the default Vite port (usually 5173)
EXPOSE 8010

# Run Vite in development mode
CMD ["npm", "run", "dev"]
