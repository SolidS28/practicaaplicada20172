    /*
     * Version de la base de datos: 2.3
     * Compatible con el estándar SQL99
     */

CREATE DATABASE APPEVENTOS;

USE APPEVENTOS;

CREATE TABLE CIUDAD(
	ID_CIUDAD SMALLINT(2) NOT NULL PRIMARY KEY,
	CIUDAD VARCHAR(30) NOT NULL
);


CREATE TABLE FACULTAD (
	ID_FACULTAD SMALLINT NOT NULL PRIMARY KEY,
	NOMBRE_FACULTAD VARCHAR(30) NOT NULL
);


CREATE TABLE SEDE (
	ID_SEDE SMALLINT NOT NULL PRIMARY KEY,
	NOMBRE_SEDE VARCHAR(30) NOT NULL,
	DIRECCION VARCHAR(50) NOT NULL,
	CIUDAD SMALLINT(2) NOT NULL,
	CONSTRAINT SEDES_CIUDADES FOREIGN KEY (CIUDAD) REFERENCES CIUDADES(ID)
);


CREATE TABLE TIPO_USUARIO (
	ID_TIPO_USUARIO SMALLINT NOT NULL PRIMARY KEY,
	TIPO_USUARIO VARCHAR(15) NOT NULL
);


CREATE TABLE USUARIO (
	ID_USUARIO VARCHAR(15) NOT NULL PRIMARY KEY,
	NOMBRE1 VARCHAR(25) NOT NULL,
	NOMBRE2 VARCHAR(25),
	APELLIDO1 VARCHAR(25) NOT NULL,
	APELLIDO2 VARCHAR(25),
	CORREO VARCHAR(50) NOT NULL,
	FECHA_NACIMIENTO DATE NOT NULL,
	SEXO BOOL NOT NULL,
	CIUDAD SMALLINT(2) NOT NULL,
	FOTO VARCHAR(300) NOT NULL,
	TIPO_USUARIO SMALLINT NOT NULL,
	CONSTRAINT USUARIOS_TIPOSUSUARIOS FOREIGN KEY (TIPO_USUARIO) REFERENCES TIPOS_USUARIOS(ID),
	CONSTRAINT USUARIOS_CIUDADES FOREIGN KEY (CIUDAD) REFERENCES CIUDADES(ID)
);


CREATE TABLE EVENTO(
	ID_EVENTO SMALLINT NOT NULL PRIMARY KEY,
	NOMBRE_EVENTO VARCHAR(30) NOT NULL,
	FECHA DATETIME NOT NULL,
	IMAGEN VARCHAR(300),
	RESUMEN VARCHAR(50) NOT NULL,
	DESCRIPCION VARCHAR(250) NOT NULL,
	CATEGORIA VARCHAR(25) NOT NULL,
	SEDE SMALLINT NOT NULL,
	LUGAR VARCHAR(25) NOT NULL,
	CUPOS SMALLINT(3),
	DURACION_HORAS DECIMAL(2,1) NOT NULL,
	FACULTAD SMALLINT NOT NULL,
	CREDITOS SMALLINT(2),
	CONSTRAINT EVENTOS_SEDES FOREIGN KEY (SEDE) REFERENCES SEDES(ID),
	CONSTRAINT EVENTOS_FACULTAD FOREIGN KEY (FACULTAD) REFERENCES FACULTADES(ID)
);

CREATE TABLE SERIE (
	ID_SERIE SMALLINT NOT NULL,
	ID_EVENTO SMALLINT NOT NULL,
	CONSTRAINT PK_SERIES PRIMARY KEY (ID, ID_EVENTO),
	CONSTRAINT SERIES_EVENTOS FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID)
);

CREATE TABLE EVENTO_USUARIO (
	ID_EVENTO_USUARIO SMALLINT NOT NULL;
	ID_USUARIO VARCHAR(15) NOT NULL,
	ID_EVENTO SMALLINT NOT NULL,
	ASISTIDO BOOL,
	ROL_EVENTO VARCHAR(50) NOT NULL,
	MARCA BOOL NOT NULL,
	CONSTRAINT PK_EVENTOS_USUARIOS PRIMARY KEY (ID_EVENTOS_USUARIOS, ID_USUARIO, ID_EVENTO),
	CONSTRAINT EVENTOS_USUARIOS_USUARIOS FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
	CONSTRAINT EVENTOS_USUARIOS_EVENTOS FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS (ID)
);


CREATE TABLE SESION (
	ID_SESION SMALLINT NOT NULL PRIMARY KEY,
	USUARIO VARCHAR(25) NOT NULL,
	DISPOSITIVO VARCHAR(300) NOT NULL,
	CONSTRAINT SESIONES_USUARIOS FOREIGN KEY (USUARIO) REFERENCES USUARIOS (ID)
);

CREATE TABLE LOG (
	ID_LOG SMALLINT NOT NULL PRIMARY KEY,
	ID_USUARIO VARCHAR(25) NOT NULL,
	FECHA DATETIME NOT NULL,
	CATEGORIA VARCHAR(30) NOT NULL,
	DESCRIPCION VARCHAR(50) NOT NULL
);