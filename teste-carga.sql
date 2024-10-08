 GNU nano 5.8                                                   teste_carga.sql
\set order_item_quantity random(1,100)
\set order_item_price double(random(1,1000))
\set order_payment double(random(1, :order_item_price))
\set order_update_id random(1,10000000)
\set order_delete_id random(1,10000000)

BEGIN;

-- get a unique number for customer order
SELECT nextval('order_seq') \gset p_

-- insert customer_order
INSERT INTO customer_order(order_id, order_description, order_date) VALUES (:p_nextval, concat('description for order',:p_nextval), CURRENT_>

-- insert order item
INSERT INTO order_item(order_id, item_description, quantity, price) VALUES (:p_nextval, concat('item count is ',:order_item_quantity) ,:orde>

-- insert order payment
INSERT INTO order_payment(order_id, amount, payment_date) VALUES (:p_nextval, :order_payment, CURRENT_TIMESTAMP);

-- update random order item
UPDATE order_item set item_description = concat(item_description,' random update') WHERE order_id = :order_update_id;

-- delete random order item
DELETE FROM order_item WHERE order_id = :order_delete_id;

END;