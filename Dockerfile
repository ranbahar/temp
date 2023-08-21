# Base image
FROM node:18-alpine as builder

# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY ./package*.json ./
#COPY . .

# Install app dependencies
RUN npm install
#
## Bundle app source
COPY . .
#COPY ./nest-cli.json ./nest-cli.json
#COPY ./package.json ./package.json
#COPY ./package-lock.json ./package-lock.json
#COPY ./tsconfig.build.json ./tsconfig.build.json
#COPY ./tsconfig.json ./tsconfig.json
#COPY dist/ .
COPY ./dist .


# Creates a "dist" folder with the production build
RUN npm run build

# Start the server using the production build
CMD [ "node", "dist/main.js" ]