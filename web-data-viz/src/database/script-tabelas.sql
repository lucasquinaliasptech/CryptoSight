-- drop database cryptosight;
create database cryptosight;
use cryptosight;

create table empresa(
	id int auto_increment primary key,
    razao_social varchar(60),
    telefone char(11),
   	email varchar(70) not null unique,
    nome_fantasia varchar(50),
    cnpj char(14) unique
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
    id_empresa int,
    constraint fk_maquina_empresa foreign key (id_empresa) references empresa(id)
);

create table componente(
	id int auto_increment primary key,
	cpu varchar(50),
    ram int,
    armazenamento int,
    gpu varchar(50),
    fonte varchar(50)
);

create table maquina_componetes(
	id int auto_increment primary key,
    id_maquina int,
    id_componente int,
     constraint fk_mc_maquina foreign key (id_maquina) references maquina(id),
     constraint fk_mc_componente foreign key (id_componente) references componente(id)
    );



create table alerta (
    id int auto_increment primary key,
    id_mc int not null,
    descricao varchar(255),
    severidade varchar(20) not null,
    valor_detectado decimal(10,2),
    data_hora datetime not null,
    status varchar(20) not null,
    foreign key (id_maquina) references maquina(id)
);
select * from usuario;

insert into empresa (razao_social, telefone, email, nome_fantasia, cnpj) values
('cryptosight LTDA','11987654321', 'crypto@sight.com' ,'CryptoSight', 1234567891011);