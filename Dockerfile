FROM node:alpine as teamalpha
WORKDIR /var/app

COPY package.json .
RUN npm install

copy . .

RUN npm run build

FROM nginx
EXPOSE 80
copy --from=teamalpha /var/app/build /usr/share/nginx/html