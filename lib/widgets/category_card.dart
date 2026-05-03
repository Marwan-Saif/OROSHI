import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  final String title, emoji;
  final VoidCallback onTap;
  const CategoryBtn({
    super.key,
    required this.title,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFEFECEC), // لون رمادي فاتح
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [Text(emoji), const SizedBox(width: 8), Text(title)],
        ),
      ),
    );
  }
}
