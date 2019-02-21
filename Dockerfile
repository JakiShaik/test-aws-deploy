#Specify base image

FROM node:alpine

WORKDIR /usr/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD ["npm","start"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html