# Step 1: Use the official Node.js image as the base image
FROM node:latest

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy package.json and package-lock.json to the working directory
# This is done first to install dependencies before copying the entire codebase
COPY package.json ./
COPY package-lock.json ./

# Step 4: Install the dependencies defined in package.json
RUN npm install

# Step 5: Copy the rest of the application code to the container
COPY . .

# Step 6: Expose the port that the Node.js application will use
EXPOSE 4000

# Step 7: Define the default command to run the application
# Replace `index.js` with the actual entry file if it differs
CMD [ "node", "index.js" ]
