FROM node as build
RUN mkdir -p /app
WORKDIR /app

COPY package.json /app/

RUN npm install 

COPY . /app/
RUN npm run build --prod

# run nginx 
FROM nginx:alpine
copy --from=build /app/dist/project /usr/share/nginx/html

