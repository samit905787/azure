FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies

COPY package*.json ./

RUN npm install
# If you are building your code for production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
