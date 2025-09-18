## Multistage Dockerfile for Cosign Pipeline Sample App
# Note: index.html uses external image URLs. Internet access is required for images to display.
FROM nginx:1.25-alpine AS base

# Stage 2: Copy static site to nginx
FROM nginx:1.25-alpine AS final
LABEL maintainer="Amaan Ul Haq Siddiqui <amaanulhaq.s@outlook.com>"

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy our static site and images
COPY index.html /usr/share/nginx/html/index.html
COPY images/ /usr/share/nginx/html/images/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]