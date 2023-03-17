FROM node:lts-alpine

#COPY PACKAGE JSON FILES
COPY package*.json ./

#install pretier
RUN npm install prettier -g

#install files
RUN npm install

#copy source file
COPY . .
EXPOSE 8000

CMD ["node","src/app.js"]