import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickbite/model/cart_item.dart';
import 'package:quickbite/model/food.dart';

class Restaurent extends ChangeNotifier {
  //list of Food Menu
  final List<Food> _menu = [
    //B U R G E R S
    Food(
        foodname: 'Classic CheeseBurger',
        description:
            'A juicy beef patty topped with melted cheddar cheese, lettuce, tomato, pickles, and our special sauce, served on a toasted bun.',
        imagePath: 'lib/images/burgers/classic_cheeseburger.jpeg',
        price: 8.99,
        availableAddons: [
          Addon(name: 'Bacon', price: 1.50),
          Addon(name: 'Extra Cheese', price: 1.00),
          Addon(name: 'Avocado', price: 2.00),
        ],
        category: FoodCategory.burgers),
    Food(
        foodname: 'BBQ Bacon Burger',
        description:
            'A hearty beef patty topped with crispy bacon, smoky BBQ sauce, cheddar cheese, and onion rings, served on a brioche bun.',
        imagePath: 'lib/images/burgers/bbq_bacon_brgr.jpeg',
        price: 10.99,
        availableAddons: [
          Addon(name: 'Jalapenos', price: 0.75),
          Addon(name: 'Extra BBQ Sauce', price: 0.50),
          Addon(name: 'Fried Egg', price: 1.50),
        ],
        category: FoodCategory.burgers),
    Food(
        foodname: 'Veggie Burger',
        description:
            'A flavorful veggie patty made with black beans, corn, and spices, topped with avocado, lettuce, tomato, and a tangy cilantro-lime sauce, served on a whole grain bun.',
        imagePath: 'lib/images/burgers/veggie_brgr.png',
        price: 9.49,
        availableAddons: [
          Addon(name: 'Grilled Mushrooms', price: 1.50),
          Addon(name: 'Swiss Cheese', price: 1.00),
          Addon(name: 'Extra Avocado', price: 2.00),
        ],
        category: FoodCategory.burgers),
    //D E S E R T S
    Food(
        foodname: 'Chocolate Lava Cake',
        description:
            'A rich and gooey chocolate cake with a molten center, served with vanilla ice cream.',
        imagePath: 'lib/images/desserts/dsrt_choco_lava_cake.png',
        price: 6.99,
        availableAddons: [
          Addon(name: 'Caramel Sauce', price: 0.75),
          Addon(name: 'Extra ice Cream', price: 1.50),
          Addon(name: 'Whipped Cream', price: 1.00),
        ],
        category: FoodCategory.desserts),
    Food(
        foodname: 'New York Cheesecake',
        description:
            'Creamy and smooth cheesecake with a graham cracker crust, served with fresh strawberry sauce.',
        imagePath: 'lib/images/desserts/dsrt_ny_cheesecake.png',
        price: 5.49,
        availableAddons: [
          Addon(name: 'Fresh Berries', price: 2.00),
          Addon(name: 'Chocolate Drizzle', price: 1.00),
          Addon(name: 'Whipped Cream', price: 1.00),
        ],
        category: FoodCategory.desserts),
    Food(
        foodname: 'Apple Pie',
        description:
            'A classic apple pie with a flaky crust and spiced apple filling, served with a scoop of vanilla ice cream.',
        imagePath: 'lib/images/desserts/dsrt_apple_pie.png',
        price: 5.49,
        availableAddons: [
          Addon(name: 'Caramel Sauce', price: 0.75),
          Addon(name: 'Extra Ice Cream', price: 1.50),
          Addon(name: 'Whipped Cream', price: 1.00),
        ],
        category: FoodCategory.desserts),
    //S A L A D S
    Food(
        foodname: 'Caesar Salad',
        description:
            'Crisp romaine lettuce tossed with creamy Caesar dressing, Parmesan cheese, and garlic croutons.',
        imagePath: 'lib/images/salads/caesar_salad.png',
        price: 7.99,
        availableAddons: [
          Addon(name: 'Grilled Chicken', price: 3.00),
          Addon(name: 'Shrimp', price: 4.00),
          Addon(name: 'Bacon Bits', price: 1.50),
        ],
        category: FoodCategory.salads),
    Food(
        foodname: 'Greek Salad',
        description:
            'A fresh mix of cucumbers, tomatoes, red onions, Kalamata olives, and feta cheese, served with a tangy Greek dressing.',
        imagePath: 'lib/images/salads/greek_salad.png',
        price: 8.99,
        availableAddons: [
          Addon(name: 'Grilled Lamb', price: 4.00),
          Addon(name: 'Extra Feta', price: 1.50),
          Addon(name: 'Hummus', price: 2.50),
        ],
        category: FoodCategory.salads),
    Food(
        foodname: 'SouthWest Salad',
        description:
            'Mixed greens topped with grilled corn, black beans, avocado, cherry tomatoes, and a zesty chipotle-lime dressing.',
        imagePath: 'lib/images/salads/southwest_salad.png',
        price: 9.49,
        availableAddons: [
          Addon(name: 'Grilled Chicken', price: 3.00),
          Addon(name: 'Tortilla Strips', price: 1.00),
          Addon(name: 'Jalapenos', price: 0.75),
        ],
        category: FoodCategory.salads),
    //S I D E S
    Food(
        foodname: 'French Fries',
        description:
            'Classic crispy golden fries, lightly salted and served hot.',
        imagePath: 'lib/images/sides/sides_frenchfires.png',
        price: 3.49,
        availableAddons: [
          Addon(name: 'Cheese Sauce', price: 1.00),
          Addon(name: 'Chili', price: 1.50),
          Addon(name: 'Bacon Bits', price: 1.00),
        ],
        category: FoodCategory.sides),
    Food(
        foodname: 'Onion Rings',
        description:
            'Thick-cut onion rings, battered and fried to a golden crisp.',
        imagePath: 'lib/images/sides/sides_onion_rings.png',
        price: 4.49,
        availableAddons: [
          Addon(name: 'Ranch Dressing', price: 1.00),
          Addon(name: 'BBQ Sauce', price: 1.50),
          Addon(name: 'Extra Crispy', price: 1.00),
        ],
        category: FoodCategory.sides),
    Food(
        foodname: 'Garlic Parmesan Knots',
        description:
            'Warm, buttery garlic knots topped with Parmesan cheese and fresh parsley.',
        imagePath: 'lib/images/sides/sides_parm_knots.png',
        price: 5.49,
        availableAddons: [
          Addon(name: 'Marinara Sauce', price: 1.50),
          Addon(name: 'Extra Garlic Butter', price: 0.50),
          Addon(name: 'Mozzarella Cheese', price: 1.75),
        ],
        category: FoodCategory.sides),
    //D R I N K S
    Food(
        foodname: 'Fresh Lemonade',
        description:
            ' Refreshing homemade lemonade with a perfect balance of sweet and tart.',
        imagePath: 'lib/images/drinks/drinks_lemonade.png',
        price: 2.49,
        availableAddons: [
          Addon(name: 'Fresh Mint', price: 0.50),
          Addon(name: 'Extra Lemon', price: 0.25),
        ],
        category: FoodCategory.drinks),
    Food(
        foodname: 'Iced Coffee',
        description:
            ' Cold-brewed coffee served over ice, with your choice of milk and sweetener.',
        imagePath: 'lib/images/drinks/drinks_iced_coffee.png',
        price: 3.49,
        availableAddons: [
          Addon(name: 'Flavoured Syrup', price: 0.75),
          Addon(name: 'Extra Shot of Expresso', price: 1.00),
          Addon(name: 'Whipped Cream', price: 0.50),
        ],
        category: FoodCategory.drinks),
    Food(
        foodname: 'Berry Smoothie',
        description:
            ' A blend of mixed berries, yogurt, and honey, perfect for a refreshing treat.',
        imagePath: 'lib/images/drinks/drinks_berry_smoothie.png',
        price: 4.49,
        availableAddons: [
          Addon(name: 'Protein Powder', price: 2.50),
          Addon(name: 'Chia Seeds', price: 0.50),
          Addon(name: 'Spinach ', price: 0.50),
        ],
        category: FoodCategory.drinks),
    //P I Z Z A
    Food(
        foodname: 'Margherita Pizza',
        description:
            ' Classic pizza topped with fresh mozzarella, tomatoes, basil, and a drizzle of olive oil.',
        imagePath: 'lib/images/pizzas/pizza_margherita.png',
        price: 12.99,
        availableAddons: [
          Addon(name: 'Extra Cheese', price: 1.50),
          Addon(name: 'Pepperoni', price: 2.00),
          Addon(name: 'Olives ', price: 1.50),
        ],
        category: FoodCategory.pizzas),
    Food(
        foodname: 'Pepperoni Pizza',
        description:
            ' A favorite, with pepperoni slices, mozzarella cheese, and marinara sauce.',
        imagePath: 'lib/images/pizzas/pizza_pepperoni.png',
        price: 13.99,
        availableAddons: [
          Addon(name: 'Extra Pepproni', price: 2.00),
          Addon(name: 'Mushrooms', price: 2.00),
          Addon(name: 'Jalapenos ', price: 0.75),
        ],
        category: FoodCategory.pizzas),
    Food(
        foodname: 'Veggie Supreme Pizza',
        description:
            ' A colorful mix of bell peppers, onions, mushrooms, olives, and spinach on a bed of mozzarella and marinara sauce.',
        imagePath: 'lib/images/pizzas/pizza_veggie_sup.png',
        price: 14.99,
        availableAddons: [
          Addon(name: 'Artichokes', price: 2.50),
          Addon(name: 'Extra Cheese', price: 1.50),
          Addon(name: 'Sun-Dried Tomatoes ', price: 1.50),
        ],
        category: FoodCategory.pizzas),
  ];

  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //delivery address
  String deliveryAddress = '69/01 Hollywood blvd';

