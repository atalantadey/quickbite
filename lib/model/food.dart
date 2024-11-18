class Food {
  final String foodname; //cheese burger
  final String description; //a burger full of cheese
  final String imagePath; //'lib/images/chees_burger.png
  final double price; //4.99
  final FoodCategory category; //burger
  List<Addon> availableAddons; //[extra cheese,extra sauce]

  Food({
    required this.foodname,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.availableAddons,
    required this.category,
  });
}

// food categories
enum FoodCategory { burgers, salads, sides, desserts, drinks, pizzas }

// food addons
class Addon {
  double price;
  String name;
  Addon({required this.name, required this.price});
}
