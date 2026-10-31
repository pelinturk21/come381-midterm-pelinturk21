-- Bölüm B: Kısıtlama İhlal Testleri (Violations Test)

-- 1. Test: Fiyatı negatif olan üyelik paketi ekleme (chk_membership_price_positive ihlali)
INSERT INTO memberships (package_name, duration_months, price) 
VALUES ('VIP Paket', 12, -500.00);

-- 2. Test: E-posta adresi NULL olan üye ekleme (members.email NOT NULL ihlali)
INSERT INTO members (first_name, last_name, email, phone) 
VALUES ('Ahmet', 'Yılmaz', NULL, '5551234567');

-- 3. Test: Aynı e-posta adresine sahip ikinci bir üye ekleme (uq_member_email ihlali)
INSERT INTO members (first_name, last_name, email, phone) 
VALUES ('Mehmet', 'Demir', 'ahmet@example.com', '5559876543');

-- 4. Test: Negatif ödeme tutarı ekleme (chk_payment_amount_positive ihlali)
INSERT INTO payments (member_id, amount, payment_method) 
VALUES (1, -50.00, 'cash');

-- 5. Test: Geçersiz ödeme yöntemi ekleme (chk_payment_method_valid ihlali)
INSERT INTO payments (member_id, amount, payment_method) 
VALUES (1, 200.00, 'bitcoin');