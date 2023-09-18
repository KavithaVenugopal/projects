# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Stage 1: Build the Node.js application
FROM node:14-alpine as build

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install
COPY . /app
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:latest

# Copy the built files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]

