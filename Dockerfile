# Use the Playwright base image
FROM mcr.microsoft.com/playwright:v1.48.2-jammy

# Set the working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./

# Install production dependencies only
# The --omit=dev flag ensures development dependencies are not installed.
RUN npm ci --omit=dev

# Copy the rest of the source code
COPY . .

# Expose the required port
ENV PORT 8080

# Grant permissions (This might be a security concern and should be revisited!)
# It is highly recommended to adjust the permissions to only necessary files and folders instead.
RUN chmod -R 777 ./

# Run the application
CMD ["npm", "run", "start-project"]
