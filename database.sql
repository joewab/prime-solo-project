CREATE TABLE IF NOT EXISTS "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL
);

CREATE TABLE IF NOT EXISTS "image" (
	"id" serial NOT NULL,
	"url" varchar(255555) NOT NULL,
	"description" varchar(2555) NOT NULL,
	"artist" varchar(255) NOT NULL,
	"title" varchar(255) NOT NULL,
	"year" bigint NOT NULL,
	"medium" varchar(255) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "gallery" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "gallery_image" (
	"id" serial NOT NULL,
	"gallery_id" bigint NOT NULL,
	"image_id" bigint NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Score" (
	"id" serial NOT NULL,
	"score" bigint NOT NULL,
	"user_id" bigint NOT NULL,
	"gallery_id" bigint NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "user_gallery" (
	"id" serial NOT NULL UNIQUE,
	"user_id" bigint NOT NULL,
	"gallery_id" bigint NOT NULL,
	"relationship" varchar(255),
	PRIMARY KEY ("id")
);




ALTER TABLE "gallery_image" ADD CONSTRAINT "gallery_image_fk1" FOREIGN KEY ("gallery_id") REFERENCES "gallery"("id");

ALTER TABLE "gallery_image" ADD CONSTRAINT "gallery_image_fk2" FOREIGN KEY ("image_id") REFERENCES "image"("id");
ALTER TABLE "Score" ADD CONSTRAINT "Score_fk2" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "Score" ADD CONSTRAINT "Score_fk3" FOREIGN KEY ("gallery_id") REFERENCES "gallery"("id");
ALTER TABLE "user_gallery" ADD CONSTRAINT "user_gallery_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "user_gallery" ADD CONSTRAINT "user_gallery_fk2" FOREIGN KEY ("gallery_id") REFERENCES "gallery"("id");