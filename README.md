# CRM NodeJS

Um sistema completo de CRM (Customer Relationship Management) desenvolvido em NodeJS, Express e MongoDB.

## Características

- 🔐 Autenticação e autorização de usuários
- 👥 Gerenciamento de clientes e leads
- 💼 Gestão de oportunidades e vendas
- 📊 Dashboard e relatórios
- 📅 Calendário e tarefas
- 📧 Envio de emails
- 🔔 Sistema de notificações em tempo real
- 📄 Geração de documentos PDF
- 📱 API RESTful para integração com aplicativos móveis

## Estrutura do Projeto

```
crm-nodejs/
├── src/
│   ├── config/           # Configurações
│   ├── controllers/      # Controladores
│   ├── database/         # Conexão e seeders
│   ├── middleware/       # Middlewares
│   ├── models/           # Modelos/Schemas
│   ├── routes/           # Rotas
│   ├── services/         # Serviços/Lógica de negócio
│   ├── utils/            # Utilitários
│   ├── views/            # Templates
│   └── server.js         # Ponto de entrada
├── uploads/              # Arquivos enviados
├── .env                  # Variáveis de ambiente
├── Dockerfile            # Configuração do container para implantação
├── cloudbuild.yaml       # Configuração do Cloud Build para CI/CD
└── package.json          # Dependências
```

## Modelos de Dados

### Usuários
- Gerenciamento de usuários do sistema
- Controle de acesso baseado em funções (admin, gerente, vendas, etc.)

### Clientes
- Informações de contato
- Histórico de interações
- Documentos
- Segmentação

### Leads
- Captura e qualificação
- Conversão para clientes
- Acompanhamento e priorização

### Oportunidades
- Pipeline de vendas
- Previsão de receita
- Taxa de conversão

### Produtos
- Catálogo de produtos/serviços
- Precificação
- Estoque

### Vendas
- Pedidos e faturamento
- Pagamentos e parcelamento
- Entrega

### Tarefas
- Gerenciamento de atividades
- Atribuição
- Lembretes

### Interações
- Registro de contatos com clientes
- Histórico de comunicações
- Anotações e follow-ups

## Instalação e Configuração Local

1. Clone o repositório
   ```bash
   git clone https://github.com/ard-guilherme/crm-arduus.git
   cd crm-arduus
   ```

2. Instale as dependências
   ```bash
   npm install
   ```

3. Configure as variáveis de ambiente
   ```bash
   cp .env.example .env
   # Edite o arquivo .env com suas configurações
   ```

4. Inicie o banco de dados MongoDB
   ```bash
   # Certifique-se de que o MongoDB está instalado e em execução
   ```

5. Execute o seed do banco de dados (opcional)
   ```bash
   npm run seed
   ```

6. Inicie o servidor
   ```bash
   npm run dev
   ```

## Deploy

Este projeto está configurado para deploy contínuo no Google Cloud Run através da integração com GitHub:

1. Qualquer push para a branch main aciona automaticamente um novo build e deploy
2. A implantação é gerenciada pelo Cloud Build usando o arquivo `cloudbuild.yaml`
3. O serviço está disponível em: https://crm.arduus.tech

Para mais detalhes sobre o processo de deploy, consulte o arquivo [GITHUB_DEPLOY.md](GITHUB_DEPLOY.md).

## Uso

Após iniciar o servidor, acesse:

```
http://localhost:5000
```

Ou, em produção:

```
https://crm.arduus.tech
```

## Licença

Este projeto está licenciado sob a licença MIT - consulte o arquivo LICENSE para obter detalhes.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.