-- drop database cryptosight;
create database cryptosight;
use cryptosight;

create table empresa(
	id int auto_increment primary key,
    razao_social varchar(60),
    nome_fantasia varchar(50),
    cnpj char(14) unique,
    token char(13) unique
);

create table usuario (
	id int auto_increment primary key,
	nome varchar(50) not null,
    cpf char(11) not null unique,
	email varchar(70) not null unique,
	senha varchar(255) not null,
    id_empresa int not null,
    constraint fk_usuario_empresa foreign key (id_empresa) references empresa(id)
);

create table maquina (
    id int auto_increment primary key,
    modelo varchar(50) not null,
    fabricante varchar(50) not null,
    tipo varchar(20) not null,
    criptomoeda varchar(30) not null,
    algoritmo varchar(30) not null,
    hashrate_teorico decimal(10,2),
    unidade_hashrate varchar(10),
    potencia_nominal int,
    cpu varchar(50),
    ram int,
    armazenamento int,
    gpu varchar(50),
    fonte varchar(50),
    id_empresa int,
    constraint fk_maquina_empresa foreign key (id_empresa) references empresa(id)
);

create table alerta (
    id int AUTO_INCREMENT PRIMARY KEY,
    id_maquina int not null,
    tipo varchar(30) not null,
    descricao varchar(255),
    severidade varchar(20) not null,
    valor_detectado decimal(10,2),
    valor_limite decimal(10,2),
    unidade varchar(10),
    data_hora datetime not null,
    status varchar(20) not null,
    foreign key (id_maquina) references maquina(id)
);
select * from usuario;

insert into empresa (razao_social, nome_fantasia, cnpj, token) values
('cryptosight LTDA', 'CryptoSight', 1234567891011, 'CRY-PTOS-IGHT');