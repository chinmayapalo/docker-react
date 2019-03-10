FROM node:11.10.1-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm cache clean --force
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder  /app/build  /usr/share/nginx/html