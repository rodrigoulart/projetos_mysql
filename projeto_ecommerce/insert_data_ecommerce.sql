-- inserir clientes (pf e pj)
insert into clients (Fname, Minit, Lname, CPF, Address)
values 
('João', 'A', 'Silva', '12345678901', 'Rua A, 123'),
('Maria', 'B', 'Oliveira', '23456789012', 'Rua B, 456'),
('Pedro', 'C', 'Santos', '34567890123', 'Av. Paulista, 1000'),
('Ana', 'D', 'Souza', '45678901234', 'Rua das Flores, 88'),
('Tech', null, 'Store', '00000000000', 'Av. Central, 500');

-- inserir produtos
insert into products (Pname, classification_kids, category, review, size)
values
('Notebook', false, 'Eletrônico', 4.7, '15'),
('Camiseta', false, 'Vestuário', 4.3, 'M'),
('Carrinho', true, 'Brinquedos', 4.8, 'Único'),
('Mesa', false, 'Móveis', 4.0, '1,20m'),
('Chocolate', false, 'Alimentos', 4.6, '100g');

-- inserir pagamentos
insert into payments (idPaymentClient, typePayment, limitAvailable)
values
(1, 'Cartão', 5000),
(1, 'Pix', 0),
(2, 'Cartão', 1500),
(3, 'Boleto', 0),
(4, 'Cartão', 2000);

-- inser pedidos
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idOrderPayment)
values
(1, 'Confirmado', 'Compra de Notebook', 20, false, 1),
(2, 'Em processamento', 'Compra de 2 Camisetas', 10, true, 3),
(3, 'Confirmado', 'Compra de Carrinho infantil', 15, false, 4),
(4, 'Cancelado', 'Compra de Mesa', 30, false, 5),
(5, 'Em processamento', 'Compra de 20 Chocolates', 25, true, 2);

-- inserir estoques
insert into Storage (storageLocation, quantity)
values
('Centro SP', 100),
('Depósito RJ', 80),
('Galpão MG', 150),
('Filial PR', 70),
('Depósito BA', 90);

-- inserir fornecedores
insert into suppliers (socialName, CNPJ, contact)
values
('Tech Components', '11111111000111', '1144444444'),
('Moda Brasil', '22222222000122', '1155555555'),
('Móveis Ideal', '33333333000133', '1166666666'),
('Doce Sabor', '44444444000144', '1177777777'),
('Brinquedos Feliz', '55555555000155', '1188888888');

-- inserir vendedores
insert into sellers (socialName, abstName, CNPJ, CPF, location, contact)
values
('Comercial Alfa', 'Alfa', '66666666000166', null, 'São Paulo', '1191111111'),
('Comercial Beta', 'Beta', '77777777000177', null, 'Rio de Janeiro', '1192222222'),
('Vendas Express', 'Express', '88888888000188', null, 'Curitiba', '1193333333'),
('Pedro Lima', null, null, '55555555555', 'Belo Horizonte', '1194444444'),
('Ana Souza', null, null, '66666666666', 'Salvador', '1195555555');

-- inserir relação produto x vendedor
insert into productSeller (idSeller, idProduct, quantity)
values
(1, 1, 10),
(1, 4, 5),
(2, 2, 50),
(3, 3, 20),
(4, 5, 100);

-- inserir relação produto x pedido
insert into productOrder (idOrder, idProduct, prodQuantity, poStatus)
values
(1, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 3, 1, 'Disponível'),
(4, 4, 1, 'Sem estoque'),
(5, 5, 20, 'Disponível');

-- inserir relação produto x estoque
insert into productStorage (idStorage, idProduct, location)
values
(1, 1, 'Centro SP'),
(2, 2, 'Depósito RJ'),
(3, 3, 'Galpão MG'),
(4, 4, 'Filial PR'),
(5, 5, 'Depósito BA');
