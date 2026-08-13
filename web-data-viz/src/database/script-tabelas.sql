use cryptosight;

create table usuario (
	id int auto_increment primary key,
	nome varchar(45) not null,
	email varchar(45) not null,
	senha varchar(64) not null,
    unique index idUsuario_UNIQUE (id asc) visible,
    unique index email_UNIQUE (email asc) visible
);
select * from usuario;