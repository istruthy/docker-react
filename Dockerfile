# sets up build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# just by putting in the FROM terminates previous block
FROM nginx
# copies over the previous build named builder using 'as'
COPY --from=builder /app/build /usr/share/nginx/html
