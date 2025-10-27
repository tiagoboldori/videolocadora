# Catálogo de Filmes - Ruby on Rails

Este projeto é um catálogo de filmes desenvolvido em **Ruby on Rails 8.1**, com autenticação de usuários, upload de capas, comentários e associação de filmes a gêneros.

---

## Funcionalidades

- **Autenticação de usuários**: Cadastro e login/logout de usuários.
- **CRUD de filmes**: Criar, visualizar, editar e deletar filmes.
- **Campos dos filmes**: Título, sinopse, diretor, data de lançamento, duração e imagem de capa.
- **Associação de filmes a gêneros**: Um filme pode ter vários gêneros, e um gênero pode estar presente em vários filmes (relação N:N).
- **Comentários de usuários**: Usuários autenticados podem comentar em filmes.
- **Controle de permissões**: Apenas o usuário que postou o filme ou comentário pode editá-lo ou deletá-lo.
- **Busca por filmes**: É possível filtrar filmes por título, diretor e data de postagem.
- **Paginação**: Listagem de filmes paginada.
- **Upload de imagens (Active Storage)**: Upload de capas para filmes.

---

## Pré-requisitos

- Ruby >= 3.2  
- Rails >= 8.1  
- PostgreSQL  
- Node.js e Yarn (para assets, se necessário)  

---

## Configuração do projeto localmente

1. **Clone o repositório**

```bash
git clone https://github.com/tiagoboldori/videolocadora.git
cd videolocadora
```
Instale as gems
```bash
bundle install
```
Configure o banco de dados usando um arquivo de variavel local .env
```bash
POSTGRES_USER=seu_usuario
POSTGRES_PASSWORD=sua_senha
POSTGRES_DB=nome_do_banco
```
Migrations
```bash
bin/rails db:create
bin/rails db:migrate
```
E por fim rode:
```bash
bin/rails server
```
Mais informações sobre a aplicação:
https://excalidraw.com/#json=FTr0R6-CaAfYS7l6iLdlm,YqtAgs5ftgiFUjjehtc9Og
