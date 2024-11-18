import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var MyPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var MySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery Fee
          Column(
            children: [
              Text('\$0.99', style: MyPrimaryTextStyle),
              Text(
                'Delivery Fee',
                style: MySecondaryTextStyle,
              )
            ],
          ),
          //delivery Time
          Column(
            children: [
              Text(
                '15-30 mins',
                style: MyPrimaryTextStyle,
              ),
              Text(
                'Delivery Time',
                style: MySecondaryTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
