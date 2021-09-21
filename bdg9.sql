drop table if exists alextra;
drop table if exists transaccion;
drop table if exists alerta;
drop table if exists oficina;
drop table if exists ciudad;
drop table if exists usuario;
drop table if exists departamento;
drop table if exists tipotrx;
drop table if exists respuesta;
drop table if exists categoria;
drop table if exists dependencia;

create table usuario(
    usuId int,
    usuNom varchar(40), 
    usuApe varchar(40),
    usuEmail varchar(60),
    usuPass varchar(20) );

Create table departamento(
    depId int,
    depNom varchar(40));

Create table ciudad(
    ciuId int,
    ciuNom varchar(40),
    ciuDep int );

create table oficina(
    ofiId varchar(20),
    ofiNom varchar(60),
    ofiCiu int );

create table tipoTrx(
    tipId int,
    tipNom varchar(20) );    

create table respuesta(
    resId int,
    resNom varchar(20) );        

create table transaccion(
    traMarcaReq timestamp null,
    traMarcaRes timestamp null,	
    traOfiOri varchar(20) null,
    traOfiDes varchar(20) null,
	traRef int null,
    traRes int null,	
    traTip int null,
	traId serial 
    );

create table dependencia(
    dpeId int,
    dpeNom varchar(20) );

create table categoria(
    catId int,
    catNom varchar(20) );

create table alerta(
    aleId serial, 
    aleNivel int,
    aleDpe int,
    aleCat int );

create table alextra(
    axttra int,
    axtale int );