  //operations
  final List<CartItem> _cart = [];
  //-add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;
      //check if the list of selectedAddons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddon, selectedAddons);
      return isSameFood && isSameAddons;
    });
    //if item already exist just increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddon: selectedAddons));
      notifyListeners();
    }
  }

  //-remove from cart
  void removeFromCart(CartItem cartItem) {
    int _cartIndex = _cart.indexOf(cartItem);
    if (_cartIndex != -1) {
      if (_cart[_cartIndex].quantity > 1) {
        _cart[_cartIndex].quantity--;
      } else {
        _cart.removeAt(_cartIndex);
      }
    }
    notifyListeners();
  }

  //-get Total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double ItemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddon) {
        ItemTotal += addon.price;
      }
      total += ItemTotal * cartItem.quantity;
    }
    return total;
  }

  //-Total No. of items in  cart
  int getTotalItemCount() {
    int totalItemcount = 0;
    for (CartItem cartItem in _cart) {
      totalItemcount += cartItem.quantity;
    }
    return totalItemcount;
  }

  //-clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateAddress(String newAddress) {
    deliveryAddress = newAddress;
    notifyListeners();
  }

  //helper methods
  //-generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Heres Your Receipt.");
    receipt.writeln();
    //format the date to include up to seconds only
    String _formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(_formattedDate);
    receipt.writeln();
    receipt.writeln('------------------');

    for (final CartItem in _cart) {
      receipt.writeln(
          '${CartItem.quantity} x ${CartItem.food.foodname} = ${_formatPrice(CartItem.food.price)}');
      if (CartItem.selectedAddon.isNotEmpty) {
        receipt.writeln('Add-Ons');
        receipt.writeln(_formatAddons(CartItem.selectedAddon));
        receipt.writeln();
      }
      receipt.writeln();
    }
    receipt.writeln('-----------------');
    receipt.writeln();
    receipt.writeln('Total Number of Items : ${getTotalItemCount()}');
    receipt.writeln('Total Price : ${_formatPrice(getTotalPrice())}');

    return receipt.toString();
  }

  //-format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //-format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)}) ")
        .join(', ');
  }
}
