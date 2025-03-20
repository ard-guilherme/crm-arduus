FROM node:18-alpine

WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm ci --only=production

# Copiar o código da aplicação
COPY . .

# Criar pastas necessárias
RUN mkdir -p uploads

# Expor a porta que a aplicação usa
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["npm", "start"] 