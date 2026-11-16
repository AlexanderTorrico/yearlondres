# Etapa 1: compilar la app
FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# Versión (commit) que manda GitHub Actions; Vite la expone como import.meta.env.VITE_APP_VERSION
ARG APP_VERSION=dev
ENV VITE_APP_VERSION=$APP_VERSION
RUN npm run build

# Etapa 2: servirla con nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80



# docker run --name clanding -p 8090:80 landing
# sudo docker tag landing:latest derxnur/landing:v1.0.0
# sudo docker push  derxnur/landing:v1.0.0