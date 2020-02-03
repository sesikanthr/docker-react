FROM node:alpine as build

WORKDIR /opt/apps/frontend

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build /opt/apps/frontend/build /usr/share/nginx/html





