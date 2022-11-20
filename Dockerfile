# Build Stage 1
FROM node:16.17.0-alpine as install

WORKDIR /install
COPY package*.json ./

RUN npm install

# Build Stage 2
FROM node:16.17.0-alpine

WORKDIR /app
COPY --from=install /install ./
COPY public/ public/
COPY routes/ routes/ 
COPY views/ views/
COPY app.js ./

EXPOSE 3000

CMD ["node", "app.js"]
