CREATE TABLE CAMPOS (id_campo BIGINT NOT NULL, nombre VARCHAR(30) NOT NULL, tam INTEGER NOT NULL, tipo VARCHAR(100) NOT NULL, PRIMARY KEY (id_campo))
CREATE TABLE COMENTARIO (id_comentario BIGINT NOT NULL, TEXTO VARCHAR(255) NOT NULL, FECHA DATE, EVENTO_id_evento BIGINT, SOCIO_id_Usuario BIGINT, PRIMARY KEY (id_comentario))
CREATE TABLE CUOTA (ID BIGINT NOT NULL, DESCRIPCION VARCHAR(255) NOT NULL, IMPORTE INTEGER NOT NULL, NOMBRE VARCHAR(255) NOT NULL, PRIMARY KEY (ID))
CREATE TABLE DOCUMENTO (id_documento BIGINT NOT NULL, enlace VARCHAR(100) NOT NULL, ESTADO VARCHAR(255), FECHA DATE, nombre VARCHAR(30) NOT NULL, tipo VARCHAR(40) NOT NULL, DOC_PLANTILLA_id_doc_plantilla BIGINT, SOCIO_id_Usuario BIGINT, PRIMARY KEY (id_documento))
CREATE TABLE DOCUMENTO_PLANTILLA (id_doc_plantilla BIGINT NOT NULL, nombre VARCHAR(30) NOT NULL, PRIMARY KEY (id_doc_plantilla))
CREATE TABLE ENTRADA_CALENDARIO (id_entrada_calendario BIGINT NOT NULL, Categoría VARCHAR(50) NOT NULL, Descripción VARCHAR(200) NOT NULL, FECHA DATE, SOCIO_id_Usuario BIGINT, PRIMARY KEY (id_entrada_calendario))
CREATE TABLE EVENTO (id_evento BIGINT NOT NULL, DESCRIPCION VARCHAR(255) NOT NULL, FECHA DATE NOT NULL, LOCALIZACION VARCHAR(255) NOT NULL, NOMBRE VARCHAR(255) NOT NULL, PRECIO FLOAT NOT NULL, SECCION_id_seccion BIGINT, PRIMARY KEY (id_evento))
CREATE TABLE LINEA_PRESUPUESTO_EVENTO (linea BIGINT NOT NULL, cantidad INTEGER NOT NULL, concepto VARCHAR(100) NOT NULL, precio BIGINT NOT NULL, PRESUPUESTO_EVENTO_id_presupuesto BIGINT, PRIMARY KEY (linea))
CREATE TABLE NOTIFICACION_DOCUMENTO (id_not_documento BIGINT NOT NULL, Estado VARCHAR(10) NOT NULL, DOCUMENTO_id_documento BIGINT, SOCIO_id_Usuario BIGINT, PRIMARY KEY (id_not_documento))
CREATE TABLE NOTIFICACION_EVENTO (id_not_evento BIGINT NOT NULL, ESTADO VARCHAR(255) NOT NULL, FECHANOTIFICACION DATE NOT NULL, EVENTO_id_evento BIGINT, SOCIO_id_Usuario BIGINT, PRIMARY KEY (id_not_evento))
CREATE TABLE PAGO_CUOTA (ID BIGINT NOT NULL, FECHA DATE NOT NULL, IMPORTE INTEGER NOT NULL, CUOTA_ID BIGINT, SOCIO_id_Usuario BIGINT, PRIMARY KEY (ID))
CREATE TABLE PAGO_EVENTO (ID BIGINT NOT NULL, categoria VARCHAR(30) NOT NULL, importe INTEGER NOT NULL, EVENTO_id_evento BIGINT, SOCIO_id_Usuario BIGINT, PRIMARY KEY (ID))
CREATE TABLE PRESUPUESTO_EVENTO (id_presupuesto BIGINT NOT NULL, FECHA DATE, importe_total INTEGER NOT NULL, EVENTO_id_evento BIGINT, PRIMARY KEY (id_presupuesto))
CREATE TABLE SECCION (id_seccion BIGINT NOT NULL, DESCRIPCION VARCHAR(255) NOT NULL, EDAD_MAX INTEGER NOT NULL, EDAD_MIN INTEGER NOT NULL, NOMBRE VARCHAR(255) NOT NULL, PRIMARY KEY (id_seccion))
CREATE TABLE USUARIO (id_Usuario BIGINT NOT NULL, DTYPE VARCHAR(31), email VARCHAR(50) NOT NULL, pass VARCHAR(50) NOT NULL, PRIMARY KEY (id_Usuario))
CREATE TABLE SOCIO (id_Usuario BIGINT NOT NULL, AMBITO VARCHAR(255), apellidos VARCHAR(30) NOT NULL, CARGO VARCHAR(255), direccion VARCHAR(30) NOT NULL, DNI VARCHAR(255), fecha_baja DATE NOT NULL, FECHA_FIRMA DATE, fecha_ingreso DATE NOT NULL, fecha_nacimiento DATE NOT NULL, GRUPO VARCHAR(255), id_Socio BIGINT NOT NULL, INFO_TUTORES VARCHAR(255), localizacion VARCHAR(255) NOT NULL, nombre VARCHAR(30) NOT NULL, PERFIL VARCHAR(255), sexo SMALLINT DEFAULT 0 NOT NULL, telefono INTEGER NOT NULL, telefono_movil INTEGER NOT NULL, SECCION_id_seccion BIGINT, PRIMARY KEY (id_Usuario))
CREATE TABLE TRANSACCION (ID BIGINT NOT NULL, CONCEPTO VARCHAR(255) NOT NULL, FECHA DATE NOT NULL, IMPORTE INTEGER NOT NULL, SOCIO_id_Usuario BIGINT, PRIMARY KEY (ID))
CREATE TABLE Campos_Documento_Plantilla (id_campo_fk BIGINT NOT NULL, id_doc_plantilla_fk BIGINT NOT NULL, PRIMARY KEY (id_campo_fk, id_doc_plantilla_fk))
CREATE TABLE asistencia (asistencia_evento_fk BIGINT NOT NULL, asistencia_socio_fk BIGINT NOT NULL, PRIMARY KEY (asistencia_evento_fk, asistencia_socio_fk))
CREATE TABLE inscripcion (inscripcion_evento_fk BIGINT NOT NULL, inscripcion_socio_fk BIGINT NOT NULL, PRIMARY KEY (inscripcion_evento_fk, inscripcion_socio_fk))
CREATE TABLE SOCIO_EVENTO (Socio_id_Usuario BIGINT NOT NULL, asistentes_id_evento BIGINT NOT NULL, inscritos_id_evento BIGINT NOT NULL, PRIMARY KEY (Socio_id_Usuario, asistentes_id_evento, inscritos_id_evento))
ALTER TABLE COMENTARIO ADD CONSTRAINT CMNTARIOSCdUsuario FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE COMENTARIO ADD CONSTRAINT CMNTRIOVNTidevento FOREIGN KEY (EVENTO_id_evento) REFERENCES EVENTO (id_evento)
ALTER TABLE DOCUMENTO ADD CONSTRAINT DDCPLNTLLddcplntll FOREIGN KEY (DOC_PLANTILLA_id_doc_plantilla) REFERENCES DOCUMENTO_PLANTILLA (id_doc_plantilla)
ALTER TABLE DOCUMENTO ADD CONSTRAINT DCMENTOSCidUsuario FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE ENTRADA_CALENDARIO ADD CONSTRAINT NTRDCLNDARIOSCdsro FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE EVENTO ADD CONSTRAINT VNTOSCCONidseccion FOREIGN KEY (SECCION_id_seccion) REFERENCES SECCION (id_seccion)
ALTER TABLE LINEA_PRESUPUESTO_EVENTO ADD CONSTRAINT LNPRSPSTVNTdprspst FOREIGN KEY (PRESUPUESTO_EVENTO_id_presupuesto) REFERENCES PRESUPUESTO_EVENTO (id_presupuesto)
ALTER TABLE NOTIFICACION_DOCUMENTO ADD CONSTRAINT NTFCCNDDCMNTddcmnt FOREIGN KEY (DOCUMENTO_id_documento) REFERENCES DOCUMENTO (id_documento)
ALTER TABLE NOTIFICACION_DOCUMENTO ADD CONSTRAINT NTFCCNDCMENTOSCdsr FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE NOTIFICACION_EVENTO ADD CONSTRAINT NTFCCNVENTOVNTdvnt FOREIGN KEY (EVENTO_id_evento) REFERENCES EVENTO (id_evento)
ALTER TABLE NOTIFICACION_EVENTO ADD CONSTRAINT NTFCCNVENTOSCdsrio FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE PAGO_CUOTA ADD CONSTRAINT PAGO_CUOTACUOTA_ID FOREIGN KEY (CUOTA_ID) REFERENCES CUOTA (ID)
ALTER TABLE PAGO_CUOTA ADD CONSTRAINT PGCUOTASCidUsuario FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE PAGO_EVENTO ADD CONSTRAINT PGVENTOSCidUsuario FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE PAGO_EVENTO ADD CONSTRAINT PGVENTOVNTidevento FOREIGN KEY (EVENTO_id_evento) REFERENCES EVENTO (id_evento)
ALTER TABLE PRESUPUESTO_EVENTO ADD CONSTRAINT PRSPSTVNTOVNTdvnto FOREIGN KEY (EVENTO_id_evento) REFERENCES EVENTO (id_evento)
ALTER TABLE SOCIO ADD CONSTRAINT SOCIO_id_Usuario FOREIGN KEY (id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE SOCIO ADD CONSTRAINT SCOSCCIONidseccion FOREIGN KEY (SECCION_id_seccion) REFERENCES SECCION (id_seccion)
ALTER TABLE TRANSACCION ADD CONSTRAINT TRNSCCIONSCdsuario FOREIGN KEY (SOCIO_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE Campos_Documento_Plantilla ADD CONSTRAINT CmpsDcmntPlndcmpfk FOREIGN KEY (id_campo_fk) REFERENCES CAMPOS (id_campo)
ALTER TABLE Campos_Documento_Plantilla ADD CONSTRAINT CmpsDcmddcplntllfk FOREIGN KEY (id_doc_plantilla_fk) REFERENCES DOCUMENTO_PLANTILLA (id_doc_plantilla)
ALTER TABLE asistencia ADD CONSTRAINT sstncsstncasociofk FOREIGN KEY (asistencia_socio_fk) REFERENCES USUARIO (id_Usuario)
ALTER TABLE asistencia ADD CONSTRAINT sstncsstnceventofk FOREIGN KEY (asistencia_evento_fk) REFERENCES EVENTO (id_evento)
ALTER TABLE inscripcion ADD CONSTRAINT nscrpcnscrpcnvntfk FOREIGN KEY (inscripcion_evento_fk) REFERENCES EVENTO (id_evento)
ALTER TABLE inscripcion ADD CONSTRAINT nscrpcnnscrpcnscfk FOREIGN KEY (inscripcion_socio_fk) REFERENCES USUARIO (id_Usuario)
ALTER TABLE SOCIO_EVENTO ADD CONSTRAINT SCVENTOScidUsuario FOREIGN KEY (Socio_id_Usuario) REFERENCES USUARIO (id_Usuario)
ALTER TABLE SOCIO_EVENTO ADD CONSTRAINT SCVNTnscrtsdevento FOREIGN KEY (inscritos_id_evento) REFERENCES EVENTO (id_evento)
ALTER TABLE SOCIO_EVENTO ADD CONSTRAINT SCVNTsstntsdevento FOREIGN KEY (asistentes_id_evento) REFERENCES EVENTO (id_evento)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(15), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)
