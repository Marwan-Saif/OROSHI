// كلاس المكونات (Ingredients)
class SushiItem {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final String category;
  final double price;
  final double? priceAfterSale;
  final double rate;
  final int stockNumber;
  bool isFavorite;

  final NutritionFacts totalNutrition; // اجمالي السعرات للوجبة
  final List<Ingredient> ingredients; // قائمة المكونات

  SushiItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    this.priceAfterSale,
    required this.rate,
    required this.stockNumber,
    this.isFavorite = false,
    required this.totalNutrition,
    required this.ingredients,
  });
}

class Ingredient {
  final String id;
  final String name;
  final String image;
  final NutritionFacts nutrition; // تفاصيل السعرات لكل مكون

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
    required this.nutrition,
  });
}

// كلاس حقائق التغذية (Nutrition Facts)
class NutritionFacts {
  final double calories;
  final double carbs;
  final double fats;
  final double protein;
  final double? fiber; // اختياري

  NutritionFacts({
    required this.calories,
    required this.carbs,
    required this.fats,
    required this.protein,
    this.fiber,
  });
}
