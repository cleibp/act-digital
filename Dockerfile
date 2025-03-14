# Usa a imagem oficial do Node.js como base
FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o package.json e package-lock.json para instalar dependências
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia todo o código para dentro do contêiner
COPY . .

# Compila o código TypeScript
RUN npm run build

# Expõe a porta padrão do NestJS
EXPOSE 3000

# Define o comando para iniciar a aplicação
CMD ["npm", "run", "start"]