# Repositório de Projetos de Banco de Dados

Este repositório contém projetos desenvolvidos em **MySQL** durante o **Curso de Análise de Dados da DIO**, realizado em parceria com a **Klabin**.  
Ele inclui tanto projetos de **e-commerce** quanto de **oficina**, contemplando criação de banco de dados, inserção de dados, diagramas EER e consultas SQL.

---

## Estrutura do Repositório
```
projetos_mysql
├── 01-projeto_ecommerce/
|   ├── create_db_ecommerce.sql    # Script para criar o banco e tabelas do e-commerce
|   ├── eer_diagram_ecommerce.mwb  # Diagrama EER editável no MySQL Workbench
|   |── eer_diagram_ecommerce.png  # Imagem do diagrama EER
|   ├── insert_data_ecommerce.sql  # Script para popular o banco com dados de exemplo
|   └──  queries_ecommerce.sql      # Consultas SQL para análise e testes
|
|   02-projeto_oficina/
|   ├── consultas_oficina.sql      # Consultas SQL para análise e testes
|   ├── criacao_bd_oficina.sql     # Script para criar o banco e tabelas da oficin
|   ├── diagrama_eer_oficina.mwb   # Diagrama EER editável no MySQL Workbench
|   ├── diagrama_eer_oficina.png   # Imagem do diagrama EER
|   └── insercao_dados_oficina.sql # Script para popular o banco com dados de exemplo
└── README.md
```

---

## Tecnologias Utilizadas

- **MySQL / MariaDB**: gerenciamento de banco de dados relacional  
- **MySQL Workbench**: modelagem de dados (EER) e geração de scripts SQL  
- **SQL**: criação de tabelas, inserção de dados, consultas e relatórios

---

## Descrição dos Projetos

### 1. Projeto E-commerce
- Modelo de banco de dados para loja virtual.  
- Inclui tabelas de **clientes, produtos, pedidos e itens de pedido**.  
- Scripts para **criação do banco**, **inserção de dados** e **consultas**.  
- Diagrama EER completo com relações e constraints.

### 2. Projeto Oficina
- Modelo de banco de dados para oficina mecânica.  
- Inclui tabelas de **clientes, veículos, funcionários, peças, serviços e ordens de serviço**.  
- Scripts para **criação do banco**, **inserção de dados** e **consultas avançadas** (joins, agregações, case statements).  
- Diagrama EER completo, incluindo relações identificadoras e não-identificadoras, e uso de **ENUM para status**.

- ---

## Créditos

Desafio proposto pela **[Digital Innovation One (DIO)](https://www.dio.me/)** em parceria com a **Klabin**.  
Projeto desenvolvido por **Rodrigo Moraes**.


