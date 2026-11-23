\set VERBOSITY verbose
BEGIN;

-- Önce: Sıcak İçecek fiyatları
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;

-- Komut 1: 'Sıcak İçecek' ürünlerinin fiyatını 5 artır
UPDATE product SET price = price + 5 WHERE category = 'Sıcak İçecek';

-- Sonra: Sıcak İçecek fiyatları (5 TL artmış hali)
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;

-- Komut 2: Var olmayan 999 numaralı ürünü bir siparişe ekle (Hata verecek)
INSERT INTO order_item (order_id, product_id, quantity) VALUES (1, 999, 2);

ROLLBACK;

-- ROLLBACK sonrası: Sıcak İçecek fiyatları (İşlem geri alındığı için ilk haline dönmeli)
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;