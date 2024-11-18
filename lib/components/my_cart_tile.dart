import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/my_quantity_selector.dart';
import 'package:quickbite/model/cart_item.dart';
import 'package:quickbite/model/restaurent.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(
        builder: (context, restaurent, child) => Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      //food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //name & price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.foodname,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                          Text(
                            '\$${cartItem.food.price}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ],
                      ),
                      const Spacer(),
                      //counter for incre/decre quantity
                      MyQuantitySelector(
                          food: cartItem.food,
                          quantity: cartItem.quantity,
                          onDecrement: () {
                            restaurent.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            restaurent.addToCart(
                                cartItem.food, cartItem.selectedAddon);
                          }),
                    ],
                  ),
                  //All the Addons
                  SizedBox(
                    height: cartItem.selectedAddon.isEmpty ? 0 : 60,
                    child: ListView(
                      padding: const EdgeInsets.only(left: 5),
                      scrollDirection: Axis.horizontal,
                      children: cartItem.selectedAddon
                          .map(
                            (addon) => Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: FilterChip(
                                label: Row(
                                  children: [
                                    //addon name
                                    Text(
                                      addon.name,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary),
                                    ),

                                    //addon price
                                    Text(' (\$${addon.price})',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary)),
                                  ],
                                ),
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                onSelected: (value) {},
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ));
  }
}
