FROM node:22-alpine

WORKDIR /app
COPY ./package*.json ./

RUN npm install 

COPY . . 

# RUN npx prisma migrate dev 
RUN npx prisma generate 
RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "docker:start" ]
# CMD ["npm", "start"]
