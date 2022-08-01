CREATE TABLE "public.produtos" (
	"nome" TEXT NOT NULL,
	"preco" integer NOT NULL,
	"fotoPrincipal" TEXT NOT NULL,
	"categoriaId" integer NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.usuario" (
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "usuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TYPE "tamanhos" AS ENUM ('P','M','G');

CREATE TABLE "public.categorias" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	"fotosId" integer NOT NULL,
	type "tamanhos" NOT NULL,
	CONSTRAINT "categorias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.finalizarCompra" (
	"id" serial NOT NULL,
	"usuarioId" serial NOT NULL,
	"produtosId" serial NOT NULL,
	"estadoAtual" varchar(50) NOT NULL,
	"dataCompra" DATE NOT NULL,
	CONSTRAINT "finalizarCompra_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.enderecoUsuario" (
	"id" serial NOT NULL,
	"estado" TEXT NOT NULL,
	"cidade" TEXT NOT NULL,
	"numero" integer NOT NULL,
	"cep" integer(8) NOT NULL,
	"usuarioId" integer NOT NULL,
	CONSTRAINT "enderecoUsuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id");


ALTER TABLE "categorias" ADD CONSTRAINT "categorias_fk0" FOREIGN KEY ("fotosId") REFERENCES "fotos"("id");

ALTER TABLE "finalizarCompra" ADD CONSTRAINT "finalizarCompra_fk0" FOREIGN KEY ("usuarioId") REFERENCES "usuario"("id");
ALTER TABLE "finalizarCompra" ADD CONSTRAINT "finalizarCompra_fk1" FOREIGN KEY ("produtosId") REFERENCES "produtos"("id");

ALTER TABLE "enderecoUsuario" ADD CONSTRAINT "enderecoUsuario_fk0" FOREIGN KEY ("usuarioId") REFERENCES "usuario"("id");






