import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oroshi/widgets/bottom_container.dart';
import 'package:oroshi/widgets/category_card.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.emoji,
  });
  final String
  title,
  price,
  rating,
  emoji,
  description =
      "وصف الأكلة هنا. ممكن يكون طويل شوية عشان نختبر شكل النصوص الطويلة في الصفحة.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/Sushi_name_japan.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        Icon(Icons.favorite_border, size: 30),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 30,
                    child: Image.asset(
                      "assets/images/Sushi_name_white.png",
                      color: Colors.black,
                      height: 200,
                      // fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 50,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(emoji, style: const TextStyle(fontSize: 150)),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 20,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Ingredients",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryBtn(title: "Rice", emoji: "🍚", onTap: () {}),
                          CategoryBtn(title: "Fish", emoji: "🐟", onTap: () {}),
                          CategoryBtn(
                            title: "Seaweed",
                            emoji: " seaweed",
                            onTap: () {},
                          ),
                          CategoryBtn(
                            title: "Avocado",
                            emoji: "🥑",
                            onTap: () {},
                          ),
                          CategoryBtn(
                            title: "Cucumber",
                            emoji: "🥒",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Description",
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomContainer(),
    );
  }
}
