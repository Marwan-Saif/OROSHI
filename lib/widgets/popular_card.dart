import 'package:flutter/material.dart';

class PopularFoodCard extends StatelessWidget {
  final String title, price, rating, emoji;
  const PopularFoodCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15), // مسافة بين الكروت تحت بعض
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // الجزء اللي فيه الصورة (الإيموجي)
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1), // خلفية خفيفة للصورة
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 35)),
            ),
          ),
          const SizedBox(width: 15),

          // اسم الأكلة والسعر
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$ $price",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // التقييم وأيقونة القلب
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.favorite_border, color: Colors.grey, size: 22),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orangeAccent, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
