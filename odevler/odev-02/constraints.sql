-- Spor Salonu Yönetim Sistemi (Gym Management System)
-- Kısıtlamalar (Constraints)

-- 1. Üyelik paketleri fiyatı pozitif olmalı
ALTER TABLE memberships
ADD CONSTRAINT chk_membership_price_positive CHECK (price > 0);

-- 2. Üye e-posta adresi boş olamaz
ALTER TABLE members
ADD CONSTRAINT chk_member_email_not_null CHECK (email IS NOT NULL);

-- 3. Ödeme tutarı pozitif olmalı
ALTER TABLE payments
ADD CONSTRAINT chk_payment_amount_positive CHECK (amount > 0);

-- 4. Geçerli ödeme yöntemi kontrolü (Cash veya Credit Card olmalı)
ALTER TABLE payments
ADD CONSTRAINT chk_payment_method_valid CHECK (payment_method IN ('cash', 'credit_card'));