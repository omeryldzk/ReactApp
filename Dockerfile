# Stage 1: Build the React application
FROM node:16 AS build
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the built static files with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
