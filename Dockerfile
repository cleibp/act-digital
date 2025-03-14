# Usa a imagem oficial do Node.js como base
FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia apenas os arquivos essenciais para instalar dependências primeiro
COPY package*.json ./

# Instala as dependências antes de copiar o restante do código
RUN npm install

# Copia o restante do projeto
COPY . .

# Copia o .env.sample para .env caso o .env não exista
RUN test -f .env || cp .env.sample .env

# Compila o código TypeScript
RUN npm run build

# Expõe a porta padrão do NestJS
EXPOSE 3000

# Define o comando para iniciar a aplicação
CMD ["npm", "run", "start"]
