# /app /usr /lib
FROM node:19.2-alpine3.16
# FROM --platform=linux/amd64 node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16

# cd app
WORKDIR /app

# Dest /pp
COPY package.json ./

# Instalar dependencias  incluidos los test
RUN npm install

# Copiar todo el proyecto
COPY . .

# Realizar testing 
RUN npm run test

# Eliminar archivos y directorios no necesarios en PROD
RUN rm -rf test && rm -rf node_modules

# Instalar dependencias unicamentes de PROD
RUN npm install --prod

# Comando ejecutar aplicacion
CMD [ "node", "app.js" ]