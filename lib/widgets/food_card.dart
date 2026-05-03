import 'package:flutter/material.dart';
import 'package:oroshi/bages/item_page.dart';

class FoodCard extends StatelessWidget {
  final String title, price, rating, emoji;
  const FoodCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ItemPage(
            emoji: emoji,
            price: price,
            rating: rating,
            title: title,
          ),
        ),
      ),
      child: Container(
        width: 160, // تحديد عرض ثابت للكارت عشان الـ ListView الأفقي
        margin: const EdgeInsets.only(right: 15), // مسافة بين الكروت
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(150), // خلفية بيضاء مع شفافية خفيفة
          borderRadius: BorderRadius.circular(25), // BorderRadius دائري أكتر
          boxShadow: [
            // Shadow ناعم جداً زي اللي في الصورة
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // عشان الكارت مياخدش طول الشاشة كلها
          children: [
            // أيقونة القلب في أعلى اليمين
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border, color: Colors.grey, size: 22),
            ),

            // صورة الأكل (الـ Emoji في حالتنا) في المنتصف
            Expanded(
              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 60), // تكبير حجم الإيموجي
                ),
              ),
            ),

            const SizedBox(height: 15),

            // اسم الأكلة
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // لضمان عدم خروج النص
            ),

            const SizedBox(height: 10),

            // السعر والتقييم في نفس السطر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ $price",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
