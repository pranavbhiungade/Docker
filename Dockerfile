FROM node:20-alpine

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .
# ignore node_modules 

EXPOSE 5173

CMD [ "npm","run","dev" ]

# 1. FROM node:20-alpine
# This specifies the base image for the container.
# It pulls a lightweight version of Node.js (v20) based on the Alpine Linux distribution, which is known for being minimal and efficient.

# 2. WORKDIR /app
# This sets the working directory for the container.
# Any subsequent commands (like COPY, RUN, etc.) will be executed inside /app. If the directory doesn’t exist, Docker will create it.

# 3. COPY package*.json .
# This copies both package.json and package-lock.json (if it exists) from your local machine to the working directory (/app) in the container.
# The * is a wildcard, meaning it will match both package.json and package-lock.json.

# 4. RUN npm install
# This command runs npm install inside the container, installing all dependencies listed in package.json.
# Since the dependencies are installed based on package*.json, copying these files first allows Docker to cache the installation step, speeding up subsequent builds if there are no changes to dependencies.

# 5. COPY . .
# This copies the rest of the project files from the current directory on your machine to the working directory (/app) in the container.
# It’s done after installing dependencies to avoid re-installing packages every time there's a change in the project code.

# 6. EXPOSE 5173
# This indicates that the application inside the container listens on port 5173.
# This doesn’t actually publish the port, but it serves as documentation and can help tools like Docker Compose map ports more easily.

# 7. CMD [ "npm", "run", "dev" ]
# This defines the command that will be run when the container starts.
# In this case, it runs the npm run dev command, which typically starts the application in development mode.
# Summary
# This Dockerfile is setting up a Node.js application using the Alpine Linux base, installing dependencies, copying application files, and then running the app in development mode (typically with hot-reloading) on port 5173.