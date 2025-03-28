# Use a lightweight Node.js image as the base image
FROM node:22-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY solidjs_todo/package.json solidjs_todo/package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY solidjs_todo .

# Build the application
RUN npm run build

# Use a minimal server for serving static files
FROM node:22-alpine AS runner
WORKDIR /app

# Install a lightweight web server
RUN npm install -g serve

# Copy the built files from the previous stage
COPY --from=builder /app/dist /app/dist

# Expose the port
EXPOSE 3000

# Serve the application
CMD ["serve", "-s", "dist", "-l", "3000"]
