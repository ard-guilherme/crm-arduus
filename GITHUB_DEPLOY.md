# Deploy do CRM Arduus via GitHub no Google Cloud Run

Este guia explica como fazer o deploy do CRM Arduus no Google Cloud Run utilizando integração contínua com GitHub.

## Pré-requisitos

1. Conta no GitHub
2. Conta no Google Cloud Platform (GCP)
3. Projeto GCP configurado

## Passos para Deploy

### 1. Repositório GitHub

O código está disponível no repositório: https://github.com/ard-guilherme/crm-arduus

### 2. Configurar o Cloud Run com Integração GitHub

1. Acesse o console do Google Cloud: https://console.cloud.google.com/
2. Navegue até Cloud Run: https://console.cloud.google.com/run
3. Clique em "CRIAR SERVIÇO"
4. Selecione "Implantar continuamente a partir de um repositório de origem"
5. Clique em "CONFIGURAR COM CLOUD BUILD"
6. Selecione "GitHub" como provedor
7. Autorize o Google Cloud a acessar seu GitHub (se necessário)
8. Selecione o repositório `ard-guilherme/crm-arduus`
9. Configure o build:
   - Branch: `main`
   - Arquivo de configuração: `cloudbuild.yaml`
   - Diretório de origem: `/` (raiz)

### 3. Configurar o Serviço

1. Nome do serviço: `crm-arduus`
2. Região: `southamerica-east1`
3. Configurações de CPU e memória:
   - Memória alocada: 512 MiB
   - CPUs: 1

### 4. Configurar Variáveis de Ambiente

As seguintes variáveis de ambiente são necessárias:

```
NODE_ENV=production
PORT=8080
MONGO_URI=mongodb+srv://arduus:2XFx7SZqWcunVgnj@cluster0.bgbirpu.mongodb.net/?retryWrites=true&w=majority
JWT_SECRET=c93a28aed6bfca9cb4e5fe719d9e65d8b2478347a6f5a91856a3f28ad246e933
JWT_EXPIRES_IN=30d
UPLOAD_PATH=./uploads
```

Para adicioná-las:
1. No console do Cloud Run, vá até "Variáveis e segredos"
2. Adicione cada uma como variável de ambiente

### 5. Configurar Acesso Público

1. Em "Autenticação", selecione "Permitir invocações não autenticadas"

### 6. Implantar o Serviço

1. Clique em "CRIAR" ou "IMPLANTAR"
2. O serviço será implantado automaticamente a partir do repositório GitHub

### 7. Configurar o Domínio Personalizado

1. Depois que o serviço estiver implantado, clique no nome do serviço
2. Navegue até a aba "Domínios"
3. Clique em "ADICIONAR MAPEAMENTO"
4. Selecione "Verificar um novo domínio" ou "Usar um domínio já verificado"
5. Digite "crm.arduus.tech" como o domínio
6. Siga as instruções para verificar a propriedade do domínio (se necessário)
7. Clique em "CONTINUAR" e depois em "ADICIONAR MAPEAMENTO"

### 8. Configurar o DNS

Adicione um registro CNAME no seu provedor de DNS:
- Nome: `crm`
- Destino: `ghs.googlehosted.com.`
- TTL: 3600 (ou o recomendado pelo seu provedor)

## Atualizações e Manutenção

Para atualizar o serviço, simplesmente faça push das alterações para o repositório GitHub:

```bash
git add .
git commit -m "Descrição da atualização"
git push origin main
```

O Cloud Build automaticamente detectará as mudanças e reimplantará o serviço. 