import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/model/restaurent.dart';

class MyReciept extends StatelessWidget {
  const MyReciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
      child: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thank You for placing an Order!',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.all(25),
                child: Consumer<Restaurent>(
                    builder: (context, restaurent, child) =>
                        Text(restaurent.displayCartReceipt())),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Estimated Delivery Time : 15-20 mins',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
