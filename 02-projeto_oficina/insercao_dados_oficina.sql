-- inserir clientes
insert into cliente (nome, sobrenome, cpf, telefone, email) values
('joão', 'silva', '111.111.111-11', '99999-1111', 'joao@email.com'),
('maria', 'souza', '222.222.222-22', '99999-2222', 'maria@email.com'),
('carlos', 'lima', '333.333.333-33', '99999-3333', 'carlos@email.com'),
('ana', 'costa', '444.444.444-44', '99999-4444', 'ana@email.com'),
('paulo', 'pereira', '555.555.555-55', '99999-5555', 'paulo@email.com');

-- inserir funcionários
insert into funcionario (nome, sobrenome, cargo, salario) values
('marcos', 'oliveira', 'mecânico', 3500.00),
('roberto', 'dias', 'mecânico', 3200.00),
('fernando', 'alves', 'eletricista', 3000.00),
('juliana', 'santos', 'recepcionista', 2500.00),
('renato', 'barros', 'gerente', 5000.00);

-- inserir veículos
insert into veiculo (id_cliente, marca, modelo, placa, ano) values
(1, 'ford', 'fiesta', 'abc-1234', 2015),
(1, 'renault', 'sandero', 'bcd-2345', 2017),
(2, 'chevrolet', 'onix', 'def-5678', 2020),
(3, 'volkswagen', 'gol', 'ghi-9101', 2012),
(4, 'toyota', 'corolla', 'jkl-1213', 2019),
(5, 'honda', 'civic', 'mno-1415', 2018);

-- inserir serviços
insert into servico (descricao, valor_base) values
('troca de óleo', 100.00),
('alinhamento e balanceamento', 150.00),
('revisão geral', 300.00),
('troca de freios', 200.00),
('diagnóstico eletrônico', 120.00);

-- inserir peças
insert into peca (nome, valor, quantidade_estoque) values
('óleo de motor', 50.00, 20),
('filtro de óleo', 30.00, 15),
('pastilha de freio', 150.00, 8),
('bateria 60ah', 400.00, 5),
('vela de ignição', 40.00, 25);

-- inserir ordens de serviço
insert into ordem_servico (id_cliente, id_veiculo, id_funcionario, data_emissao, status, valor_total) values
(1, 1, 1, '2025-10-01', 'fechada', 250.00),
(1, 2, 2, '2025-10-02', 'em andamento', 180.00),
(2, 3, 3, '2025-10-03', 'aberta', 0.00),
(3, 4, 1, '2025-10-04', 'fechada', 450.00),
(4, 5, 2, '2025-10-05', 'aberta', 0.00);

-- inserir itens de serviço
insert into itens_servico (id_ordem, id_servico, quantidade, valor) values
(1, 1, 1, 100.00),
(1, 4, 1, 150.00),
(2, 5, 1, 180.00),
(3, 3, 1, 300.00),
(4, 2, 1, 150.00);

-- inserir itens de peça
insert into itens_peca (id_ordem, id_peca, quantidade, valor) values
(1, 1, 1, 50.00),
(1, 2, 1, 30.00),
(2, 3, 1, 150.00),
(3, 4, 1, 400.00),
(4, 5, 4, 160.00);
