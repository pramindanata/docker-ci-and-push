FROM node:alpine AS BUILD
WORKDIR /app
EXPOSE 4000
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "start"]