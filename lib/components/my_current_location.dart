import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/model/restaurent.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  openLocationSearchBox(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Location'),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Search Adress...'),
        ),
        actions: [
          //save btn
          MaterialButton(
            onPressed: () {
              String newAddress = textEditingController.text;
              context.read<Restaurent>().updateAddress(newAddress);
              Navigator.pop(context);
              textEditingController.clear();
            },
            child: const Text("Save"),
          ),
          //cancel btn
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurent>(
                  builder: (context, restaurent, child) => Text(
                    restaurent.deliveryAddress,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                //drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
