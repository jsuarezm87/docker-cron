# Inicio stage deps
FROM node:19.2-alpine3.16 as deps
WORKDIR /app
COPY package.json ./
RUN npm install
# Fin stage deps


# Inicio stage builder
FROM node:19.2-alpine3.16 as builder
WORKDIR /app
# Copia modulos de Node del stage deps
COPY --from=deps /app/node_modules ./node_modules
# Copiar resto del proyecto
COPY . .
RUN npm run test
# Fin stage builder

# Inicio stage prod-deps
FROM node:19.2-alpine3.16 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod
# Fin stage prod-deps


# Inicio stage runner
FROM node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js /app
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]
# Fin stage runner
