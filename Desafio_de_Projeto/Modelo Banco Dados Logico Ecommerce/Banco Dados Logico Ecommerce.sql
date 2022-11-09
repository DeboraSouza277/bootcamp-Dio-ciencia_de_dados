-- Criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- Criar tabela cliente
create table Cliente(
		idCliente int auto_increment primary key,
        Fname varchar(15),
        Lname varchar(20),
        CPF Char(11) not null,
		Address varchar(30),
        City varchar(50), 
        Telefone varchar(50), 
        constraint unique_cpf_client unique(CPF)
);

-- Criar tabela produto

create table Produto(
		idProduto int auto_increment primary key,
        Pnome varchar(20) not null,
        Categoria enum('Eletronico', 'Vestimenta', 'Moveis', 'Brinquedo') not null,
        Descrição  varchar(45),
        Size varchar(20)
);

-- criar tabela pedido 
create table Pedido(
        idPedido int auto_increment primary key,
        idPedidoCliente int,
        PedidoStatus enum('Cancelado', 'Em processamento', 'Confirmado', 'Entregue') default 'Em processamento',
        PedidoDescrição  varchar(300),
        TipoPagamento bool default 10,
		constraint fk_Pedido_Cliente foreign key (idPedido) references Client (idCliente)
        );

-- criar  pagamento 

create table Pagamento(
		IdPagamento int,
        IdPedido int,
        ValorPedido varchar(45),
        TipoPagamento enum('Boleto','Cartao','Dois Cartões'),
        StatusPagamento enum('Aprovado', 'Recusado', 'Em processamento') not null,
        constraint fk_Pagamento foreign key (idPagamento) references Pedido(idPedido)
        );
        
-- criar tabela estoque
create table Estoque(
IdEstoque int auto_increment primary key,
Localização varchar (45),
Quantidade int default 0
);

-- criar tabelea fornecedor
create table Supplier(
IdFornecedor int auto_increment primary key,
Localização varchar (45),
RazãoSocial varchar (45) not null,
NomeFantasia varchar (45),
CNPJ char (14) not null,
Contato char (11) not null,
constraint unique_supplier unique(CNPJ)
);

-- criar tabela vendedor
create table Seller(
IdVendedor int auto_increment primary key,
Localização varchar (45),
RazãoSocial varchar (45) not null,
NomeFantasia varchar (45),
CNPJ char (14),
CPF char (11),
Contato char (11) not null,
constraint unique_CNPJ_Seller unique(CNPJ),
constraint unique_CPF_Seller unique(CPF)
);
-- criar tabela Produtos por vendedor
create table ProductSeller(
IdProduto int,
IdVendedor int,
IdProdutoVendedor int,
Quantidade int default 1,
primary key (IdProduto, IdProdutoVendedor),
constraint fk_produto_vendedor foreign key (IdProdutoVendedor) references Seller (IdVendedor),
constraint fk_produto_produto foreign  key (idProduto) references Product (IdProduto)
);

-- criar tabela produto por pedido
create table ProductRequest(
IdProduto int,
IdPedido int,
IdVendedor int,
IdProdutoVendedor int,
Quantidade int default 1,
StatusProduto enum('Disponivel','Sem Estoque') default 'Disponivel',
primary key (IdProdutoVendedor, IdPedido),
constraint fk_pedido_vendedor foreign key (IdProdutoVendedor) references Seller (IdVendedor),
constraint fk_pedido_produto foreign  key (idPedido) references Request (IdPedido)
);

 -- criar tabela produto estoque
create table ProdutoEstoque (
IdProduto int,
IdEstoque int,
Localização varchar (100) not null,
primary key (IdProduto, IdEstoque),
constraint fk_estoque_vendedor foreign key (IdProduto) references Product (IdProduto),
constraint fk_estoque_produto foreign  key (idEstoque) references Request (IdPedido)
);

-- criar tabela produtos por fornecedor
create table ProductSupplier(
IdProduto int,
IdProdutoFornecedor int,
Quantidade int default 1,
primary key (IdProduto, IdProdutoFornecedor),
constraint fk_fornecerdor_vendedor foreign key (IdProdutoFornecedor) references Supplier (IdFornecedor),
constraint fk_fornecerdor_produto foreign  key (idProduto) references Product (IdProduto)
);

show tables;

        
        
        