create database clinicas;

use clinicas;

create table sala(
	num_sala int unique not null,
    check (num_sala > 1 and num_sala < 50),
    andar int unique not null,
    check (andar < 12),
    primary key (num_sala, andar)
);

create table medicos(
	pk_CRM char(15) primary key,
    check (pk_CRM > 1 and pk_CRM < 50),
    nome varchar(40) not null,
    idade int 
    check (idade > 23),
    especialidade char(20) not null default 'ortopedia',
	CPF varchar (15) unique not null,
    data_adimissao date
);

create table pacientes(
	pk_RG char(15) primary key,
    nome varchar (40),
    data_nacimento date,
    cidade char (30) default"Itabuna",
    doenca varchar (40) not null,
    plano_saude varchar (40) not null default "SUS"
);

create table funcionarios(
matricula varchar(15) primary key,
nome varchar(40) not null,
data_nascimento date not null,
data_adimissao date not null,
cargo varchar (40) not null default "Assistente Médico", 
salario float not null default 510.00
);

create table consultas(
codigo_consulta int primary key,
data_horario datetime,
fk_CRM char(15),
fk_RG char(9),
fk_sala int,
fk_andar int,
foreign key(fk_CRM) references medicos(pk_CRM),
foreign key(fk_RG) references pacientes(pk_RG),
foreign key(fk_sala, fk_andar) references sala(num_sala, andar)
);