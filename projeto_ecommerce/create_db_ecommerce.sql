-- criação de banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela clientes
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit VARCHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- criar tabela produtos
CREATE TABLE products (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    review FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- criar tabela pagamentos
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT,
    idPaymentClient INT,
    typePayment ENUM('Boleto', 'Cartão', 'Pix') DEFAULT 'Pix',
    limitAvailable FLOAT,
    CONSTRAINT pk_payments PRIMARY KEY (idPayment, idPaymentClient),
    CONSTRAINT fk_payments_client FOREIGN KEY (idPaymentClient) REFERENCES clients(idClient)
);

-- criar tabela pedidos
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    idOrderPayment INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_clients FOREIGN KEY (idOrderClient) REFERENCES clients(idClient),
    CONSTRAINT fk_orders_payments FOREIGN KEY (idOrderPayment) REFERENCES payments(idPayment)
);

-- criar tabela estoque
CREATE TABLE storage (
    idStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criar tabela fornecedores
CREATE TABLE suppliers (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact VARCHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- criar tabela vendedores
CREATE TABLE sellers (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    abstName VARCHAR(255),
    CNPJ CHAR(15) NOT NULL,
    CPF CHAR(11),
    location VARCHAR(255),
    contact VARCHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- criar tabela produto_vendedor
CREATE TABLE productSeller (
    idSeller INT,
    idProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_productSeller_seller FOREIGN KEY (idSeller) REFERENCES sellers(idSeller),
    CONSTRAINT fk_productSeller_product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

-- criar tabela produto_pedido
CREATE TABLE productOrder (
    idOrder INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idOrder, idProduct),
    CONSTRAINT fk_productOrder_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

-- criar tabela produto_estoque
CREATE TABLE productStorage (
    idStorage INT,
    idProduct INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idStorage, idProduct),
    CONSTRAINT fk_productStorage_storage FOREIGN KEY (idStorage) REFERENCES storage(idStorage),
    CONSTRAINT fk_productStorage_product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);
