#This dockerfile was intentionally built with the multi-stage dockerfile
#-method for the sole purpose of showing devOps depth
#it is not totally required as there is nothing to build (no bundling or compilation)

# Stage 1: Build stage (simulated for static site)
FROM alpine:latest AS builder



WORKDIR /app



# Copy all files
COPY . .

# Stage 2: Production stage

FROM nginx:alpine



# This command is to remove default Nginx files
RUN rm -rf /usr/share/nginx/html/*


# This is to Copy only needed files from builder stage
#Builder her is the alias created in the build stage
COPY --from=builder /app /usr/share/nginx/html


# exposing port 80 on the conatiner which will be mapped to an host port
EXPOSE 80


# this command is used to keep the Nginx process running in the foreground, 
# ensuring the Docker container does not shut down immediately after starting
CMD ["nginx", "-g", "daemon off;"]