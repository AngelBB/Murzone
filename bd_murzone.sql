create database if not exists murzone default character set utf8 collate utf8_general_ci;
use murzone;

create table cliente(
	email varchar(50) primary key,
	nombre varchar(50) not null,
	password varchar(64) not null,
	pago enum('paypal','contrareembolso','tarjeta de credito')
);
create table familia_articulo(
	id varchar(10) primary key,
	nombre varchar(100)
);
create table articulo(
	id varchar(10) primary key,
	nombre varchar(100) not null,
	pvp double(6,2) not null,
	familia varchar(10) not null,
	descripcion varchar(1000) not null,
	imagen blob,
	constraint fk_articulo_id_familia foreign key (familia) references familia_articulo(id) on delete cascade on update cascade
);
create table factura(
	id varchar(11) primary key,
	id_cliente varchar(50),
	id_articulo varchar(10),
	fecha date,
	constraint fk_facturas_id_cliente foreign key (id_cliente) references cliente(email) on delete cascade on update cascade,
	constraint fk_facturas_id_articulo foreign key (id_articulo) references articulo(id) on delete cascade on update cascade
);
