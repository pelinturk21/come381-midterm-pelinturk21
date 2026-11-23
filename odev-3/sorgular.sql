-- Q1: Fiyatı 50 TL'den yüksek ürünleri pahalıdan ucuza sırala.
-- Ne işe yarar: Bütçesi yüksek olan ürünleri hızlıca listelememizi sağlar.
SELECT name, price 
FROM product 
WHERE price > 50 
ORDER BY price DESC;

-- Q2: 'YBS' bölümündeki müşterilerin adlarını alfabetik sırala.
-- Ne işe yarar: Hedef departmandaki kişileri düzenli şekilde görmemizi sağlar.
SELECT full_name, department 
FROM customer 
WHERE department = 'YBS' 
ORDER BY full_name ASC;

-- Q3: Her siparişin numarasını, tarihini ve müşterinin adını listele.
-- Ne işe yarar: Hangi siparişin hangi müşteriye ait olduğunu eşleştirmemizi sağlar.
SELECT o.order_id, o.order_date, c.full_name 
FROM orders o 
INNER JOIN customer c ON o.customer_id = c.customer_id;

-- Q4: Her sipariş kaleminin ürün adını ve adetini listele.
-- Ne işe yarar: Siparişlerin içeriğinde hangi üründen kaçar adet satıldığını gösterir.
SELECT p.name, oi.quantity 
FROM order_item oi 
INNER JOIN product p ON p.product_id = oi.product_id;

-- Q5: Her müşterinin kaç sipariş verdiğini müşteri adıyla listele.
-- Ne işe yarar: En sadık veya aktif müşterileri analiz etmemize yardımcı olur.
SELECT c.full_name, COUNT(o.order_id) AS toplam_siparis 
FROM customer c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.full_name;

-- Q6: Her ürün kategorisinin ortalama fiyatını bul.
-- Ne işe yarar: Kategorilerin genel fiyat eğilimlerini görmemizi sağlar.
SELECT category, AVG(price) AS ortalama_fiyat 
FROM product 
GROUP BY category;