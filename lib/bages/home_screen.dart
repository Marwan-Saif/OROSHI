import 'package:flutter/material.dart';
import 'package:oroshi/core/theme.dart';
import 'package:oroshi/widgets/category_card.dart';
import 'package:oroshi/widgets/food_card.dart';
import 'package:oroshi/widgets/popular_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final ScrollController _scrollController = ScrollController();

  // Keys عشان السكرول يروح للمكان الصح
  final GlobalKey _sushiKey = GlobalKey();
  final GlobalKey _ramenKey = GlobalKey();
  final GlobalKey _comboKey = GlobalKey();
  final GlobalKey _drinksKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    // مع الـ Slivers بنستخدم context العنصر عشان نوصله
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.graycolor,
      body: SafeArea(
        child: CustomScrollView(
          // controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: _buildTopBar(),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildPromoCard(),
                    const SizedBox(height: 20),
                    _buildSearchBar(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverAppBar(
              elevation: 0,
              pinned: true,
              // toolbarHeight: 100,
              // expandedHeight: 300,
              flexibleSpace: Container(
                // height: 50,
                color: AppColors.graycolor,
                alignment: Alignment.center,
                child: _buildCategoriesRow(),
              ),
              leading: const SizedBox(),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildSection(
                    key: _sushiKey,
                    title: "Sushi Menu",
                    emoji: "🍣",
                    itemCount: 4,
                  ),
                  _buildSection(
                    key: _ramenKey,
                    title: "Ramen Special",
                    emoji: "🍜",
                    itemCount: 6,
                  ),
                  _buildSection(
                    key: _comboKey,
                    title: "Family Combo",
                    emoji: "🍱",
                    itemCount: 2,
                  ),
                  _buildSection(
                    key: _drinksKey,
                    title: "Cold Drinks",
                    emoji: "🥤",
                    itemCount: 4,
                  ),
                  const SizedBox(height: 100),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Popular Food",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const PopularFoodCard(
                      title: "Salmon Eggs",
                      price: "25.00",
                      rating: "4.8",
                      emoji: "🍣",
                    ),
                    const PopularFoodCard(
                      title: "Tako Sushi",
                      price: "18.00",
                      rating: "4.5",
                      emoji: "🐙",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- الـ Widgets الفرعية ---

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.notes_rounded, size: 30),
        const Text(
          "Menu",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const CircleAvatar(
          backgroundColor: Color(0xFFD9D9D9),
          child: Icon(Icons.person_outline),
        ),
      ],
    );
  }

  Widget _buildCategoriesRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CategoryBtn(
            title: "Sushi",
            emoji: "🍣",
            onTap: () => _scrollToSection(_sushiKey),
          ),
          CategoryBtn(
            title: "Ramen",
            emoji: "🍜",
            onTap: () => _scrollToSection(_ramenKey),
          ),
          CategoryBtn(
            title: "Combo",
            emoji: "🍱",
            onTap: () => _scrollToSection(_comboKey),
          ),
          CategoryBtn(
            title: "Drinks",
            emoji: "🥤",
            onTap: () => _scrollToSection(_drinksKey),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required GlobalKey key,
    required String title,
    required String emoji,
    required int itemCount,
  }) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) => FoodCard(
            emoji: emoji,
            title: "$title $index",
            price: "12.99",
            rating: "4.${index + 1}",
          ),
        ),
      ],
    );
  }

  Widget _buildPromoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withAlpha(180),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get 32% Promo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FittedBox(
                  child: Container(
                    // width: double.infinity,
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whitecolor.withAlpha(70),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Buy Food ",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.whitecolor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(flex: 1, child: Text("🐙", style: TextStyle(fontSize: 40))),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(150),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search here",
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}
