-- DROP SCHEMA "paginaVentas";

CREATE SCHEMA "paginaVentas" ;

-- Drop table

-- DROP TABLE "paginaVentas".persona;
CREATE TABLE "paginaVentas".categoria (
	idcategoria int4 NOT NULL,
	nombre varchar(120) NOT NULL,
	descripcion varchar(320) NOT NULL,
	estado varchar(120) NOT NULL,
	CONSTRAINT "idCategoria" PRIMARY KEY (idcategoria)
);

CREATE TABLE "paginaVentas".multimedia (
	idmultimedia int4 NOT NULL,
	formato varchar(30) NOT NULL,
	fecha date NOT NULL,
	nombre varchar(60) NOT NULL,
	descripcion varchar(320) NOT NULL,
	CONSTRAINT "idMultimedia" PRIMARY KEY (idmultimedia)
);


CREATE TABLE "paginaVentas".rol (
	idrol int4 NOT NULL,
	nombre varchar(120) NOT NULL,
	descripcion varchar(120) NOT NULL,
	estado varchar(60) NOT NULL,
	permisos varchar(120) NOT NULL,
	CONSTRAINT rol_pk PRIMARY KEY (idrol)
);

CREATE TABLE "paginaVentas".mensaje (
	idmensaje int4 NOT NULL,
	fecha date NOT NULL,
	descripcion varchar(320) NOT NULL,
	idmultimedia int4 NOT NULL,
	contenido varchar(360) NOT NULL,
	CONSTRAINT "idMensaje" PRIMARY KEY (idmensaje),
	CONSTRAINT mensaje_fk FOREIGN KEY (idmultimedia) REFERENCES "paginaVentas".multimedia(idmultimedia)
);

-- Drop table

-- DROP TABLE "paginaVentas".articulo;

CREATE TABLE "paginaVentas".articulo (
	idarticulo int4 NOT NULL,
	idcategoria int4 NOT NULL,
	codigo int4 NOT NULL,
	nombre varchar(120) NOT NULL,
	precio numeric(11, 2) NOT NULL,
	stock int4 NOT NULL,
	estado varchar(120) NOT NULL,
	descripcion varchar(320) NOT NULL,
	idmultimedia int4 NULL,
	CONSTRAINT "idArticulo" PRIMARY KEY (idarticulo),
	CONSTRAINT articulo_fk FOREIGN KEY (idcategoria) REFERENCES "paginaVentas".categoria(idcategoria),
	CONSTRAINT articulo_fk_1 FOREIGN KEY (idmultimedia) REFERENCES "paginaVentas".multimedia(idmultimedia)
);
-- Drop table

-- DROP TABLE "paginaVentas".chat;
CREATE TABLE "paginaVentas"."Usuario" (
	idusuario int4 NOT NULL,
	username varchar(120) NOT NULL,
	"password" varchar(120) NOT NULL,
	idrol int4 NOT NULL,
	idpublicacion int4 NULL,
	CONSTRAINT "idUsuario" PRIMARY KEY (idusuario)
	
);

CREATE TABLE "paginaVentas".chat (
	idchat int4 NOT NULL,
	id1usuario int4 NOT NULL,
	id2usuario int4 NOT NULL,
	idmensaje int4 NOT NULL,
	CONSTRAINT idchat PRIMARY KEY (idchat),
	CONSTRAINT chat_fk FOREIGN KEY (idchat) REFERENCES "paginaVentas".chat(idchat),
	CONSTRAINT chat_fk_1 FOREIGN KEY (id1usuario) REFERENCES "paginaVentas"."Usuario"(idusuario),
	CONSTRAINT chat_fk_2 FOREIGN KEY (id2usuario) REFERENCES "paginaVentas"."Usuario"(idusuario)
);

-- Drop table

-- DROP TABLE "paginaVentas".publicacion;

CREATE TABLE "paginaVentas".publicacion (
	fecha date NOT NULL,
	titulo varchar(120) NOT NULL,
	idarticulo int4 NOT NULL,
	idchat int4 NULL,
	idpublicacion int4 NOT NULL,
	CONSTRAINT publicacion_pk PRIMARY KEY (idpublicacion),
	CONSTRAINT publicacion_fk FOREIGN KEY (idchat) REFERENCES "paginaVentas".chat(idchat),
	CONSTRAINT publicacion_fk_1 FOREIGN KEY (idarticulo) REFERENCES "paginaVentas".articulo(idarticulo)
);

CREATE TABLE "paginaVentas".persona (
	idpersona int4 NOT NULL,
	nombre varchar(60) NOT NULL,
	tipo_persona varchar(120) NOT NULL,
	tipo_documento varchar(120) NOT NULL,
	num_documento varchar(120) NOT NULL,
	direccion varchar(70) NOT NULL,
	telefono varchar(120) NOT NULL,
	email varchar(60) NOT NULL,
	edad int4 NOT NULL,
	genero varchar(120) NOT NULL,
	apellido varchar(120) NOT NULL,
	CONSTRAINT "idPersona" PRIMARY KEY (idpersona)
);





-- Drop table

-- DROP TABLE "paginaVentas".mensaje;


-- Drop table

-- DROP TABLE "paginaVentas".rol;




-- Drop table

-- DROP TABLE "paginaVentas".multimedia;


-- Drop table

-- DROP TABLE "paginaVentas".venta;

CREATE TABLE "paginaVentas".venta (
	idventa int4 NOT NULL,
	idcliente int4 NOT NULL,
	idusuario int4 NOT NULL,
	tipocomprobante varchar(60) NOT NULL,
	"serie-comprobante" int4 NOT NULL,
	"num-comprobante" int4 NOT NULL,
	fecha date NOT NULL,
	total numeric(11, 2) NOT NULL,
	estado varchar(120) NULL,
	CONSTRAINT idventa PRIMARY KEY (idventa),
	CONSTRAINT venta_fk FOREIGN KEY (idcliente) REFERENCES "paginaVentas".persona(idpersona),
	CONSTRAINT venta_fk_1 FOREIGN KEY (idusuario) REFERENCES "paginaVentas"."Usuario"(idusuario)
);

-- Drop table

-- DROP TABLE "paginaVentas".detalle_venta;

CREATE TABLE "paginaVentas".detalle_venta (
	iddetalle int4 NOT NULL,
	idarticulo int4 NOT NULL,
	idventa int4 NOT NULL,
	cantidad int4 NOT NULL,
	precio numeric(11, 2) NOT NULL,
	CONSTRAINT "idDetalle" PRIMARY KEY (iddetalle),
	CONSTRAINT detalle_venta_fk FOREIGN KEY (idarticulo) REFERENCES "paginaVentas".articulo(idarticulo),
	CONSTRAINT detalle_venta_fk_1 FOREIGN KEY (idventa) REFERENCES "paginaVentas".venta(idventa)
);

-- Drop table

-- DROP TABLE "paginaVentas".categoria;



-- Drop table

-- DROP TABLE "paginaVentas"."Usuario";


alter table "paginaVentas"."Usuario"  add CONSTRAINT usuario_fk FOREIGN KEY (idrol) REFERENCES "paginaVentas".rol(idrol);
alter table "paginaVentas"."Usuario" add CONSTRAINT usuario_fk1 FOREIGN KEY (idpublicacion) REFERENCES "paginaVentas".publicacion(idpublicacion);
