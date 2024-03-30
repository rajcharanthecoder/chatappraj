# Use Ubuntu as base image
FROM ubuntu:latest

# Update package repository and install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy nginx configuration file
COPY chatapp.conf /etc/nginx/sites-available/chatapp.conf

# Remove default nginx virtualhost conf
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default

# Create symlink to enable chatapp.conf
RUN ln -s /etc/nginx/sites-available/chatapp.conf /etc/nginx/sites-enabled/chatapp.conf

# Expose port 80
EXPOSE 80

# Start nginx service
CMD ["nginx", "-g", "daemon off;"]
