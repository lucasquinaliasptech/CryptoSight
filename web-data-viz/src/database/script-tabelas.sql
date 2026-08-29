-- drop database cryptosight;
create database cryptosight;
use cryptosight;

create table uf(
	id int auto_increment primary key,
    nome varchar(40),
    sigla char(2)
);

create table endereco(
	id int auto_increment primary key,
    cep char(8),
    id_uf int,
    cidade varchar(50),
    bairro varchar(50),
    logradouro varchar(50),
    numero varchar(10),
    complemento varchar(30),
    sede bit not null,
    constraint fk_endereco_uf foreign key (id_uf) references uf(id)
);

create table empresa(
	id int auto_increment primary key,
    razao_social varchar(60),
    telefone char(11),
   	email varchar(70) not null unique,
    nome_fantasia varchar(50),
    cnpj char(14) unique,
    id_endereco int,
    constraint fk_empresa_endereco foreign key(id_endereco) references endereco(id)
);

create table farm(
	id int auto_increment primary key,
    nome varchar(50),
    id_empresa int,
    id_endereco int,
	constraint fk_farm_empresa foreign key (id_empresa) references empresa(id),
    constraint fk_farm_endereco foreign key(id_endereco) references endereco(id)
);

create table usuario (
	id int auto_increment primary key,
	nome varchar(50) not null,
    cargo varchar(30),
    cpf char(11) not null unique,
	email varchar(70) not null unique,
	senha varchar(255) not null,
    id_empresa int not null,
    constraint fk_usuario_empresa foreign key (id_empresa) references empresa(id)
);

create table maquina (
    id int auto_increment primary key,
    mac_adress char(17) not null unique,
    modelo varchar(50) not null,
    fabricante varchar(50) not null,
    tipo varchar(20) not null,
    criptomoeda varchar(30) not null,
    id_farm int,
    constraint fk_maquina_farm foreign key (id_farm) references farm(id)
);

create table componente(
	id int auto_increment primary key,
	compontente varchar(30),
    medida varchar(30)
);

create table maquina_componente(
	id int auto_increment primary key,
    id_maquina int,
    id_componente int,
    limite double,
    monitorado bit,
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
    constraint fk_alerta_mc foreign key (id_mc) references maquina_componente
    (id)
);
select * from usuario;

INSERT INTO uf (nome, sigla) VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amapá', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Santa Catarina', 'SC'),
('São Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');

insert into empresa (razao_social, telefone, email, nome_fantasia, cnpj) values
('cryptosight LTDA','11987654321', 'crypto@sight.com' ,'CryptoSight', 1234567891011);