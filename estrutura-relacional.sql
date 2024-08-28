 GNU nano 5.8                                              estrutura_relacional.sql
CREATE SEQUENCE if not exists order_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

CREATE SEQUENCE if not exists order_item_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

CREATE SEQUENCE if not exists order_payment_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

CREATE TABLE customer_order (
order_id bigint NOT NULL,
order_description varchar(256) NOT NULL,
order_date timestamp(0) without time zone NOT NULL,
CONSTRAINT order_pkey PRIMARY KEY (order_id)
);