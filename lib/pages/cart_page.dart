import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/my_button.dart';
import 'package:quickbite/components/my_cart_tile.dart';
import 'package:quickbite/model/restaurent.dart';
import 'package:quickbite/pages/payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(builder: (context, restaurent, child) {
      //cart
      final userCart = restaurent.cart;
      //Scaffold UI
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          'Are you sure you want to Clear the Cart?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurent.clearCart();
                          },
                          child: const Text('DELETE',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete_rounded))
          ],
        ),
        body: Column(
          children: [
            //LIST OF CART
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/images/drinks/empty-cart.png',
                                  height: 180,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Cart is Empty!')
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];
                                //return Cart Title UI
                                return MyCartTile(cartItem: cartItem);
                              }),
                        ),
                ],
              ),
            ),
            //BTN TO PAY
            MyButton(
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage()));
                },
                text: 'Go to Checkout '),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    });
  }
}
