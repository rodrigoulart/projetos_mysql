-- criação de banco de dados para o cenário de Oficina Mecânica
create database oficina;
use oficina;

-- criar tabela de clientes
create table cliente (
    id_cliente int auto_increment primary key,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    cpf varchar(14) unique not null,
    telefone varchar(20),
    email varchar(100)
);

-- criar tabela de funcionários
create table funcionario (
    id_funcionario int auto_increment primary key,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    cargo varchar(50),
    salario decimal(10,2)
);

-- criar tabela de veículos
create table veiculo (
    id_veiculo int auto_increment primary key,
    id_cliente int not null,
    marca varchar(50),
    modelo varchar(50),
    placa varchar(10) unique,
    ano int,
    foreign key (id_cliente) references cliente(id_cliente)
);

-- criar tabela de serviços
create table servico (
    id_servico int auto_increment primary key,
    descricao varchar(100),
    valor_base decimal(10,2)
);

-- criar tabela de peças
create table peca (
    id_peca int auto_increment primary key,
    nome varchar(50),
    valor decimal(10,2),
    quantidade_estoque int
);

-- criar tabela de ordens de serviço
create table ordem_servico (
    id_ordem int auto_increment primary key,
    id_cliente int not null,
    id_veiculo int not null,
    id_funcionario int not null,
    data_emissao date,
    status enum('aberta', 'em andamento', 'fechada', 'cancelada') default 'aberta',
    valor_total decimal(10,2),
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_veiculo) references veiculo(id_veiculo),
    foreign key (id_funcionario) references funcionario(id_funcionario)
);

-- criar tabela de itens de serviço
create table itens_servico (
    id_item int auto_increment primary key,
    id_ordem int not null,
    id_servico int not null,
    quantidade int,
    valor decimal(10,2),
    foreign key (id_ordem) references ordem_servico(id_ordem),
    foreign key (id_servico) references servico(id_servico)
);

-- criar tabela de itens de peça
create table itens_peca (
    id_item int auto_increment primary key,
    id_ordem int not null,
    id_peca int not null,
    quantidade int,
    valor decimal(10,2),
    foreign key (id_ordem) references ordem_servico(id_ordem),
    foreign key (id_peca) references peca(id_peca)
);
