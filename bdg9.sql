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
drop table if exists rol;

create table usuario(
    usuId int,
    usuNom varchar(40), 
    usuApe varchar(40),
    usuEmail varchar(60),
    usuPass varchar(20),
    usuRol int );

create table rol(
    rolId serial,
    rolNom varchar(40), 
    rolDes varchar(40));

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
   
ALTER TABLE usuario ADD CONSTRAINT PK_usu PRIMARY KEY (usuId);
ALTER TABLE rol ADD CONSTRAINT PK_rol PRIMARY KEY (rolId);
ALTER TABLE departamento ADD CONSTRAINT PK_dep PRIMARY KEY (depId);
ALTER TABLE ciudad ADD CONSTRAINT PK_ciu PRIMARY KEY (ciuId);
ALTER TABLE oficina ADD CONSTRAINT PK_ofi PRIMARY KEY (ofiId);
ALTER TABLE tipoTrx ADD CONSTRAINT PK_tip PRIMARY KEY (tipId);
ALTER TABLE respuesta ADD CONSTRAINT PK_res PRIMARY KEY (resId);
ALTER TABLE transaccion ADD CONSTRAINT PK_tra PRIMARY KEY (traId);
ALTER TABLE dependencia ADD CONSTRAINT PK_dpe PRIMARY KEY (dpeId);
ALTER TABLE categoria ADD CONSTRAINT PK_cat PRIMARY KEY (catId);
ALTER TABLE alerta ADD CONSTRAINT PK_ale PRIMARY KEY (aleId);
ALTER TABLE alextra ADD CONSTRAINT PK_axt PRIMARY KEY (axtTra, axtale);

ALTER TABLE usuario ADD CONSTRAINT FK_usurol FOREIGN KEY (usuRol) REFERENCES rol (rolid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ciudad ADD CONSTRAINT FK_ciudep FOREIGN KEY (ciuDep) REFERENCES departamento (depid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE oficina ADD CONSTRAINT FK_oficiu FOREIGN KEY (oficiu) REFERENCES ciudad (ciuid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE transaccion ADD CONSTRAINT FK_traofiori FOREIGN KEY (traofiori) REFERENCES oficina (ofiid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE transaccion ADD CONSTRAINT FK_traofides FOREIGN KEY (traofides) REFERENCES oficina (ofiid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE transaccion ADD CONSTRAINT FK_tratip FOREIGN KEY (tratip) REFERENCES tipotrx (tipid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE transaccion ADD CONSTRAINT FK_trares FOREIGN KEY (trares) REFERENCES respuesta (resid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE alerta ADD CONSTRAINT FK_aledpe FOREIGN KEY (aledpe) REFERENCES dependencia (dpeid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE alerta ADD CONSTRAINT FK_alecat FOREIGN KEY (alecat) REFERENCES categoria (catid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE alextra ADD CONSTRAINT FK_axttra FOREIGN KEY (axttra) REFERENCES transaccion (traid) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE alextra ADD CONSTRAINT FK_axtale FOREIGN KEY (axtale) REFERENCES alerta (aleid) ON UPDATE CASCADE ON DELETE RESTRICT;
