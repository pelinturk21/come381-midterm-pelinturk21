# Bölüm 2: NULL deneyi

## Deney 1
* **Tahminim:** Tüm müşteri sayısı ile telefon numarası olan müşteri sayısı eşit çıkmaz; çünkü bazı müşterilerin telefon numarası NULL (boş) bırakılmıştır.
* **Sonuç:** `count(*)` değeri tablodaki toplam müşteri sayısını verirken, `count(phone)` sadece telefon alanı dolu olan müşteri sayısını vermiştir ve sayı daha küçük çıkmıştır.
* **Yorum:** NULL, "değer yok" anlamına gelir. Sıfır ya da boşluk değildir; veritabanında o alanın bilinmediğini veya girilmediğini ifade eder. Bu yüzden istatistiki hesaplamalarda NULL değerler sayma işlemlerinin dışında kalır.